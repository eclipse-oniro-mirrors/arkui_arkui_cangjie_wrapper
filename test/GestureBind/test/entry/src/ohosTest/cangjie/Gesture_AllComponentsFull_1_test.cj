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
class Gesture_AllComponentsFull_1_test {
    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5000
     * @tc.name      : TestCase_Comp_Image
     * @tc.desc      : Image binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Image(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Image begins.")
        enterGestureView({_: CustomView => View_GestureComp_Image(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Image", "Image_gesture_area")
        swipeAreaBy("Image_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5100
     * @tc.name      : TestCase_Comp_Blank
     * @tc.desc      : Blank binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Blank(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Blank begins.")
        enterGestureView({_: CustomView => View_GestureComp_Blank(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Blank", "Blank_gesture_area")
        swipeAreaBy("Blank_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5200
     * @tc.name      : TestCase_Comp_Divider
     * @tc.desc      : Divider binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Divider(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Divider begins.")
        enterGestureView({_: CustomView => View_GestureComp_Divider(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Divider", "Divider_gesture_area")
        swipeAreaBy("Divider_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5300
     * @tc.name      : TestCase_Comp_Progress
     * @tc.desc      : Progress binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Progress(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Progress begins.")
        enterGestureView({_: CustomView => View_GestureComp_Progress(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Progress", "Progress_gesture_area")
        swipeAreaBy("Progress_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5400
     * @tc.name      : TestCase_Comp_LoadingProgress
     * @tc.desc      : LoadingProgress binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_LoadingProgress(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_LoadingProgress begins.")
        enterGestureView({_: CustomView => View_GestureComp_LoadingProgress(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_LoadingProgress", "LoadingProgress_gesture_area")
        swipeAreaBy("LoadingProgress_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5500
     * @tc.name      : TestCase_Comp_Badge
     * @tc.desc      : Badge binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Badge(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Badge begins.")
        enterGestureView({_: CustomView => View_GestureComp_Badge(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Badge", "Badge_gesture_area")
        swipeAreaBy("Badge_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5600
     * @tc.name      : TestCase_Comp_QRCode
     * @tc.desc      : QRCode binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_QRCode(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_QRCode begins.")
        enterGestureView({_: CustomView => View_GestureComp_QRCode(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_QRCode", "QRCode_gesture_area")
        swipeAreaBy("QRCode_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5700
     * @tc.name      : TestCase_Comp_Checkbox
     * @tc.desc      : Checkbox binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Checkbox(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Checkbox begins.")
        enterGestureView({_: CustomView => View_GestureComp_Checkbox(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Checkbox", "Checkbox_gesture_area")
        swipeAreaBy("Checkbox_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5800
     * @tc.name      : TestCase_Comp_CheckboxGroup
     * @tc.desc      : CheckboxGroup binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_CheckboxGroup(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_CheckboxGroup begins.")
        enterGestureView({_: CustomView => View_GestureComp_CheckboxGroup(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_CheckboxGroup", "CheckboxGroup_gesture_area")
        swipeAreaBy("CheckboxGroup_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_5900
     * @tc.name      : TestCase_Comp_Radio
     * @tc.desc      : Radio binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Radio(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Radio begins.")
        enterGestureView({_: CustomView => View_GestureComp_Radio(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Radio", "Radio_gesture_area")
        swipeAreaBy("Radio_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_6000
     * @tc.name      : TestCase_Comp_TextClock
     * @tc.desc      : TextClock binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_TextClock(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_TextClock begins.")
        enterGestureView({_: CustomView => View_GestureComp_TextClock(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_TextClock", "TextClock_gesture_area")
        swipeAreaBy("TextClock_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_6100
     * @tc.name      : TestCase_Comp_TextTimer
     * @tc.desc      : TextTimer binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_TextTimer(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_TextTimer begins.")
        enterGestureView({_: CustomView => View_GestureComp_TextTimer(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_TextTimer", "TextTimer_gesture_area")
        swipeAreaBy("TextTimer_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_6200
     * @tc.name      : TestCase_Comp_Row
     * @tc.desc      : Row binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Row(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Row begins.")
        enterGestureView({_: CustomView => View_GestureComp_Row(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Row", "Row_gesture_area")
        swipeAreaBy("Row_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_6300
     * @tc.name      : TestCase_Comp_Stack
     * @tc.desc      : Stack binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Stack(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Stack begins.")
        enterGestureView({_: CustomView => View_GestureComp_Stack(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Stack", "Stack_gesture_area")
        swipeAreaBy("Stack_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_1_test_6400
     * @tc.name      : TestCase_Comp_Flex
     * @tc.desc      : Flex binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Flex(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Flex begins.")
        enterGestureView({_: CustomView => View_GestureComp_Flex(Option<CustomView>.None)}, "Gesture_AllComponentsFull_1_test", "TestCase_Comp_Flex", "Flex_gesture_area")
        swipeAreaBy("Flex_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }
}
