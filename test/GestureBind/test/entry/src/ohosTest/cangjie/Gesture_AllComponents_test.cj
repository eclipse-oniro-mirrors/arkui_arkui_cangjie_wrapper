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

// Test class for Gesture_AllComponents_test scenarios (SR.IR20260916000104.008 gesture binding DT)
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_AllComponents.*
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
class Gesture_AllComponents_test {
    /*
     * @tc.number    : TestGesture_AllComponents_test_1100
     * @tc.name      : TestCase_MultiButton
     * @tc.desc      : Button binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MultiButton(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MultiButton begins.")
        enterGestureView({_: CustomView => View_Gesture_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_MultiButton", "multi_root")
        swipeAreaBy("multi_button_area", 200, 0)
        @Expect(recordPresent("button-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_1200
     * @tc.name      : TestCase_MultiText
     * @tc.desc      : Text binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MultiText(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MultiText begins.")
        enterGestureView({_: CustomView => View_Gesture_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_MultiText", "multi_root")
        swipeAreaBy("multi_text_area", 200, 0)
        @Expect(recordPresent("text-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_1300
     * @tc.name      : TestCase_MultiColumn
     * @tc.desc      : Column binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MultiColumn(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MultiColumn begins.")
        enterGestureView({_: CustomView => View_Gesture_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_MultiColumn", "multi_root")
        swipeAreaBy("multi_column_area", 200, 0)
        @Expect(recordPresent("column-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_2600
     * @tc.name      : TestCase_MaskMultiButton
     * @tc.desc      : Button binds gesture(g, mask=Normal): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MaskMultiButton(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MaskMultiButton begins.")
        enterGestureView({_: CustomView => View_GestureMask_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_MaskMultiButton", "multi_root")
        swipeAreaBy("multi_button_area", 200, 0)
        @Expect(recordPresent("button-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_2700
     * @tc.name      : TestCase_MaskMultiText
     * @tc.desc      : Text binds gesture(g, mask=Normal): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MaskMultiText(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MaskMultiText begins.")
        enterGestureView({_: CustomView => View_GestureMask_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_MaskMultiText", "multi_root")
        swipeAreaBy("multi_text_area", 200, 0)
        @Expect(recordPresent("text-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_2800
     * @tc.name      : TestCase_MaskMultiColumn
     * @tc.desc      : Column binds gesture(g, mask=Normal): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MaskMultiColumn(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MaskMultiColumn begins.")
        enterGestureView({_: CustomView => View_GestureMask_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_MaskMultiColumn", "multi_root")
        swipeAreaBy("multi_column_area", 200, 0)
        @Expect(recordPresent("column-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_3300
     * @tc.name      : TestCase_ParallelMultiButton
     * @tc.desc      : Button binds parallelGesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMultiButton(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMultiButton begins.")
        enterGestureView({_: CustomView => View_Parallel_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_ParallelMultiButton", "multi_root")
        swipeAreaBy("multi_button_area", 200, 0)
        @Expect(recordPresent("button-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_3400
     * @tc.name      : TestCase_ParallelMultiText
     * @tc.desc      : Text binds parallelGesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMultiText(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMultiText begins.")
        enterGestureView({_: CustomView => View_Parallel_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_ParallelMultiText", "multi_root")
        swipeAreaBy("multi_text_area", 200, 0)
        @Expect(recordPresent("text-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_3500
     * @tc.name      : TestCase_ParallelMultiColumn
     * @tc.desc      : Column binds parallelGesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMultiColumn(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMultiColumn begins.")
        enterGestureView({_: CustomView => View_Parallel_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_ParallelMultiColumn", "multi_root")
        swipeAreaBy("multi_column_area", 200, 0)
        @Expect(recordPresent("column-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_4300
     * @tc.name      : TestCase_ParallelMaskMultiButton
     * @tc.desc      : Button binds parallelGesture(g, mask=Normal): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskMultiButton(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskMultiButton begins.")
        enterGestureView({_: CustomView => View_ParallelMask_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_ParallelMaskMultiButton", "multi_root")
        swipeAreaBy("multi_button_area", 200, 0)
        @Expect(recordPresent("button-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_4400
     * @tc.name      : TestCase_ParallelMaskMultiText
     * @tc.desc      : Text binds parallelGesture(g, mask=Normal): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskMultiText(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskMultiText begins.")
        enterGestureView({_: CustomView => View_ParallelMask_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_ParallelMaskMultiText", "multi_root")
        swipeAreaBy("multi_text_area", 200, 0)
        @Expect(recordPresent("text-start"), true)
    }
    /*
     * @tc.number    : TestGesture_AllComponents_test_4500
     * @tc.name      : TestCase_ParallelMaskMultiColumn
     * @tc.desc      : Column binds parallelGesture(g, mask=Normal): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelMaskMultiColumn(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelMaskMultiColumn begins.")
        enterGestureView({_: CustomView => View_ParallelMask_MultiComponents(Option<CustomView>.None)}, "Gesture_AllComponents_test", "TestCase_ParallelMaskMultiColumn", "multi_root")
        swipeAreaBy("multi_column_area", 200, 0)
        @Expect(recordPresent("column-start"), true)
    }
}
