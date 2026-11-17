/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// Per-property value-level assertions for the onChildTouchTest event data.
// All cases enter the View_Column_comattr_onChildTouch_Default page, reset the
// OnChildTouchRecords direct-capture buffer, inject gestures with a known touch point
// (dragBlankAreaBelowMyList / clickMyButton from Column_comattr_onChildTouch_1_test.cj,
// same package), then assert each TouchTestInfo property point SEPARATELY (one test case
// per property group, one @Expect per property point), never on serialized status text.
// Per ace_engine FrameNode::CollectTouchInfos the info array covers every direct child of
// the callback node that has an inspector id, and the CJ FFI passes the raw pipeline px
// values, so every recorded field is verifiable against the ui_test bounds:
//   x/y          touch point relative to the recorded child's top-left
//   parentX/Y    touch point relative to the callback node (Column_comattr_id)
//   windowX/Y    touch point in window coordinates (fullscreen app: the ui_test point)
//   rect.x/y/w/h recorded child's frame rect relative to the callback node
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Column_comattr_onChildTouch_1.*
import ohos.arkui.component.custom_component.CustomView
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText
import kit.PerformanceAnalysisKit.Hilog
import std.collection.*
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*

import ohos.base.*
import ohos.ui_test.*
import ohos.ui_test
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.Hilog
import ohos_app_cangjie_entry.*

// Direct children of Column_comattr_id that carry an id (must all appear in every invocation).
let COLUMN_VALUE_CHILD_IDS: Array<String> =
    ["MyButton", "MyList", "touchInfoStatusText", "dispatchStatusText", "callbackStatusText"]

// Tolerance for Float32 rounding of the recorded values vs the Int32 ui_test bounds.
let TOUCH_VALUE_TOLERANCE_PX: Float64 = 2.0

func touchValueNear(actual: Float64, expected: Float64): Bool {
    actual >= expected - TOUCH_VALUE_TOLERANCE_PX && actual <= expected + TOUCH_VALUE_TOLERANCE_PX
}

func touchEntriesHaveId(entries: Array<TouchTestRecordEntry>, id: String): Bool {
    for (entry in entries) {
        if (entry.id == id) {
            return true
        }
    }
    return false
}

func touchChildBounds(id: String): ui_test.Rect {
    TestDriver.driver.findComponent(On().id(id)).getOrThrow().getBounds()
}

