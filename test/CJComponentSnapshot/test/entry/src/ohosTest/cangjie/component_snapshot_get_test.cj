/*
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

package ohos_app_cangjie_entry_test

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.ui_test.*
import ohos_app_cangjie_entry.modtestSuiteText
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestView
import ohos.arkui.component.custom_component.CustomView
import ohos_app_cangjie_entry.component_snapshot_get.*
import kit.ArkUI.getInspectorByKey

/*
 * 公共驱动：launch 指定 View（编号 1~37）→ 点击 testButton → 等待目标组件挂载。已覆盖 36 个原始场景 + 1 个 BC 优先级验证场景。
 */
func launchSnapshotView(viewIndex: Int64, suiteText: String, caseText: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_5(Option<CustomView>.None)}
            case 6 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_6(Option<CustomView>.None)}
            case 7 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_7(Option<CustomView>.None)}
            case 8 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_8(Option<CustomView>.None)}
            case 9 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_9(Option<CustomView>.None)}
            case 10 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_10(Option<CustomView>.None)}
            case 11 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_11(Option<CustomView>.None)}
            case 12 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_12(Option<CustomView>.None)}
            case 13 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_13(Option<CustomView>.None)}
            case 14 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_14(Option<CustomView>.None)}
            case 15 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_15(Option<CustomView>.None)}
            case 16 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_16(Option<CustomView>.None)}
            case 17 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_17(Option<CustomView>.None)}
            case 18 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_18(Option<CustomView>.None)}
            case 19 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_19(Option<CustomView>.None)}
            case 20 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_20(Option<CustomView>.None)}
            case 21 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_21(Option<CustomView>.None)}
            case 22 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_22(Option<CustomView>.None)}
            case 23 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_23(Option<CustomView>.None)}
            case 24 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_24(Option<CustomView>.None)}
            case 25 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_25(Option<CustomView>.None)}
            case 26 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_26(Option<CustomView>.None)}
            case 27 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_27(Option<CustomView>.None)}
            case 28 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_28(Option<CustomView>.None)}
            case 29 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_29(Option<CustomView>.None)}
            case 30 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_30(Option<CustomView>.None)}
            case 31 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_31(Option<CustomView>.None)}
            case 32 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_32(Option<CustomView>.None)}
            case 33 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_33(Option<CustomView>.None)}
            case 34 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_34(Option<CustomView>.None)}
            case 35 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_35(Option<CustomView>.None)}
            case 36 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_36(Option<CustomView>.None)}
            case 37 => modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_37(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Snapshot_target_id"), 3000i32)
}

func getInspectorAttr(id: String, field: String): String {
    let inspector = getInspectorByKey(id)
    let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
    return attrs.get(field).getOrThrow().toString()
}

/*
 * 触发按钮并等待回调完成（回调置 snapDone）。
 */
func triggerAndWait(buttonText: String): Unit {
    TestDriver.driver.waitForComponent(On().text(buttonText), 3000i32).getOrThrow().click()
    sleepFor(500.milliSecond)
}

