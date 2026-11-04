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
// Test class for parallelGesture competition cases (DT-110~115).
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_ParallelCompete.*
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
class Gesture_comattr_parallel_compete_test {
    /*
     * @tc.number    : TestGesture_comattr_parallel_compete_test_11000
     * @tc.name      : TestCase_ParallelCompeteScroll
     * @tc.desc      : Scroll binds parallelGesture(PanGesture()): competition result recorded, ArkTS parity anchored
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelCompeteScroll(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelCompeteScroll begins.")
        enterGestureView({_: CustomView => View_ParallelCompete_Scroll(Option<CustomView>.None)}, "Gesture_comattr_parallel_compete_test", "TestCase_ParallelCompeteScroll", "Scroll_parallel_area")
        swipeAreaBy("Scroll_parallel_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_comattr_parallel_compete_test_11100
     * @tc.name      : TestCase_ParallelCompeteList
     * @tc.desc      : List binds parallelGesture(PanGesture()): competition result recorded, ArkTS parity anchored
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelCompeteList(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelCompeteList begins.")
        enterGestureView({_: CustomView => View_ParallelCompete_List(Option<CustomView>.None)}, "Gesture_comattr_parallel_compete_test", "TestCase_ParallelCompeteList", "List_parallel_area")
        swipeAreaBy("List_parallel_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_comattr_parallel_compete_test_11200
     * @tc.name      : TestCase_ParallelCompeteSwiper
     * @tc.desc      : Swiper binds parallelGesture(PanGesture()): competition result recorded, ArkTS parity anchored
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelCompeteSwiper(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelCompeteSwiper begins.")
        enterGestureView({_: CustomView => View_ParallelCompete_Swiper(Option<CustomView>.None)}, "Gesture_comattr_parallel_compete_test", "TestCase_ParallelCompeteSwiper", "Swiper_parallel_area")
        swipeAreaBy("Swiper_parallel_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_comattr_parallel_compete_test_11300
     * @tc.name      : TestCase_ParallelCompeteSlider
     * @tc.desc      : Slider binds parallelGesture(PanGesture()): competition result recorded, ArkTS parity anchored
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelCompeteSlider(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelCompeteSlider begins.")
        enterGestureView({_: CustomView => View_ParallelCompete_Slider(Option<CustomView>.None)}, "Gesture_comattr_parallel_compete_test", "TestCase_ParallelCompeteSlider", "Slider_parallel_area")
        swipeAreaBy("Slider_parallel_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_comattr_parallel_compete_test_11400
     * @tc.name      : TestCase_ParallelCompeteTextInput
     * @tc.desc      : TextInput binds parallelGesture(PanGesture()): competition result recorded, ArkTS parity anchored
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelCompeteTextInput(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelCompeteTextInput begins.")
        enterGestureView({_: CustomView => View_ParallelCompete_TextInput(Option<CustomView>.None)}, "Gesture_comattr_parallel_compete_test", "TestCase_ParallelCompeteTextInput", "TextInput_parallel_area")
        swipeAreaBy("TextInput_parallel_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_comattr_parallel_compete_test_11500
     * @tc.name      : TestCase_ParallelCompeteVideo
     * @tc.desc      : Video binds parallelGesture(PanGesture()): competition result recorded, ArkTS parity anchored
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ParallelCompeteVideo(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ParallelCompeteVideo begins.")
        enterGestureView({_: CustomView => View_ParallelCompete_Video(Option<CustomView>.None)}, "Gesture_comattr_parallel_compete_test", "TestCase_ParallelCompeteVideo", "Video_parallel_area")
        swipeAreaBy("Video_parallel_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }
}
