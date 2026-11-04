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

// Test class for Gesture_comattr_gesture_1_test scenarios (SR.IR20260916000104.008 gesture binding DT)
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_comattr_gesture_1.*
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
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.Hilog
import ohos_app_cangjie_entry.*

private func enterGestureView(view: (CustomView) -> CustomView, suiteName: String, caseName: String, waitId: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch {
        modtestSuiteText[0] = suiteName
        modtestCaseText[0] = caseName
        modtestView[0] = view
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id(waitId), 3000i32)
    GestureEventRecords.reset()
    sleepFor(500.milliSecond)
}

@Test
class Gesture_comattr_gesture_1_test {
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0100
     * @tc.name      : TestCase_NormalTwoFingers
     * @tc.desc      : gesture binds PanGesture(fingers:2); two-finger pan triggers start/end with fingerList.size=2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NormalTwoFingers(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NormalTwoFingers begins.")
        enterGestureView({_: CustomView => View_Gesture_Normal_TwoFingers(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_NormalTwoFingers", "gesture_area")
        slideTwoFingersOnArea("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 2, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0200
     * @tc.name      : TestCase_AbnormalFingers11
     * @tc.desc      : fingers=11 exceeds upper bound 10 and falls back to default 1; single-finger pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_AbnormalFingers11(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_AbnormalFingers11 begins.")
        enterGestureView({_: CustomView => View_Gesture_Abnormal_Fingers11(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_AbnormalFingers11", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0300
     * @tc.name      : TestCase_BoundaryFingers1
     * @tc.desc      : fingers=1 lower bound; single-finger pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_BoundaryFingers1(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_BoundaryFingers1 begins.")
        enterGestureView({_: CustomView => View_Gesture_Boundary_Fingers1(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_BoundaryFingers1", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0400
     * @tc.name      : TestCase_BoundaryDistance0
     * @tc.desc      : distance=0 lower bound; a 3px pan already triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_BoundaryDistance0(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_BoundaryDistance0 begins.")
        enterGestureView({_: CustomView => View_Gesture_Boundary_Distance0(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_BoundaryDistance0", "gesture_area")
        swipeAreaBy("gesture_area", 3, 0)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0500
     * @tc.name      : TestCase_Default
     * @tc.desc      : PanGesture() all defaults (fingers=1/All/5.0); single-finger pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Default(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Default begins.")
        enterGestureView({_: CustomView => View_Gesture_Default(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_Default", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0600
     * @tc.name      : TestCase_DefaultDistance
     * @tc.desc      : default distance 5.0vp; a 3px pan does not trigger and status stays idle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DefaultDistance(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DefaultDistance begins.")
        enterGestureView({_: CustomView => View_Gesture_Default_Distance(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_DefaultDistance", "gesture_area")
        swipeAreaBy("gesture_area", 3, 0)
        @Expect(recordAbsent("start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0700
     * @tc.name      : TestCase_ChainCombination
     * @tc.desc      : gesture chains with width/height/background attrs; pan still triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ChainCombination(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ChainCombination begins.")
        enterGestureView({_: CustomView => View_Gesture_Chain_Combination(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_ChainCombination", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0800
     * @tc.name      : TestCase_EventFieldsEnd
     * @tc.desc      : value-level: end record offsetX in [10,300]vp and velocity>0 via direct capture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_EventFieldsEnd(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_EventFieldsEnd begins.")
        enterGestureView({_: CustomView => View_Gesture_EventFields(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_EventFieldsEnd", "gesture_area")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        var startSeen = false
        var endRecord: ?GestureEventRecord = Option<GestureEventRecord>.None
        for (r in GestureEventRecords.records) {
            if (r.phase == "start") {
                startSeen = true
            }
            if (r.phase == "end") {
                endRecord = Option<GestureEventRecord>.Some(r)
            }
        }
        @Expect(startSeen, true)
        let end = endRecord.getOrThrow()
        @Expect(end.offsetX >= 10.0 && end.offsetX <= 300.0, true)
        @Expect(end.velocity > 0.0, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0900
     * @tc.name      : TestCase_EventFieldsUpdate
     * @tc.desc      : controlled 12-frame injection produces >= 3 onActionUpdate callbacks (direct count)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_EventFieldsUpdate(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_EventFieldsUpdate begins.")
        enterGestureView({_: CustomView => View_Gesture_EventFields(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_EventFieldsUpdate", "gesture_area")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        var updateCount: Int64 = 0
        for (r in GestureEventRecords.records) {
            if (r.phase == "update") {
                updateCount = updateCount + 1
            }
        }
        @Expect(updateCount >= 3, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_1000
     * @tc.name      : TestCase_EventFieldsInfos
     * @tc.desc      : value-level: fingerInfos Some with size 1, source TouchScreen, tapLocation None
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_EventFieldsInfos(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_EventFieldsInfos begins.")
        enterGestureView({_: CustomView => View_Gesture_EventFields(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_EventFieldsInfos", "gesture_area")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        var endRecord: ?GestureEventRecord = Option<GestureEventRecord>.None
        for (r in GestureEventRecords.records) {
            if (r.phase == "end") {
                endRecord = Option<GestureEventRecord>.Some(r)
            }
        }
        let end = endRecord.getOrThrow()
        @Expect(!end.fingerInfosNone, true)
        @Expect(end.fingerInfoIds.size == 1, true)
        @Expect(end.sourceTouch, true)
        @Expect(end.tapLocationNone, true)
    }
}
