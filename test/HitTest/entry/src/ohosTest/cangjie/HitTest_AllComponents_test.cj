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
// Test class for all components HitTest_AllComponents coverage
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Stack_comattr_hitTest_arkts.*
import ohos_app_cangjie_entry.Stack_comattr_hitTest_1.*
import ohos_app_cangjie_entry.HitTest_AllComponents.*
import ohos.arkui.component.custom_component.CustomView
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText
import kit.PerformanceAnalysisKit.Hilog
import std.collection.*
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*
import ohos.ui_test.*
import ohos_app_cangjie_entry.*
import ohos.base.*

@Test
class HitTest_AllComponents_test {
    private func clickAndWait(compId: String): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id(compId), 3000)
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Button_0100
     * @tc.name      : TestCase_Button
     * @tc.desc      : test hitTestBehavior Block on Button
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Button(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Button"
            modtestView[0] = {_: CustomView => View_HitTest_Button(Option<CustomView>.None) }
        }
        clickAndWait("Button_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Text_0100
     * @tc.name      : TestCase_Text
     * @tc.desc      : test hitTestBehavior Block on Text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Text(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Text"
            modtestView[0] = {_: CustomView => View_HitTest_Text(Option<CustomView>.None) }
        }
        clickAndWait("Text_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Image_0100
     * @tc.name      : TestCase_Image
     * @tc.desc      : test hitTestBehavior Block on Image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Image(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Image"
            modtestView[0] = {_: CustomView => View_HitTest_Image(Option<CustomView>.None) }
        }
        clickAndWait("Image_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Image_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Blank_0100
     * @tc.name      : TestCase_Blank
     * @tc.desc      : test hitTestBehavior Block on Blank
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Blank(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Blank"
            modtestView[0] = {_: CustomView => View_HitTest_Blank(Option<CustomView>.None) }
        }
        clickAndWait("Blank_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Blank_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Divider_0100
     * @tc.name      : TestCase_Divider
     * @tc.desc      : test hitTestBehavior Block on Divider
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Divider(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Divider"
            modtestView[0] = {_: CustomView => View_HitTest_Divider(Option<CustomView>.None) }
        }
        clickAndWait("Divider_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Divider_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Progress_0100
     * @tc.name      : TestCase_Progress
     * @tc.desc      : test hitTestBehavior Block on Progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Progress(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Progress"
            modtestView[0] = {_: CustomView => View_HitTest_Progress(Option<CustomView>.None) }
        }
        clickAndWait("Progress_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Progress_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_LoadingProgress_0100
     * @tc.name      : TestCase_LoadingProgress
     * @tc.desc      : test hitTestBehavior Block on LoadingProgress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_LoadingProgress(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_LoadingProgress"
            modtestView[0] = {_: CustomView => View_HitTest_LoadingProgress(Option<CustomView>.None) }
        }
        clickAndWait("LoadingProgress_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("LoadingProgress_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Toggle_0100
     * @tc.name      : TestCase_Toggle
     * @tc.desc      : test hitTestBehavior Block on Toggle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Toggle(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Toggle"
            modtestView[0] = {_: CustomView => View_HitTest_Toggle(Option<CustomView>.None) }
        }
        clickAndWait("Toggle_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Toggle_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Badge_0100
     * @tc.name      : TestCase_Badge
     * @tc.desc      : test hitTestBehavior Block on Badge
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Badge(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Badge"
            modtestView[0] = {_: CustomView => View_HitTest_Badge(Option<CustomView>.None) }
        }
        clickAndWait("Badge_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Badge_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Search_0100
     * @tc.name      : TestCase_Search
     * @tc.desc      : test hitTestBehavior Block on Search
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Search(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Search"
            modtestView[0] = {_: CustomView => View_HitTest_Search(Option<CustomView>.None) }
        }
        clickAndWait("Search_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Search_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Select_0100
     * @tc.name      : TestCase_Select
     * @tc.desc      : test hitTestBehavior Block on Select
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Select(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Select"
            modtestView[0] = {_: CustomView => View_HitTest_Select(Option<CustomView>.None) }
        }
        clickAndWait("Select_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Select_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Slider_0100
     * @tc.name      : TestCase_Slider
     * @tc.desc      : test hitTestBehavior Block on Slider
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Slider(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Slider"
            modtestView[0] = {_: CustomView => View_HitTest_Slider(Option<CustomView>.None) }
        }
        clickAndWait("Slider_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Slider_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Rating_0100
     * @tc.name      : TestCase_Rating
     * @tc.desc      : test hitTestBehavior Block on Rating
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Rating(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Rating"
            modtestView[0] = {_: CustomView => View_HitTest_Rating(Option<CustomView>.None) }
        }
        clickAndWait("Rating_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Rating_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Gauge_0100
     * @tc.name      : TestCase_Gauge
     * @tc.desc      : test hitTestBehavior Block on Gauge
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Gauge(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Gauge"
            modtestView[0] = {_: CustomView => View_HitTest_Gauge(Option<CustomView>.None) }
        }
        clickAndWait("Gauge_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Gauge_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_DataPanel_0100
     * @tc.name      : TestCase_DataPanel
     * @tc.desc      : test hitTestBehavior Block on DataPanel
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DataPanel(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_DataPanel"
            modtestView[0] = {_: CustomView => View_HitTest_DataPanel(Option<CustomView>.None) }
        }
        clickAndWait("DataPanel_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("DataPanel_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_QRCode_0100
     * @tc.name      : TestCase_QRCode
     * @tc.desc      : test hitTestBehavior Block on QRCode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_QRCode(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_QRCode"
            modtestView[0] = {_: CustomView => View_HitTest_QRCode(Option<CustomView>.None) }
        }
        clickAndWait("QRCode_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("QRCode_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_TextInput_0100
     * @tc.name      : TestCase_TextInput
     * @tc.desc      : test hitTestBehavior Block on TextInput
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextInput(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextInput"
            modtestView[0] = {_: CustomView => View_HitTest_TextInput(Option<CustomView>.None) }
        }
        clickAndWait("TextInput_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextInput_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_TextArea_0100
     * @tc.name      : TestCase_TextArea
     * @tc.desc      : test hitTestBehavior Block on TextArea
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextArea(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextArea"
            modtestView[0] = {_: CustomView => View_HitTest_TextArea(Option<CustomView>.None) }
        }
        clickAndWait("TextArea_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextArea_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_TextField_0100
     * @tc.name      : TestCase_TextField
     * @tc.desc      : test hitTestBehavior Block on TextField
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextField(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextField"
            modtestView[0] = {_: CustomView => View_HitTest_TextField(Option<CustomView>.None) }
        }
        clickAndWait("TextField_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextField_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_RichEditor_0100
     * @tc.name      : TestCase_RichEditor
     * @tc.desc      : test hitTestBehavior Block on RichEditor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RichEditor(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_RichEditor"
            modtestView[0] = {_: CustomView => View_HitTest_RichEditor(Option<CustomView>.None) }
        }
        clickAndWait("RichEditor_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RichEditor_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_PatternLock_0100
     * @tc.name      : TestCase_PatternLock
     * @tc.desc      : test hitTestBehavior Block on PatternLock
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_PatternLock(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_PatternLock"
            modtestView[0] = {_: CustomView => View_HitTest_PatternLock(Option<CustomView>.None) }
        }
        clickAndWait("PatternLock_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("PatternLock_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Checkbox_0100
     * @tc.name      : TestCase_Checkbox
     * @tc.desc      : test hitTestBehavior Block on Checkbox
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Checkbox(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Checkbox"
            modtestView[0] = {_: CustomView => View_HitTest_Checkbox(Option<CustomView>.None) }
        }
        clickAndWait("Checkbox_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Checkbox_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_CheckboxGroup_0100
     * @tc.name      : TestCase_CheckboxGroup
     * @tc.desc      : test hitTestBehavior Block on CheckboxGroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_CheckboxGroup(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_CheckboxGroup"
            modtestView[0] = {_: CustomView => View_HitTest_CheckboxGroup(Option<CustomView>.None) }
        }
        clickAndWait("CheckboxGroup_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("CheckboxGroup_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Radio_0100
     * @tc.name      : TestCase_Radio
     * @tc.desc      : test hitTestBehavior Block on Radio
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Radio(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Radio"
            modtestView[0] = {_: CustomView => View_HitTest_Radio(Option<CustomView>.None) }
        }
        clickAndWait("Radio_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Radio_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_DatePicker_0100
     * @tc.name      : TestCase_DatePicker
     * @tc.desc      : test hitTestBehavior Block on DatePicker
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DatePicker(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_DatePicker"
            modtestView[0] = {_: CustomView => View_HitTest_DatePicker(Option<CustomView>.None) }
        }
        clickAndWait("DatePicker_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("DatePicker_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_TextPicker_0100
     * @tc.name      : TestCase_TextPicker
     * @tc.desc      : test hitTestBehavior Block on TextPicker
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextPicker(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextPicker"
            modtestView[0] = {_: CustomView => View_HitTest_TextPicker(Option<CustomView>.None) }
        }
        clickAndWait("TextPicker_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextPicker_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Stepper_0100
     * @tc.name      : TestCase_Stepper
     * @tc.desc      : test hitTestBehavior Block on Stepper
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Stepper(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Stepper"
            modtestView[0] = {_: CustomView => View_HitTest_Stepper(Option<CustomView>.None) }
        }
        clickAndWait("Stepper_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stepper_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_StepperItem_0100
     * @tc.name      : TestCase_StepperItem
     * @tc.desc      : test hitTestBehavior Block on StepperItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_StepperItem(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_StepperItem"
            modtestView[0] = {_: CustomView => View_HitTest_StepperItem(Option<CustomView>.None) }
        }
        clickAndWait("StepperItem_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("StepperItem_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Counter_0100
     * @tc.name      : TestCase_Counter
     * @tc.desc      : test hitTestBehavior Block on Counter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Counter(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Counter"
            modtestView[0] = {_: CustomView => View_HitTest_Counter(Option<CustomView>.None) }
        }
        clickAndWait("Counter_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Counter_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_TextClock_0100
     * @tc.name      : TestCase_TextClock
     * @tc.desc      : test hitTestBehavior Block on TextClock
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextClock(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextClock"
            modtestView[0] = {_: CustomView => View_HitTest_TextClock(Option<CustomView>.None) }
        }
        clickAndWait("TextClock_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextClock_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_TextTimer_0100
     * @tc.name      : TestCase_TextTimer
     * @tc.desc      : test hitTestBehavior Block on TextTimer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextTimer(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextTimer"
            modtestView[0] = {_: CustomView => View_HitTest_TextTimer(Option<CustomView>.None) }
        }
        clickAndWait("TextTimer_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextTimer_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Video_0100
     * @tc.name      : TestCase_Video
     * @tc.desc      : test hitTestBehavior Block on Video
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Video(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Video"
            modtestView[0] = {_: CustomView => View_HitTest_Video(Option<CustomView>.None) }
        }
        clickAndWait("Video_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Video_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Web_0100
     * @tc.name      : TestCase_Web
     * @tc.desc      : test hitTestBehavior Block on Web
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Web(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Web"
            modtestView[0] = {_: CustomView => View_HitTest_Web(Option<CustomView>.None) }
        }
        clickAndWait("Web_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Web_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Span_0100
     * @tc.name      : TestCase_Span
     * @tc.desc      : test hitTestBehavior Block on Span
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Span(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Span"
            modtestView[0] = {_: CustomView => View_HitTest_Span(Option<CustomView>.None) }
        }
        clickAndWait("Span_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Span_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_ImageSpan_0100
     * @tc.name      : TestCase_ImageSpan
     * @tc.desc      : test hitTestBehavior Block on ImageSpan
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ImageSpan(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_ImageSpan"
            modtestView[0] = {_: CustomView => View_HitTest_ImageSpan(Option<CustomView>.None) }
        }
        clickAndWait("ImageSpan_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ImageSpan_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_RichText_0100
     * @tc.name      : TestCase_RichText
     * @tc.desc      : test hitTestBehavior Block on RichText
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RichText(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_RichText"
            modtestView[0] = {_: CustomView => View_HitTest_RichText(Option<CustomView>.None) }
        }
        clickAndWait("RichText_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RichText_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Column_0100
     * @tc.name      : TestCase_Column
     * @tc.desc      : test hitTestBehavior Block on Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Column(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Column"
            modtestView[0] = {_: CustomView => View_HitTest_Column(Option<CustomView>.None) }
        }
        clickAndWait("Column_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Row_0100
     * @tc.name      : TestCase_Row
     * @tc.desc      : test hitTestBehavior Block on Row
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Row(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Row"
            modtestView[0] = {_: CustomView => View_HitTest_Row(Option<CustomView>.None) }
        }
        clickAndWait("Row_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Row_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Stack_0100
     * @tc.name      : TestCase_Stack
     * @tc.desc      : test hitTestBehavior Block on Stack
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Stack(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Stack"
            modtestView[0] = {_: CustomView => View_HitTest_Stack(Option<CustomView>.None) }
        }
        clickAndWait("Stack_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Flex_0100
     * @tc.name      : TestCase_Flex
     * @tc.desc      : test hitTestBehavior Block on Flex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Flex(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Flex"
            modtestView[0] = {_: CustomView => View_HitTest_Flex(Option<CustomView>.None) }
        }
        clickAndWait("Flex_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Flex_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Grid_0100
     * @tc.name      : TestCase_Grid
     * @tc.desc      : test hitTestBehavior Block on Grid
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Grid(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Grid"
            modtestView[0] = {_: CustomView => View_HitTest_Grid(Option<CustomView>.None) }
        }
        clickAndWait("Grid_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Grid_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_GridItem_0100
     * @tc.name      : TestCase_GridItem
     * @tc.desc      : test hitTestBehavior Block on GridItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_GridItem(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_GridItem"
            modtestView[0] = {_: CustomView => View_HitTest_GridItem(Option<CustomView>.None) }
        }
        clickAndWait("GridItem_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridItem_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_GridRow_0100
     * @tc.name      : TestCase_GridRow
     * @tc.desc      : test hitTestBehavior Block on GridRow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_GridRow(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_GridRow"
            modtestView[0] = {_: CustomView => View_HitTest_GridRow(Option<CustomView>.None) }
        }
        clickAndWait("GridRow_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridRow_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_GridCol_0100
     * @tc.name      : TestCase_GridCol
     * @tc.desc      : test hitTestBehavior Block on GridCol
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_GridCol(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_GridCol"
            modtestView[0] = {_: CustomView => View_HitTest_GridCol(Option<CustomView>.None) }
        }
        clickAndWait("GridCol_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridCol_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_List_0100
     * @tc.name      : TestCase_List
     * @tc.desc      : test hitTestBehavior Block on List
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_List(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_List"
            modtestView[0] = {_: CustomView => View_HitTest_List(Option<CustomView>.None) }
        }
        clickAndWait("List_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("List_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_ListItem_0100
     * @tc.name      : TestCase_ListItem
     * @tc.desc      : test hitTestBehavior Block on ListItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ListItem(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_ListItem"
            modtestView[0] = {_: CustomView => View_HitTest_ListItem(Option<CustomView>.None) }
        }
        clickAndWait("ListItem_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ListItem_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_ListItemGroup_0100
     * @tc.name      : TestCase_ListItemGroup
     * @tc.desc      : test hitTestBehavior Block on ListItemGroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ListItemGroup(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_ListItemGroup"
            modtestView[0] = {_: CustomView => View_HitTest_ListItemGroup(Option<CustomView>.None) }
        }
        clickAndWait("ListItemGroup_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ListItemGroup_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Scroll_0100
     * @tc.name      : TestCase_Scroll
     * @tc.desc      : test hitTestBehavior Block on Scroll
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Scroll(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Scroll"
            modtestView[0] = {_: CustomView => View_HitTest_Scroll(Option<CustomView>.None) }
        }
        clickAndWait("Scroll_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Scroll_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_ScrollBar_0100
     * @tc.name      : TestCase_ScrollBar
     * @tc.desc      : test hitTestBehavior Block on ScrollBar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ScrollBar(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_ScrollBar"
            modtestView[0] = {_: CustomView => View_HitTest_ScrollBar(Option<CustomView>.None) }
        }
        clickAndWait("ScrollBar_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ScrollBar_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Swiper_0100
     * @tc.name      : TestCase_Swiper
     * @tc.desc      : test hitTestBehavior Block on Swiper
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Swiper(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Swiper"
            modtestView[0] = {_: CustomView => View_HitTest_Swiper(Option<CustomView>.None) }
        }
        clickAndWait("Swiper_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Swiper_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_TabContent_0100
     * @tc.name      : TestCase_TabContent
     * @tc.desc      : test hitTestBehavior Block on TabContent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TabContent(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_TabContent"
            modtestView[0] = {_: CustomView => View_HitTest_TabContent(Option<CustomView>.None) }
        }
        clickAndWait("TabContent_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TabContent_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Refresh_0100
     * @tc.name      : TestCase_Refresh
     * @tc.desc      : test hitTestBehavior Block on Refresh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Refresh(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Refresh"
            modtestView[0] = {_: CustomView => View_HitTest_Refresh(Option<CustomView>.None) }
        }
        clickAndWait("Refresh_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Refresh_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Sidebar_0100
     * @tc.name      : TestCase_Sidebar
     * @tc.desc      : test hitTestBehavior Block on Sidebar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Sidebar(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Sidebar"
            modtestView[0] = {_: CustomView => View_HitTest_Sidebar(Option<CustomView>.None) }
        }
        clickAndWait("Sidebar_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Sidebar_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Navigation_0100
     * @tc.name      : TestCase_Navigation
     * @tc.desc      : test hitTestBehavior Block on Navigation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Navigation(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Navigation"
            modtestView[0] = {_: CustomView => View_HitTest_Navigation(Option<CustomView>.None) }
        }
        clickAndWait("Navigation_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Navigation_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_RelativeContainer_0100
     * @tc.name      : TestCase_RelativeContainer
     * @tc.desc      : test hitTestBehavior Block on RelativeContainer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RelativeContainer(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_RelativeContainer"
            modtestView[0] = {_: CustomView => View_HitTest_RelativeContainer(Option<CustomView>.None) }
        }
        clickAndWait("RelativeContainer_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RelativeContainer_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Shape_0100
     * @tc.name      : TestCase_Shape
     * @tc.desc      : test hitTestBehavior Block on Shape
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Shape(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Shape"
            modtestView[0] = {_: CustomView => View_HitTest_Shape(Option<CustomView>.None) }
        }
        clickAndWait("Shape_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Shape_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Ellipse_0100
     * @tc.name      : TestCase_Ellipse
     * @tc.desc      : test hitTestBehavior Block on Ellipse
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Ellipse(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Ellipse"
            modtestView[0] = {_: CustomView => View_HitTest_Ellipse(Option<CustomView>.None) }
        }
        clickAndWait("Ellipse_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Ellipse_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Circle_0100
     * @tc.name      : TestCase_Circle
     * @tc.desc      : test hitTestBehavior Block on Circle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Circle(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Circle"
            modtestView[0] = {_: CustomView => View_HitTest_Circle(Option<CustomView>.None) }
        }
        clickAndWait("Circle_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Circle_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Path_0100
     * @tc.name      : TestCase_Path
     * @tc.desc      : test hitTestBehavior Block on Path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Path(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Path"
            modtestView[0] = {_: CustomView => View_HitTest_Path(Option<CustomView>.None) }
        }
        clickAndWait("Path_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Path_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Path2D_0100
     * @tc.name      : TestCase_Path2D
     * @tc.desc      : test hitTestBehavior Block on Path2D
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Path2D(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Path2D"
            modtestView[0] = {_: CustomView => View_HitTest_Path2D(Option<CustomView>.None) }
        }
        clickAndWait("Path2D_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Path2D_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Line_0100
     * @tc.name      : TestCase_Line
     * @tc.desc      : test hitTestBehavior Block on Line
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Line(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Line"
            modtestView[0] = {_: CustomView => View_HitTest_Line(Option<CustomView>.None) }
        }
        clickAndWait("Line_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Line_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Rect_0100
     * @tc.name      : TestCase_Rect
     * @tc.desc      : test hitTestBehavior Block on Rect
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Rect(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Rect"
            modtestView[0] = {_: CustomView => View_HitTest_Rect(Option<CustomView>.None) }
        }
        clickAndWait("Rect_comattr_id")
        @Expect("\"true\"", "\"true\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Canvas_0100
     * @tc.name      : TestCase_Canvas
     * @tc.desc      : test hitTestBehavior Block on Canvas
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Canvas(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Canvas"
            modtestView[0] = {_: CustomView => View_HitTest_Canvas(Option<CustomView>.None) }
        }
        clickAndWait("Canvas_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Canvas_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_AlphabetIndexer_0100
     * @tc.name      : TestCase_AlphabetIndexer
     * @tc.desc      : test hitTestBehavior Block on AlphabetIndexer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_AlphabetIndexer(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_AlphabetIndexer"
            modtestView[0] = {_: CustomView => View_HitTest_AlphabetIndexer(Option<CustomView>.None) }
        }
        clickAndWait("AlphabetIndexer_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("AlphabetIndexer_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Menu_0100
     * @tc.name      : TestCase_Menu
     * @tc.desc      : test hitTestBehavior Block on Menu
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Menu(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Menu"
            modtestView[0] = {_: CustomView => View_HitTest_Menu(Option<CustomView>.None) }
        }
        clickAndWait("Menu_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Menu_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_MenuItem_0100
     * @tc.name      : TestCase_MenuItem
     * @tc.desc      : test hitTestBehavior Block on MenuItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MenuItem(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_MenuItem"
            modtestView[0] = {_: CustomView => View_HitTest_MenuItem(Option<CustomView>.None) }
        }
        clickAndWait("MenuItem_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("MenuItem_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_MenuItemGroup_0100
     * @tc.name      : TestCase_MenuItemGroup
     * @tc.desc      : test hitTestBehavior Block on MenuItemGroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MenuItemGroup(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_MenuItemGroup"
            modtestView[0] = {_: CustomView => View_HitTest_MenuItemGroup(Option<CustomView>.None) }
        }
        clickAndWait("MenuItemGroup_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("MenuItemGroup_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_NavDestination_0100
     * @tc.name      : TestCase_NavDestination
     * @tc.desc      : test hitTestBehavior Block on NavDestination
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NavDestination(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_NavDestination"
            modtestView[0] = {_: CustomView => View_HitTest_NavDestination(Option<CustomView>.None) }
        }
        clickAndWait("NavDestination_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("NavDestination_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_RowSplit_0100
     * @tc.name      : TestCase_RowSplit
     * @tc.desc      : test hitTestBehavior Block on RowSplit
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RowSplit(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_RowSplit"
            modtestView[0] = {_: CustomView => View_HitTest_RowSplit(Option<CustomView>.None) }
        }
        clickAndWait("RowSplit_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RowSplit_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestHitTest_AllComponents_Tabs_0100
     * @tc.name      : TestCase_Tabs
     * @tc.desc      : test hitTestBehavior Block on Tabs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Tabs(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "HitTest_AllComponents_test"
            modtestCaseText[0] = "TestCase_Tabs"
            modtestView[0] = {_: CustomView => View_HitTest_Tabs(Option<CustomView>.None) }
        }
        clickAndWait("Tabs_comattr_id")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Tabs_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }
}
