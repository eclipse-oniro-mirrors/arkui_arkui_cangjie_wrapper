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

// Test class for Gesture_comattr_gesture_2_test scenarios (SR.IR20260916000104.008 gesture binding DT)
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_comattr_gesture_2.*
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
class Gesture_comattr_gesture_2_test {
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_1400
     * @tc.name      : TestCase_MaskNormal
     * @tc.desc      : gesture(g, mask=Normal): child Text gesture wins, parent stays idle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MaskNormal(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MaskNormal begins.")
        enterGestureView({_: CustomView => View_Gesture_MaskNormal(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_MaskNormal", "mask_child_area")
        swipeAreaBy("mask_child_area", 200, 0)
        @Expect(recordPresent("child-start"), true)
        @Expect(recordAbsent("parent-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_1500
     * @tc.name      : TestCase_MaskIgnoreInternal
     * @tc.desc      : gesture(g, mask=IgnoreInternal): parent gesture wins, child stays idle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MaskIgnoreInternal(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MaskIgnoreInternal begins.")
        enterGestureView({_: CustomView => View_Gesture_MaskIgnoreInternal(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_MaskIgnoreInternal", "mask_child_area")
        swipeAreaBy("mask_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordAbsent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_1600
     * @tc.name      : TestCase_MaskNone
     * @tc.desc      : mask=None behaves as default Normal: child wins, parent stays idle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MaskNone(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MaskNone begins.")
        enterGestureView({_: CustomView => View_Gesture_MaskNone(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_MaskNone", "mask_child_area")
        swipeAreaBy("mask_child_area", 200, 0)
        @Expect(recordPresent("child-start"), true)
        @Expect(recordAbsent("parent-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_1700
     * @tc.name      : TestCase_MaskAbnormalFingers11
     * @tc.desc      : gesture(PanGesture(fingers:11), Some(Normal)): falls back to 1 finger
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MaskAbnormalFingers11(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MaskAbnormalFingers11 begins.")
        enterGestureView({_: CustomView => View_Gesture_MaskAbnormal_Fingers11(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_MaskAbnormalFingers11", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_1800
     * @tc.name      : TestCase_DistanceNegative
     * @tc.desc      : distance=-1 falls back to default 5.0: a 3px pan does not trigger
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DistanceNegative(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DistanceNegative begins.")
        enterGestureView({_: CustomView => View_Gesture_Distance_Negative(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DistanceNegative", "gesture_area")
        swipeAreaBy("gesture_area", 3, 0)
        @Expect(recordAbsent("start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_1900
     * @tc.name      : TestCase_DirectionNone
     * @tc.desc      : PanDirection.None: any pan direction does not trigger
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DirectionNone(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DirectionNone begins.")
        enterGestureView({_: CustomView => View_Gesture_Direction_None(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DirectionNone", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordAbsent("start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_2000
     * @tc.name      : TestCase_DirectionOrLeftUp
     * @tc.desc      : direction Left|Up (Computed 5): left pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DirectionOrLeftUp(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DirectionOrLeftUp begins.")
        enterGestureView({_: CustomView => View_Gesture_Direction_OrLeftUp(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DirectionOrLeftUp", "gesture_area")
        swipeAreaBy("gesture_area", -200, 0)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_2100
     * @tc.name      : TestCase_DirectionOrLeftUpNegative
     * @tc.desc      : direction Left|Up: right pan does not trigger
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DirectionOrLeftUpNegative(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DirectionOrLeftUpNegative begins.")
        enterGestureView({_: CustomView => View_Gesture_Direction_OrLeftUp(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DirectionOrLeftUpNegative", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordAbsent("start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_2200
     * @tc.name      : TestCase_DirectionAndAllUp
     * @tc.desc      : direction All&Up (==Up 4): upward pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DirectionAndAllUp(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DirectionAndAllUp begins.")
        enterGestureView({_: CustomView => View_Gesture_Direction_AndAllUp(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DirectionAndAllUp", "gesture_area")
        swipeAreaBy("gesture_area", 0, -200)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_2300
     * @tc.name      : TestCase_DirectionAndAllUpNegative
     * @tc.desc      : direction All&Up: left pan does not trigger
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DirectionAndAllUpNegative(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DirectionAndAllUpNegative begins.")
        enterGestureView({_: CustomView => View_Gesture_Direction_AndAllUp(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DirectionAndAllUpNegative", "gesture_area")
        swipeAreaBy("gesture_area", -200, 0)
        @Expect(recordAbsent("start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_2400
     * @tc.name      : TestCase_DirectionHorizontalLeft
     * @tc.desc      : direction Horizontal: left pan triggers (Left|Right equivalence, positive side)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DirectionHorizontalLeft(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DirectionHorizontalLeft begins.")
        enterGestureView({_: CustomView => View_Gesture_Direction_Horizontal(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DirectionHorizontalLeft", "gesture_area")
        swipeAreaBy("gesture_area", -200, 0)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_2_test_2500
     * @tc.name      : TestCase_DirectionHorizontalUpNegative
     * @tc.desc      : direction Horizontal: upward pan does not trigger
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DirectionHorizontalUpNegative(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DirectionHorizontalUpNegative begins.")
        enterGestureView({_: CustomView => View_Gesture_Direction_Horizontal(Option<CustomView>.None)}, "Gesture_comattr_gesture_2_test", "TestCase_DirectionHorizontalUpNegative", "gesture_area")
        swipeAreaBy("gesture_area", 0, -200)
        @Expect(recordAbsent("start"), true)
    }
}
