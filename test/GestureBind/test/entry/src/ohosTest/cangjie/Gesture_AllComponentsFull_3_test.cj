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
// Test class for DT full-component coverage (gesture single-param overload).
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_AllComponentsFull.*
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
class Gesture_AllComponentsFull_3_test {
    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8000
     * @tc.name      : TestCase_Comp_Toggle
     * @tc.desc      : Toggle binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Toggle(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Toggle begins.")
        enterGestureView({_: CustomView => View_GestureComp_Toggle(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_Toggle", "Toggle_gesture_area")
        swipeAreaBy("Toggle_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8100
     * @tc.name      : TestCase_Comp_PatternLock
     * @tc.desc      : PatternLock binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_PatternLock(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_PatternLock begins.")
        enterGestureView({_: CustomView => View_GestureComp_PatternLock(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_PatternLock", "PatternLock_gesture_area")
        swipeAreaBy("PatternLock_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8200
     * @tc.name      : TestCase_Comp_DatePicker
     * @tc.desc      : DatePicker binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_DatePicker(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_DatePicker begins.")
        enterGestureView({_: CustomView => View_GestureComp_DatePicker(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_DatePicker", "DatePicker_gesture_area")
        swipeAreaBy("DatePicker_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8300
     * @tc.name      : TestCase_Comp_TextPicker
     * @tc.desc      : TextPicker binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_TextPicker(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_TextPicker begins.")
        enterGestureView({_: CustomView => View_GestureComp_TextPicker(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_TextPicker", "TextPicker_gesture_area")
        swipeAreaBy("TextPicker_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8400
     * @tc.name      : TestCase_Comp_Stepper
     * @tc.desc      : Stepper binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Stepper(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Stepper begins.")
        enterGestureView({_: CustomView => View_GestureComp_Stepper(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_Stepper", "Stepper_gesture_area")
        swipeAreaBy("Stepper_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8500
     * @tc.name      : TestCase_Comp_StepperItem
     * @tc.desc      : StepperItem binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_StepperItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_StepperItem begins.")
        enterGestureView({_: CustomView => View_GestureComp_StepperItem(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_StepperItem", "StepperItem_gesture_area")
        swipeAreaBy("StepperItem_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8600
     * @tc.name      : TestCase_Comp_Counter
     * @tc.desc      : Counter binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Counter(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Counter begins.")
        enterGestureView({_: CustomView => View_GestureComp_Counter(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_Counter", "Counter_gesture_area")
        swipeAreaBy("Counter_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8700
     * @tc.name      : TestCase_Comp_TextInput
     * @tc.desc      : TextInput binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_TextInput(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_TextInput begins.")
        enterGestureView({_: CustomView => View_GestureComp_TextInput(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_TextInput", "TextInput_gesture_area")
        swipeAreaBy("TextInput_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8800
     * @tc.name      : TestCase_Comp_TextArea
     * @tc.desc      : TextArea binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_TextArea(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_TextArea begins.")
        enterGestureView({_: CustomView => View_GestureComp_TextArea(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_TextArea", "TextArea_gesture_area")
        swipeAreaBy("TextArea_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_8900
     * @tc.name      : TestCase_Comp_TextField
     * @tc.desc      : TextField binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_TextField(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_TextField begins.")
        enterGestureView({_: CustomView => View_GestureComp_TextField(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_TextField", "TextField_gesture_area")
        swipeAreaBy("TextField_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_9000
     * @tc.name      : TestCase_Comp_RichEditor
     * @tc.desc      : RichEditor binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_RichEditor(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_RichEditor begins.")
        enterGestureView({_: CustomView => View_GestureComp_RichEditor(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_RichEditor", "RichEditor_gesture_area")
        swipeAreaBy("RichEditor_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_9100
     * @tc.name      : TestCase_Comp_Video
     * @tc.desc      : Video binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Video(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Video begins.")
        enterGestureView({_: CustomView => View_GestureComp_Video(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_Video", "Video_gesture_area")
        swipeAreaBy("Video_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_9200
     * @tc.name      : TestCase_Comp_Web
     * @tc.desc      : Web binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Web(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Web begins.")
        enterGestureView({_: CustomView => View_GestureComp_Web(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_Web", "Web_gesture_area")
        swipeAreaBy("Web_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_9300
     * @tc.name      : TestCase_Comp_Span
     * @tc.desc      : Span binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Span(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Span begins.")
        enterGestureView({_: CustomView => View_GestureComp_Span(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_Span", "Span_gesture_area")
        swipeAreaBy("Span_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_3_test_9400
     * @tc.name      : TestCase_Comp_ImageSpan
     * @tc.desc      : ImageSpan binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_ImageSpan(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_ImageSpan begins.")
        enterGestureView({_: CustomView => View_GestureComp_ImageSpan(Option<CustomView>.None)}, "Gesture_AllComponentsFull_3_test", "TestCase_Comp_ImageSpan", "ImageSpan_gesture_area")
        swipeAreaBy("ImageSpan_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }
}
