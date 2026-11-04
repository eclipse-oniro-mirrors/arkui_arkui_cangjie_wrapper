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

// Test class for Gesture_comattr_parallel_1_test scenarios (SR.IR20260916000104.008 gesture binding DT)
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_comattr_parallel_1.*
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
class Gesture_comattr_parallel_1_test {
    /*
     * @tc.number    : TestGesture_comattr_parallel_1_test_2900
     * @tc.name      : TestCase_ParallelBothRespond
     * @tc.desc      : parallelGesture(PanGesture()): both parent and child respond to one pan
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelBothRespond(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelBothRespond begins.")
        enterGestureView({_: CustomView => View_Parallel_BothRespond(Option<CustomView>.None)}, "Gesture_comattr_parallel_1_test", "TestCase_ParallelBothRespond", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordPresent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_1_test_3000
     * @tc.name      : TestCase_ParallelAbnormalFingers0
     * @tc.desc      : parallelGesture(PanGesture(fingers:0)): falls back to 1, both respond
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelAbnormalFingers0(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelAbnormalFingers0 begins.")
        enterGestureView({_: CustomView => View_Parallel_Abnormal_Fingers0(Option<CustomView>.None)}, "Gesture_comattr_parallel_1_test", "TestCase_ParallelAbnormalFingers0", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordPresent("child-start"), true)
        @Expect(gestureRecordFingerCount("parent-start") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_1_test_3100
     * @tc.name      : TestCase_ParallelTwoFingers
     * @tc.desc      : parallelGesture(PanGesture(fingers:2)): two-finger pan, both respond with 2 fingers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelTwoFingers(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelTwoFingers begins.")
        enterGestureView({_: CustomView => View_Parallel_Boundary_TwoFingers(Option<CustomView>.None)}, "Gesture_comattr_parallel_1_test", "TestCase_ParallelTwoFingers", "parallel_child_area")
        slideTwoFingersOnArea("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-end"), true)
        @Expect(gestureRecordFingerCount("parent-end") == 2, true)
        @Expect(recordPresent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_1_test_3200
     * @tc.name      : TestCase_ParallelDefault
     * @tc.desc      : parallelGesture(PanGesture()) all defaults: both respond to single-finger pan
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelDefault(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelDefault begins.")
        enterGestureView({_: CustomView => View_Parallel_Default(Option<CustomView>.None)}, "Gesture_comattr_parallel_1_test", "TestCase_ParallelDefault", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordPresent("child-start"), true)
    }
}