private func enterValueView(caseName: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
    launch {
        modtestSuiteText[0] = "Column_comattr_onChildTouch_value_test"
        modtestCaseText[0] = caseName
        modtestView[0] = {_: CustomView => View_Column_comattr_onChildTouch_Default(Option<CustomView>.None)}
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
    OnChildTouchRecords.reset()
}

@Test
class Column_comattr_onChildTouch_value_test {
    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_value_0100
     * @tc.name      : TestCase_ValueCountAndIds
     * @tc.desc      : value-level invocation count / entry count / id: drag and click each trigger exactly one callback, each invocation carries exactly the five id'd direct children of the Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueCountAndIds(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueCountAndIds begins.")
        enterValueView("TestCase_ValueCountAndIds")
        dragBlankAreaBelowMyList()
        sleepFor(300.milliSecond)
        clickMyButton()
        sleepFor(300.milliSecond)
        // invocation count property: exactly one callback per injected gesture
        @Expect(OnChildTouchRecords.invocations.size, 2)
        for (i in 0..2) {
            let entries = OnChildTouchRecords.entriesOf(i)
            // entry count property: every id'd direct child of the callback Column
            @Expect(entries.size, COLUMN_VALUE_CHILD_IDS.size)
            // id property: each expected child id appears (size equality above rules out extras)
            for (expectedId in COLUMN_VALUE_CHILD_IDS) {
                @Expect(touchEntriesHaveId(entries, expectedId), true)
            }
        }
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueCountAndIds ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_value_0200
     * @tc.name      : TestCase_ValueChildPoint
     * @tc.desc      : value-level x/y: touch point relative to each recorded child's top-left matches the injected point and the child bounds (drag down-point also covers negative values)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueChildPoint(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueChildPoint begins.")
        enterValueView("TestCase_ValueChildPoint")
        let (downX, downY) = dragBlankAreaBelowMyList()
        sleepFor(300.milliSecond)
        let (clickX, clickY) = clickMyButton()
        sleepFor(300.milliSecond)
        @Expect(OnChildTouchRecords.invocations.size, 2)
        // x/y property of the drag (touch-down in the blank gap below MyList)
        let dragEntries = OnChildTouchRecords.entriesOf(0)
        for (entry in dragEntries) {
            let childRect = touchChildBounds(entry.id)
            Hilog.info(0u32, "CangjieTest",
                "ValueChildPoint drag: id=${entry.id} x=${entry.x.toString()}/${Float64(downX - childRect.left).toString()} y=${entry.y.toString()}/${Float64(downY - childRect.top).toString()}")
            @Expect(touchValueNear(entry.x, Float64(downX - childRect.left)), true)
            @Expect(touchValueNear(entry.y, Float64(downY - childRect.top)), true)
        }
        // x/y property of the click (MyButton center)
        let clickEntries = OnChildTouchRecords.entriesOf(1)
        for (entry in clickEntries) {
            let childRect = touchChildBounds(entry.id)
            Hilog.info(0u32, "CangjieTest",
                "ValueChildPoint click: id=${entry.id} x=${entry.x.toString()}/${Float64(clickX - childRect.left).toString()} y=${entry.y.toString()}/${Float64(clickY - childRect.top).toString()}")
            @Expect(touchValueNear(entry.x, Float64(clickX - childRect.left)), true)
            @Expect(touchValueNear(entry.y, Float64(clickY - childRect.top)), true)
        }
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueChildPoint ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_value_0300
     * @tc.name      : TestCase_ValueParentPoint
     * @tc.desc      : value-level parentX/parentY: touch point relative to the callback Column's top-left matches the injected point and the Column bounds for every entry of both gestures
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueParentPoint(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueParentPoint begins.")
        enterValueView("TestCase_ValueParentPoint")
        let (downX, downY) = dragBlankAreaBelowMyList()
        sleepFor(300.milliSecond)
        let (clickX, clickY) = clickMyButton()
        sleepFor(300.milliSecond)
        @Expect(OnChildTouchRecords.invocations.size, 2)
        let columnRect = touchChildBounds("Column_comattr_id")
        // parentX/parentY property of the drag
        let dragEntries = OnChildTouchRecords.entriesOf(0)
        for (entry in dragEntries) {
            Hilog.info(0u32, "CangjieTest",
                "ValueParentPoint drag: id=${entry.id} pX=${entry.parentX.toString()}/${Float64(downX - columnRect.left).toString()} pY=${entry.parentY.toString()}/${Float64(downY - columnRect.top).toString()}")
            @Expect(touchValueNear(entry.parentX, Float64(downX - columnRect.left)), true)
            @Expect(touchValueNear(entry.parentY, Float64(downY - columnRect.top)), true)
        }
        // parentX/parentY property of the click
        let clickEntries = OnChildTouchRecords.entriesOf(1)
        for (entry in clickEntries) {
            Hilog.info(0u32, "CangjieTest",
                "ValueParentPoint click: id=${entry.id} pX=${entry.parentX.toString()}/${Float64(clickX - columnRect.left).toString()} pY=${entry.parentY.toString()}/${Float64(clickY - columnRect.top).toString()}")
            @Expect(touchValueNear(entry.parentX, Float64(clickX - columnRect.left)), true)
            @Expect(touchValueNear(entry.parentY, Float64(clickY - columnRect.top)), true)
        }
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueParentPoint ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_value_0400
     * @tc.name      : TestCase_ValueWindowPoint
     * @tc.desc      : value-level windowX/windowY: touch point in window coordinates equals the injected ui_test point for every entry of both gestures
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueWindowPoint(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueWindowPoint begins.")
        enterValueView("TestCase_ValueWindowPoint")
        let (downX, downY) = dragBlankAreaBelowMyList()
        sleepFor(300.milliSecond)
        let (clickX, clickY) = clickMyButton()
        sleepFor(300.milliSecond)
        @Expect(OnChildTouchRecords.invocations.size, 2)
        // windowX/windowY property of the drag (fullscreen app: window == ui_test screen)
        let dragEntries = OnChildTouchRecords.entriesOf(0)
        for (entry in dragEntries) {
            Hilog.info(0u32, "CangjieTest",
                "ValueWindowPoint drag: id=${entry.id} wX=${entry.windowX.toString()}/${Float64(downX).toString()} wY=${entry.windowY.toString()}/${Float64(downY).toString()}")
            @Expect(touchValueNear(entry.windowX, Float64(downX)), true)
            @Expect(touchValueNear(entry.windowY, Float64(downY)), true)
        }
        // windowX/windowY property of the click
        let clickEntries = OnChildTouchRecords.entriesOf(1)
        for (entry in clickEntries) {
            Hilog.info(0u32, "CangjieTest",
                "ValueWindowPoint click: id=${entry.id} wX=${entry.windowX.toString()}/${Float64(clickX).toString()} wY=${entry.windowY.toString()}/${Float64(clickY).toString()}")
            @Expect(touchValueNear(entry.windowX, Float64(clickX)), true)
            @Expect(touchValueNear(entry.windowY, Float64(clickY)), true)
        }
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueWindowPoint ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_value_0500
     * @tc.name      : TestCase_ValueRect
     * @tc.desc      : value-level rect: each recorded child's rect x/y/width/height matches the child bounds relative to the callback Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueRect(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueRect begins.")
        enterValueView("TestCase_ValueRect")
        clickMyButton()
        sleepFor(300.milliSecond)
        @Expect(OnChildTouchRecords.invocations.size, 1)
        let columnRect = touchChildBounds("Column_comattr_id")
        let entries = OnChildTouchRecords.entriesOf(0)
        @Expect(entries.size, COLUMN_VALUE_CHILD_IDS.size)
        for (entry in entries) {
            let childRect = touchChildBounds(entry.id)
            Hilog.info(0u32, "CangjieTest",
                "ValueRect: id=${entry.id} rX=${entry.rectX.toString()}/${Float64(childRect.left - columnRect.left).toString()} rY=${entry.rectY.toString()}/${Float64(childRect.top - columnRect.top).toString()} rW=${entry.rectWidth.toString()}/${Float64(childRect.right - childRect.left).toString()} rH=${entry.rectHeight.toString()}/${Float64(childRect.bottom - childRect.top).toString()}")
            @Expect(touchValueNear(entry.rectX, Float64(childRect.left - columnRect.left)), true)
            @Expect(touchValueNear(entry.rectY, Float64(childRect.top - columnRect.top)), true)
            @Expect(touchValueNear(entry.rectWidth, Float64(childRect.right - childRect.left)), true)
            @Expect(touchValueNear(entry.rectHeight, Float64(childRect.bottom - childRect.top)), true)
        }
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueRect ends.")
    }
}
