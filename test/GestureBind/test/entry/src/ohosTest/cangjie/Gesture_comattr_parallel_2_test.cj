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

// Test class for Gesture_comattr_parallel_2_test scenarios (SR.IR20260916000104.008 gesture binding DT)
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_comattr_parallel_2.*
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
class Gesture_comattr_parallel_2_test {
    /*
     * @tc.number    : TestGesture_comattr_parallel_2_test_3600
     * @tc.name      : TestCase_ParallelMaskNormal
     * @tc.desc      : parallelGesture(g, mask=Normal): both parent and child respond
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskNormal(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskNormal begins.")
        enterGestureView({_: CustomView => View_Parallel_MaskNormal(Option<CustomView>.None)}, "Gesture_comattr_parallel_2_test", "TestCase_ParallelMaskNormal", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordPresent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_2_test_3700
     * @tc.name      : TestCase_ParallelMaskIgnoreInternal
     * @tc.desc      : parallelGesture(g, mask=IgnoreInternal): only parent responds, child idle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskIgnoreInternal(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskIgnoreInternal begins.")
        enterGestureView({_: CustomView => View_Parallel_MaskIgnoreInternal(Option<CustomView>.None)}, "Gesture_comattr_parallel_2_test", "TestCase_ParallelMaskIgnoreInternal", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordAbsent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_2_test_3800
     * @tc.name      : TestCase_ParallelMaskNone
     * @tc.desc      : parallelGesture(g, mask=None): equivalent to Normal, both respond
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskNone(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskNone begins.")
        enterGestureView({_: CustomView => View_Parallel_MaskNone(Option<CustomView>.None)}, "Gesture_comattr_parallel_2_test", "TestCase_ParallelMaskNone", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordPresent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_2_test_3900
     * @tc.name      : TestCase_ParallelMaskAbnormalFingers11
     * @tc.desc      : parallelGesture(PanGesture(fingers:11), Normal): falls back to 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskAbnormalFingers11(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskAbnormalFingers11 begins.")
        enterGestureView({_: CustomView => View_Parallel_MaskAbnormal_Fingers11(Option<CustomView>.None)}, "Gesture_comattr_parallel_2_test", "TestCase_ParallelMaskAbnormalFingers11", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(gestureRecordFingerCount("parent-start") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_2_test_4000
     * @tc.name      : TestCase_ParallelMaskVertical
     * @tc.desc      : parallelGesture(PanGesture(direction:Vertical), Normal): upward pan, both respond
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskVertical(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskVertical begins.")
        enterGestureView({_: CustomView => View_Parallel_Mask_Vertical(Option<CustomView>.None)}, "Gesture_comattr_parallel_2_test", "TestCase_ParallelMaskVertical", "parallel_child_area")
        swipeAreaBy("parallel_child_area", 0, -200)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordPresent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_2_test_4100
     * @tc.name      : TestCase_ParallelMaskVerticalNegative
     * @tc.desc      : direction Vertical: left pan does not trigger either side
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskVerticalNegative(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskVerticalNegative begins.")
        enterGestureView({_: CustomView => View_Parallel_Mask_Vertical(Option<CustomView>.None)}, "Gesture_comattr_parallel_2_test", "TestCase_ParallelMaskVerticalNegative", "parallel_child_area")
        swipeAreaBy("parallel_child_area", -200, 0)
        @Expect(recordAbsent("parent-start"), true)
        @Expect(recordAbsent("child-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_parallel_2_test_4200
     * @tc.name      : TestCase_ParallelMaskDefaultDirection
     * @tc.desc      : direction omitted (default All): left pan, both respond
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskDefaultDirection(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskDefaultDirection begins.")
        enterGestureView({_: CustomView => View_Parallel_Mask_DefaultDirection(Option<CustomView>.None)}, "Gesture_comattr_parallel_2_test", "TestCase_ParallelMaskDefaultDirection", "parallel_child_area")
        swipeAreaBy("parallel_child_area", -200, 0)
        @Expect(recordPresent("parent-start"), true)
        @Expect(recordPresent("child-start"), true)
    }
}