@Test
class ComponentSnapshot_get_test {
    /*
     * @tc.number    : TestComponentSnapshot_get_001
     * @tc.name      : TestCase_1
     * @tc.desc      : get with default options, err None and pixelMap present (baseline)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        launchSnapshotView(1, "ComponentSnapshot_get_test", "TestCase_1")
        triggerAndWait("default options")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_002
     * @tc.name      : TestCase_2
     * @tc.desc      : getComponentSnapshot called twice returns same cached instance, both snapshots ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        launchSnapshotView(2, "ComponentSnapshot_get_test", "TestCase_2")
        triggerAndWait("call twice")
        sleepFor(300.milliSecond)
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_003
     * @tc.name      : TestCase_3
     * @tc.desc      : early call in aboutToAppear, err.code==100001 and message "Invalid ID."
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "ComponentSnapshot_get_test"
            modtestCaseText[0] = "TestCase_3"
            modtestView[0] = {_:CustomView => View_ComponentSnapshot_get_3(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Snapshot_target_id"), 3000i32)

        @Expect(snapDone, true)
        @Expect(snapErrCode, 100001)
        @Expect(snapPixelMapPresent, false)
        @Expect(getInspectorAttr("Image_id", "width"), "\"130.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"130.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_004
     * @tc.name      : TestCase_4
     * @tc.desc      : get with not exist id, err.code==100001 and message "Invalid ID."
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        launchSnapshotView(4, "ComponentSnapshot_get_test", "TestCase_4")
        triggerAndWait("not exist id")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 100001)
        @Expect(snapPixelMapPresent, false)
        @Expect(snapErrMessage, "Invalid ID.")
        @Expect(getInspectorAttr("Image_id", "width"), "\"130.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"130.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_005
     * @tc.name      : TestCase_5
     * @tc.desc      : other component id not empty, get(""), err.code==0 and message "", no crash.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        launchSnapshotView(5, "ComponentSnapshot_get_test", "TestCase_5")
        triggerAndWait("empty id")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapErrMessage, "")
        @Expect(snapPixelMapPresent, true)
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_006
     * @tc.name      : TestCase_6
     * @tc.desc      : get with options None, default SnapshotOptions construction, snapshot ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_6 begins.")
        launchSnapshotView(6, "ComponentSnapshot_get_test", "TestCase_6")
        triggerAndWait("options none")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_6 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_007
     * @tc.name      : TestCase_7
     * @tc.desc      : scale=1.0, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_7 begins.")
        launchSnapshotView(7, "ComponentSnapshot_get_test", "TestCase_7")
        triggerAndWait("scale 1.0")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_7 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_008
     * @tc.name      : TestCase_8
     * @tc.desc      : scale=0 clamped to 1.0, snapshot ok (boundary)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_8 begins.")
        launchSnapshotView(8, "ComponentSnapshot_get_test", "TestCase_8")
        triggerAndWait("scale 0")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_8 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_009
     * @tc.name      : TestCase_9
     * @tc.desc      : scale=-1 clamped to 1.0, snapshot ok (invalid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_9(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_9 begins.")
        launchSnapshotView(9, "ComponentSnapshot_get_test", "TestCase_9")
        triggerAndWait("scale -1")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_9 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_010
     * @tc.name      : TestCase_10
     * @tc.desc      : scale=Float64.Max boundary, snapshot ok or NG layer resource limit, no crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_10(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_10 begins.")
        launchSnapshotView(10, "ComponentSnapshot_get_test", "TestCase_10")
        triggerAndWait("scale max")
        @Expect(snapDone, false)
        @Expect(snapErrCode, -1)
        @Expect(snapPixelMapPresent, false)
        @Expect(getInspectorAttr("Image_id", "width"), "\"130.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"130.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_10 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_011
     * @tc.name      : TestCase_11
     * @tc.desc      : scale=Float64.Min clamped to 1.0, snapshot ok (invalid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_11(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_11 begins.")
        launchSnapshotView(11, "ComponentSnapshot_get_test", "TestCase_11")
        triggerAndWait("scale min")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_11 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_012
     * @tc.name      : TestCase_12
     * @tc.desc      : scale Option.None default 1.0, snapshot ok (default value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_12(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_12 begins.")
        launchSnapshotView(12, "ComponentSnapshot_get_test", "TestCase_12")
        triggerAndWait("scale None")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_12 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_013
     * @tc.name      : TestCase_13
     * @tc.desc      : waitUntilRenderFinished=true, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_13(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_13 begins.")
        launchSnapshotView(13, "ComponentSnapshot_get_test", "TestCase_13")
        triggerAndWait("wait true")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_13 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_014
     * @tc.name      : TestCase_14
     * @tc.desc      : waitUntilRenderFinished=false, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_14(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_14 begins.")
        launchSnapshotView(14, "ComponentSnapshot_get_test", "TestCase_14")
        triggerAndWait("wait false")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_14 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_015
     * @tc.name      : TestCase_15
     * @tc.desc      : waitUntilRenderFinished Option.None default false, snapshot ok (default value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_15(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_15 begins.")
        launchSnapshotView(15, "ComponentSnapshot_get_test", "TestCase_15")
        triggerAndWait("wait None")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_15 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_016
     * @tc.name      : TestCase_16
     * @tc.desc      : SnapshotRegion(5,115,5,25) valid region, snapshot ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_16(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_16 begins.")
        launchSnapshotView(16, "ComponentSnapshot_get_test", "TestCase_16")
        triggerAndWait("region valid")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"110.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"20.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_16 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_017
     * @tc.name      : TestCase_17
     * @tc.desc      : SnapshotRegion(0,120,0,30) all-boundary coords, snapshot ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_17(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_17 begins.")
        launchSnapshotView(17, "ComponentSnapshot_get_test", "TestCase_17")
        triggerAndWait("region boundary")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_17 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_018
     * @tc.name      : TestCase_18
     * @tc.desc      : SnapshotRegion(-5,300,-5,300) out-of-bounds, err returned, no crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_18(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_18 begins.")
        launchSnapshotView(18, "ComponentSnapshot_get_test", "TestCase_18")
        triggerAndWait("region out of bounds")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 401)
        @Expect(snapPixelMapPresent, false)
        Hilog.info(0u32, "CangjieTest", "TestCase_18 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_019
     * @tc.name      : TestCase_19
     * @tc.desc      : SnapshotRegion reversed (left=120, right=50), err returned, no crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_19(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_19 begins.")
        launchSnapshotView(19, "ComponentSnapshot_get_test", "TestCase_19")
        triggerAndWait("region reversed")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_19 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_020
     * @tc.name      : TestCase_20
     * @tc.desc      : LocalizedSnapshotRegion(5,115,5,25) valid, snapshot ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_20(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_20 begins.")
        launchSnapshotView(20, "ComponentSnapshot_get_test", "TestCase_20")
        triggerAndWait("localized valid")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"110.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"20.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_20 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_021
     * @tc.name      : TestCase_21
     * @tc.desc      : LocalizedSnapshotRegion(0,120,0,30) all-boundary coords, snapshot ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_21(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_21 begins.")
        launchSnapshotView(21, "ComponentSnapshot_get_test", "TestCase_21")
        triggerAndWait("localized boundary")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_21 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_022
     * @tc.name      : TestCase_22
     * @tc.desc      : LocalizedSnapshotRegion(-5,300,-5,300) out-of-bounds, err returned, no crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_22(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_22 begins.")
        launchSnapshotView(22, "ComponentSnapshot_get_test", "TestCase_22")
        triggerAndWait("localized out of bounds")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 401)
        @Expect(snapPixelMapPresent, false)
        @Expect(getInspectorAttr("Image_id", "width"), "\"130.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"130.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_22 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_023
     * @tc.name      : TestCase_23
     * @tc.desc      : region Option.None default full component, snapshot ok (default value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_23(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_23 begins.")
        launchSnapshotView(23, "ComponentSnapshot_get_test", "TestCase_23")
        triggerAndWait("region None")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_23 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_024
     * @tc.name      : TestCase_24
     * @tc.desc      : colorMode manual Srgb, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_24(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_24 begins.")
        launchSnapshotView(24, "ComponentSnapshot_get_test", "TestCase_24")
        triggerAndWait("colorMode Srgb")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_24 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_025
     * @tc.name      : TestCase_25
     * @tc.desc      : colorMode manual DisplayP3, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_25(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_25 begins.")
        launchSnapshotView(25, "ComponentSnapshot_get_test", "TestCase_25")
        triggerAndWait("colorMode DisplayP3")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_25 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_026
     * @tc.name      : TestCase_26
     * @tc.desc      : colorMode manual Unknown, snapshot ok (boundary value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_26(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_26 begins.")
        launchSnapshotView(26, "ComponentSnapshot_get_test", "TestCase_26")
        triggerAndWait("colorMode Unknown")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 160003)
        @Expect(snapPixelMapPresent, false)
        @Expect(getInspectorAttr("Image_id", "width"), "\"130.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"130.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_26 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_027
     * @tc.name      : TestCase_27
     * @tc.desc      : colorMode isAuto=true, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_27(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_27 begins.")
        launchSnapshotView(27, "ComponentSnapshot_get_test", "TestCase_27")
        triggerAndWait("colorMode auto")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_27 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_028
     * @tc.name      : TestCase_28
     * @tc.desc      : colorMode ColorModeOptions() both-params-absent default, snapshot ok (boundary)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_28(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_28 begins.")
        launchSnapshotView(28, "ComponentSnapshot_get_test", "TestCase_28")
        triggerAndWait("colorMode default")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_28 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_029
     * @tc.name      : TestCase_29
     * @tc.desc      : colorMode Option.None default Srgb+isAuto=false, snapshot ok (default value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_29(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_29 begins.")
        launchSnapshotView(29, "ComponentSnapshot_get_test", "TestCase_29")
        triggerAndWait("colorMode None")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_29 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_030
     * @tc.name      : TestCase_30
     * @tc.desc      : dynamicRangeMode manual Standard, snapshot ok (valid + default)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_30(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_30 begins.")
        launchSnapshotView(30, "ComponentSnapshot_get_test", "TestCase_30")
        triggerAndWait("drm Standard")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_30 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_031
     * @tc.name      : TestCase_31
     * @tc.desc      : dynamicRangeMode manual High, snapshot ok (valid + boundary)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_31(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_31 begins.")
        launchSnapshotView(31, "ComponentSnapshot_get_test", "TestCase_31")
        triggerAndWait("drm High")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_31 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_032
     * @tc.name      : TestCase_32
     * @tc.desc      : dynamicRangeMode manual Constraint, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_32(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_32 begins.")
        launchSnapshotView(32, "ComponentSnapshot_get_test", "TestCase_32")
        triggerAndWait("drm Constraint")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_32 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_033
     * @tc.name      : TestCase_33
     * @tc.desc      : dynamicRangeMode isAuto=true, snapshot ok (valid equivalence class)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_33(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_33 begins.")
        launchSnapshotView(33, "ComponentSnapshot_get_test", "TestCase_33")
        triggerAndWait("drm auto")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_33 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_034
     * @tc.name      : TestCase_34
     * @tc.desc      : dynamicRangeMode DynamicRangeModeOptions() both-params-absent default, snapshot ok (boundary)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_34(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_34 begins.")
        launchSnapshotView(34, "ComponentSnapshot_get_test", "TestCase_34")
        triggerAndWait("drm default")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_34 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_035
     * @tc.name      : TestCase_35
     * @tc.desc      : dynamicRangeMode Option.None default Standard+isAuto=false, snapshot ok (default value)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_35(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_35 begins.")
        launchSnapshotView(35, "ComponentSnapshot_get_test", "TestCase_35")
        triggerAndWait("drm None")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_35 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_036
     * @tc.name      : TestCase_36
     * @tc.desc      : full params snapshot (scale+wait+region+colorMode+dynamicRangeMode), snapshot ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_36(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_36 begins.")
        launchSnapshotView(36, "ComponentSnapshot_get_test", "TestCase_36")
        triggerAndWait("full params")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        Hilog.info(0u32, "CangjieTest", "TestCase_36 ends.")
    }

    /*
     * @tc.number    : TestComponentSnapshot_get_037
     * @tc.name      : TestCase_37
     * @tc.desc      : colorMode isAuto=true overrides invalid colorSpace Unknown, snapshot ok (priority verification)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_37(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_37 begins.")
        launchSnapshotView(37, "ComponentSnapshot_get_test", "TestCase_37")
        triggerAndWait("colorMode auto override")
        @Expect(snapDone, true)
        @Expect(snapErrCode, 0)
        @Expect(snapPixelMapPresent, true)
        @Expect(getInspectorAttr("Image_id", "width"), "\"120.00vp\"")
        @Expect(getInspectorAttr("Image_id", "height"), "\"30.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_37 ends.")
    }
}