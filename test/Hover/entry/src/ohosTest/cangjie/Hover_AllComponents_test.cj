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
// Test class for all components Hover_AllComponents coverage
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Hover_AllComponents.*
import ohos_app_cangjie_entry.Column_comattr_hover_arkts.*
import ohos_app_cangjie_entry.Column_comattr_hover_1.*
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
class Hover_AllComponents_test {
    /*
     * @tc.number    : TestHover_AllComponents_Button_0100
     * @tc.name      : TestCase_Button
     * @tc.desc      : test hoverEffect Scale of Button
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Button(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Button begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Button"
            modtestView[0] = {_: CustomView => View_Hover_Button(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Button ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Text_0100
     * @tc.name      : TestCase_Text
     * @tc.desc      : test hoverEffect Scale of Text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Text(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Text begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Text"
            modtestView[0] = {_: CustomView => View_Hover_Text(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Text_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Text ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Image_0100
     * @tc.name      : TestCase_Image
     * @tc.desc      : test hoverEffect Scale of Image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Image(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Image begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Image"
            modtestView[0] = {_: CustomView => View_Hover_Image(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Image_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Image_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Image ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Blank_0100
     * @tc.name      : TestCase_Blank
     * @tc.desc      : test hoverEffect Scale of Blank
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Blank(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Blank begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Blank"
            modtestView[0] = {_: CustomView => View_Hover_Blank(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Blank_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Blank_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Blank ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Divider_0100
     * @tc.name      : TestCase_Divider
     * @tc.desc      : test hoverEffect Scale of Divider
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Divider(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Divider begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Divider"
            modtestView[0] = {_: CustomView => View_Hover_Divider(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Divider_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Divider_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Divider ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Progress_0100
     * @tc.name      : TestCase_Progress
     * @tc.desc      : test hoverEffect Scale of Progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Progress(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Progress begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Progress"
            modtestView[0] = {_: CustomView => View_Hover_Progress(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Progress_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Progress_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Progress ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_LoadingProgress_0100
     * @tc.name      : TestCase_LoadingProgress
     * @tc.desc      : test hoverEffect Scale of LoadingProgress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_LoadingProgress(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_LoadingProgress begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_LoadingProgress"
            modtestView[0] = {_: CustomView => View_Hover_LoadingProgress(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("LoadingProgress_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("LoadingProgress_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_LoadingProgress ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Toggle_0100
     * @tc.name      : TestCase_Toggle
     * @tc.desc      : test hoverEffect Scale of Toggle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Toggle(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Toggle begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Toggle"
            modtestView[0] = {_: CustomView => View_Hover_Toggle(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Toggle_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Toggle_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Toggle ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Badge_0100
     * @tc.name      : TestCase_Badge
     * @tc.desc      : test hoverEffect Scale of Badge
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Badge(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Badge begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Badge"
            modtestView[0] = {_: CustomView => View_Hover_Badge(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Badge_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Badge_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Badge ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Search_0100
     * @tc.name      : TestCase_Search
     * @tc.desc      : test hoverEffect Scale of Search
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Search(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Search begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Search"
            modtestView[0] = {_: CustomView => View_Hover_Search(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Search_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Search_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Search ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Select_0100
     * @tc.name      : TestCase_Select
     * @tc.desc      : test hoverEffect Scale of Select
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Select(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Select begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Select"
            modtestView[0] = {_: CustomView => View_Hover_Select(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Select_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Select_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Select ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Slider_0100
     * @tc.name      : TestCase_Slider
     * @tc.desc      : test hoverEffect Scale of Slider
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Slider(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Slider begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Slider"
            modtestView[0] = {_: CustomView => View_Hover_Slider(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Slider_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Slider_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Slider ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Rating_0100
     * @tc.name      : TestCase_Rating
     * @tc.desc      : test hoverEffect Scale of Rating
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Rating(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Rating begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Rating"
            modtestView[0] = {_: CustomView => View_Hover_Rating(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Rating_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Rating_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Rating ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Gauge_0100
     * @tc.name      : TestCase_Gauge
     * @tc.desc      : test hoverEffect Scale of Gauge
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Gauge(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Gauge begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Gauge"
            modtestView[0] = {_: CustomView => View_Hover_Gauge(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Gauge_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Gauge_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Gauge ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_DataPanel_0100
     * @tc.name      : TestCase_DataPanel
     * @tc.desc      : test hoverEffect Scale of DataPanel
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DataPanel(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DataPanel begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_DataPanel"
            modtestView[0] = {_: CustomView => View_Hover_DataPanel(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("DataPanel_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("DataPanel_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DataPanel ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_QRCode_0100
     * @tc.name      : TestCase_QRCode
     * @tc.desc      : test hoverEffect Scale of QRCode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_QRCode(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_QRCode begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_QRCode"
            modtestView[0] = {_: CustomView => View_Hover_QRCode(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("QRCode_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("QRCode_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_QRCode ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_TextInput_0100
     * @tc.name      : TestCase_TextInput
     * @tc.desc      : test hoverEffect Scale of TextInput
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextInput(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextInput begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextInput"
            modtestView[0] = {_: CustomView => View_Hover_TextInput(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextInput_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextInput_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextInput ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_TextArea_0100
     * @tc.name      : TestCase_TextArea
     * @tc.desc      : test hoverEffect Scale of TextArea
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextArea(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextArea begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextArea"
            modtestView[0] = {_: CustomView => View_Hover_TextArea(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextArea_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextArea_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextArea ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_TextField_0100
     * @tc.name      : TestCase_TextField
     * @tc.desc      : test hoverEffect Scale of TextField
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextField(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextField begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextField"
            modtestView[0] = {_: CustomView => View_Hover_TextField(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextField_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextField_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextField ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_RichEditor_0100
     * @tc.name      : TestCase_RichEditor
     * @tc.desc      : test hoverEffect Scale of RichEditor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RichEditor(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichEditor begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_RichEditor"
            modtestView[0] = {_: CustomView => View_Hover_RichEditor(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RichEditor_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RichEditor_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichEditor ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_PatternLock_0100
     * @tc.name      : TestCase_PatternLock
     * @tc.desc      : test hoverEffect Scale of PatternLock
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_PatternLock(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_PatternLock begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_PatternLock"
            modtestView[0] = {_: CustomView => View_Hover_PatternLock(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("PatternLock_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("PatternLock_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_PatternLock ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Checkbox_0100
     * @tc.name      : TestCase_Checkbox
     * @tc.desc      : test hoverEffect Scale of Checkbox
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Checkbox(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Checkbox begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Checkbox"
            modtestView[0] = {_: CustomView => View_Hover_Checkbox(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Checkbox_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Checkbox_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Checkbox ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_CheckboxGroup_0100
     * @tc.name      : TestCase_CheckboxGroup
     * @tc.desc      : test hoverEffect Scale of CheckboxGroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_CheckboxGroup(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_CheckboxGroup begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_CheckboxGroup"
            modtestView[0] = {_: CustomView => View_Hover_CheckboxGroup(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("CheckboxGroup_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("CheckboxGroup_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_CheckboxGroup ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Radio_0100
     * @tc.name      : TestCase_Radio
     * @tc.desc      : test hoverEffect Scale of Radio
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Radio(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Radio begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Radio"
            modtestView[0] = {_: CustomView => View_Hover_Radio(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Radio_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Radio_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Radio ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_DatePicker_0100
     * @tc.name      : TestCase_DatePicker
     * @tc.desc      : test hoverEffect Scale of DatePicker
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DatePicker(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DatePicker begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_DatePicker"
            modtestView[0] = {_: CustomView => View_Hover_DatePicker(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("DatePicker_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("DatePicker_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DatePicker ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_TextPicker_0100
     * @tc.name      : TestCase_TextPicker
     * @tc.desc      : test hoverEffect Scale of TextPicker
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextPicker(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextPicker begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextPicker"
            modtestView[0] = {_: CustomView => View_Hover_TextPicker(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextPicker_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextPicker_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextPicker ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Stepper_0100
     * @tc.name      : TestCase_Stepper
     * @tc.desc      : test hoverEffect Scale of Stepper
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Stepper(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stepper begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Stepper"
            modtestView[0] = {_: CustomView => View_Hover_Stepper(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stepper_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stepper_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stepper ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_StepperItem_0100
     * @tc.name      : TestCase_StepperItem
     * @tc.desc      : test hoverEffect Scale of StepperItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_StepperItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_StepperItem begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_StepperItem"
            modtestView[0] = {_: CustomView => View_Hover_StepperItem(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("StepperItem_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("StepperItem_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_StepperItem ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Counter_0100
     * @tc.name      : TestCase_Counter
     * @tc.desc      : test hoverEffect Scale of Counter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Counter(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Counter begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Counter"
            modtestView[0] = {_: CustomView => View_Hover_Counter(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Counter_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Counter_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Counter ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_TextClock_0100
     * @tc.name      : TestCase_TextClock
     * @tc.desc      : test hoverEffect Scale of TextClock
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextClock(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextClock begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextClock"
            modtestView[0] = {_: CustomView => View_Hover_TextClock(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextClock_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextClock_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextClock ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_TextTimer_0100
     * @tc.name      : TestCase_TextTimer
     * @tc.desc      : test hoverEffect Scale of TextTimer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextTimer(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextTimer begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_TextTimer"
            modtestView[0] = {_: CustomView => View_Hover_TextTimer(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextTimer_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextTimer_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextTimer ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Video_0100
     * @tc.name      : TestCase_Video
     * @tc.desc      : test hoverEffect Scale of Video
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Video(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Video begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Video"
            modtestView[0] = {_: CustomView => View_Hover_Video(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Video_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Video_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Video ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Web_0100
     * @tc.name      : TestCase_Web
     * @tc.desc      : test hoverEffect Scale of Web
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Web(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Web begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Web"
            modtestView[0] = {_: CustomView => View_Hover_Web(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Web_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Web_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Web ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Span_0100
     * @tc.name      : TestCase_Span
     * @tc.desc      : test hoverEffect Scale of Span
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Span(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Span begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Span"
            modtestView[0] = {_: CustomView => View_Hover_Span(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Span_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Span_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Span ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_ImageSpan_0100
     * @tc.name      : TestCase_ImageSpan
     * @tc.desc      : test hoverEffect Scale of ImageSpan
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ImageSpan(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ImageSpan begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_ImageSpan"
            modtestView[0] = {_: CustomView => View_Hover_ImageSpan(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ImageSpan_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ImageSpan_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ImageSpan ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_RichText_0100
     * @tc.name      : TestCase_RichText
     * @tc.desc      : test hoverEffect Scale of RichText
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RichText(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichText begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_RichText"
            modtestView[0] = {_: CustomView => View_Hover_RichText(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RichText_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RichText_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichText ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Column_0100
     * @tc.name      : TestCase_Column
     * @tc.desc      : test hoverEffect Scale of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Column(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Column begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Column"
            modtestView[0] = {_: CustomView => View_Hover_Column(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Column ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Row_0100
     * @tc.name      : TestCase_Row
     * @tc.desc      : test hoverEffect Scale of Row
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Row(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Row begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Row"
            modtestView[0] = {_: CustomView => View_Hover_Row(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Row_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Row_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Row ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Stack_0100
     * @tc.name      : TestCase_Stack
     * @tc.desc      : test hoverEffect Scale of Stack
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Stack(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stack begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Stack"
            modtestView[0] = {_: CustomView => View_Hover_Stack(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stack_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stack ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Flex_0100
     * @tc.name      : TestCase_Flex
     * @tc.desc      : test hoverEffect Scale of Flex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Flex(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Flex begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Flex"
            modtestView[0] = {_: CustomView => View_Hover_Flex(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Flex_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Flex_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Flex ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Grid_0100
     * @tc.name      : TestCase_Grid
     * @tc.desc      : test hoverEffect Scale of Grid
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Grid(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Grid begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Grid"
            modtestView[0] = {_: CustomView => View_Hover_Grid(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Grid_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Grid_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Grid ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_GridItem_0100
     * @tc.name      : TestCase_GridItem
     * @tc.desc      : test hoverEffect Scale of GridItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_GridItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridItem begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_GridItem"
            modtestView[0] = {_: CustomView => View_Hover_GridItem(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridItem_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridItem_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridItem ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_GridRow_0100
     * @tc.name      : TestCase_GridRow
     * @tc.desc      : test hoverEffect Scale of GridRow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_GridRow(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridRow begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_GridRow"
            modtestView[0] = {_: CustomView => View_Hover_GridRow(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridRow_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridRow_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridRow ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_GridCol_0100
     * @tc.name      : TestCase_GridCol
     * @tc.desc      : test hoverEffect Scale of GridCol
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_GridCol(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridCol begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_GridCol"
            modtestView[0] = {_: CustomView => View_Hover_GridCol(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridCol_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridCol_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridCol ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_List_0100
     * @tc.name      : TestCase_List
     * @tc.desc      : test hoverEffect Scale of List
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_List(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_List begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_List"
            modtestView[0] = {_: CustomView => View_Hover_List(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("List_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("List_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_List ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_ListItem_0100
     * @tc.name      : TestCase_ListItem
     * @tc.desc      : test hoverEffect Scale of ListItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ListItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ListItem begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_ListItem"
            modtestView[0] = {_: CustomView => View_Hover_ListItem(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ListItem_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ListItem_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ListItem ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_ListItemGroup_0100
     * @tc.name      : TestCase_ListItemGroup
     * @tc.desc      : test hoverEffect Scale of ListItemGroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ListItemGroup(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ListItemGroup begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_ListItemGroup"
            modtestView[0] = {_: CustomView => View_Hover_ListItemGroup(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ListItemGroup_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ListItemGroup_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ListItemGroup ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Scroll_0100
     * @tc.name      : TestCase_Scroll
     * @tc.desc      : test hoverEffect Scale of Scroll
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Scroll(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Scroll begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Scroll"
            modtestView[0] = {_: CustomView => View_Hover_Scroll(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Scroll_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Scroll_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Scroll ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_ScrollBar_0100
     * @tc.name      : TestCase_ScrollBar
     * @tc.desc      : test hoverEffect Scale of ScrollBar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ScrollBar(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ScrollBar begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_ScrollBar"
            modtestView[0] = {_: CustomView => View_Hover_ScrollBar(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ScrollBar_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ScrollBar_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ScrollBar ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Swiper_0100
     * @tc.name      : TestCase_Swiper
     * @tc.desc      : test hoverEffect Scale of Swiper
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Swiper(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Swiper begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Swiper"
            modtestView[0] = {_: CustomView => View_Hover_Swiper(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Swiper_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Swiper_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Swiper ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_TabContent_0100
     * @tc.name      : TestCase_TabContent
     * @tc.desc      : test hoverEffect Scale of TabContent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TabContent(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TabContent begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_TabContent"
            modtestView[0] = {_: CustomView => View_Hover_TabContent(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TabContent_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TabContent_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TabContent ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Refresh_0100
     * @tc.name      : TestCase_Refresh
     * @tc.desc      : test hoverEffect Scale of Refresh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Refresh(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Refresh begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Refresh"
            modtestView[0] = {_: CustomView => View_Hover_Refresh(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Refresh_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Refresh_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Refresh ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Sidebar_0100
     * @tc.name      : TestCase_Sidebar
     * @tc.desc      : test hoverEffect Scale of Sidebar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Sidebar(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Sidebar begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Sidebar"
            modtestView[0] = {_: CustomView => View_Hover_Sidebar(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Sidebar_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Sidebar_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Sidebar ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Navigation_0100
     * @tc.name      : TestCase_Navigation
     * @tc.desc      : test hoverEffect Scale of Navigation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Navigation(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Navigation begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Navigation"
            modtestView[0] = {_: CustomView => View_Hover_Navigation(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Navigation_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Navigation_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Navigation ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_RelativeContainer_0100
     * @tc.name      : TestCase_RelativeContainer
     * @tc.desc      : test hoverEffect Scale of RelativeContainer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RelativeContainer(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RelativeContainer begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_RelativeContainer"
            modtestView[0] = {_: CustomView => View_Hover_RelativeContainer(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RelativeContainer_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RelativeContainer_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RelativeContainer ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Shape_0100
     * @tc.name      : TestCase_Shape
     * @tc.desc      : test hoverEffect Scale of Shape
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Shape(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Shape begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Shape"
            modtestView[0] = {_: CustomView => View_Hover_Shape(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Shape_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Shape_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Shape ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Ellipse_0100
     * @tc.name      : TestCase_Ellipse
     * @tc.desc      : test hoverEffect Scale of Ellipse
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Ellipse(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Ellipse begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Ellipse"
            modtestView[0] = {_: CustomView => View_Hover_Ellipse(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Ellipse_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Ellipse_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Ellipse ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Circle_0100
     * @tc.name      : TestCase_Circle
     * @tc.desc      : test hoverEffect Scale of Circle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Circle(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Circle begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Circle"
            modtestView[0] = {_: CustomView => View_Hover_Circle(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Circle_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Circle_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Circle ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Path_0100
     * @tc.name      : TestCase_Path
     * @tc.desc      : test hoverEffect Scale of Path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Path(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Path"
            modtestView[0] = {_: CustomView => View_Hover_Path(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Path_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Path_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Path2D_0100
     * @tc.name      : TestCase_Path2D
     * @tc.desc      : test hoverEffect Scale of Path2D
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Path2D(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path2D begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Path2D"
            modtestView[0] = {_: CustomView => View_Hover_Path2D(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Path2D_comattr_id"), 3000)
        // @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Path2D_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path2D ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Line_0100
     * @tc.name      : TestCase_Line
     * @tc.desc      : test hoverEffect Scale of Line
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Line(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Line begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Line"
            modtestView[0] = {_: CustomView => View_Hover_Line(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Line_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Line_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Line ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Rect_0100
     * @tc.name      : TestCase_Rect
     * @tc.desc      : test hoverEffect Scale of Rect
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Rect(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Rect begins.")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Rect ends.")
    }
    /*
     * @tc.number    : TestHover_AllComponents_Canvas_0100
     * @tc.name      : TestCase_Canvas
     * @tc.desc      : test hoverEffect Scale of Canvas
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Canvas(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Canvas begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Canvas"
            modtestView[0] = {_: CustomView => View_Hover_Canvas(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Canvas_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Canvas_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Canvas ends.")
    }

    /*
     * @tc.number    : TestHover_AllComponents_AlphabetIndexer_0100
     * @tc.name      : TestCase_AlphabetIndexer
     * @tc.desc      : test hoverEffect Scale of AlphabetIndexer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_AlphabetIndexer(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_AlphabetIndexer begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_AlphabetIndexer"
            modtestView[0] = {_: CustomView => View_Hover_AlphabetIndexer(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("AlphabetIndexer_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("AlphabetIndexer_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_AlphabetIndexer ends.")
    }

    /*
     * @tc.number    : TestHover_AllComponents_Menu_0100
     * @tc.name      : TestCase_Menu
     * @tc.desc      : test hoverEffect Scale of Menu
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Menu(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Menu begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Menu"
            modtestView[0] = {_: CustomView => View_Hover_Menu(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Menu_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Menu_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Menu ends.")
    }

    /*
     * @tc.number    : TestHover_AllComponents_MenuItem_0100
     * @tc.name      : TestCase_MenuItem
     * @tc.desc      : test hoverEffect Scale of MenuItem
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MenuItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MenuItem begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_MenuItem"
            modtestView[0] = {_: CustomView => View_Hover_MenuItem(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("MenuItem_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("MenuItem_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MenuItem ends.")
    }

    /*
     * @tc.number    : TestHover_AllComponents_MenuItemGroup_0100
     * @tc.name      : TestCase_MenuItemGroup
     * @tc.desc      : test hoverEffect Scale of MenuItemGroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_MenuItemGroup(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MenuItemGroup begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_MenuItemGroup"
            modtestView[0] = {_: CustomView => View_Hover_MenuItemGroup(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("MenuItemGroup_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("MenuItemGroup_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MenuItemGroup ends.")
    }

    /*
     * @tc.number    : TestHover_AllComponents_NavDestination_0100
     * @tc.name      : TestCase_NavDestination
     * @tc.desc      : test hoverEffect Scale of NavDestination
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NavDestination(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NavDestination begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_NavDestination"
            modtestView[0] = {_: CustomView => View_Hover_NavDestination(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("NavDestination_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("NavDestination_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NavDestination ends.")
    }

    /*
     * @tc.number    : TestHover_AllComponents_RowSplit_0100
     * @tc.name      : TestCase_RowSplit
     * @tc.desc      : test hoverEffect Scale of RowSplit
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RowSplit(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RowSplit begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_RowSplit"
            modtestView[0] = {_: CustomView => View_Hover_RowSplit(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RowSplit_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RowSplit_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RowSplit ends.")
    }

    /*
     * @tc.number    : TestHover_AllComponents_Tabs_0100
     * @tc.name      : TestCase_Tabs
     * @tc.desc      : test hoverEffect Scale of Tabs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Tabs(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Tabs begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Hover_AllComponents_test"
            modtestCaseText[0] = "TestCase_Tabs"
            modtestView[0] = {_: CustomView => View_Hover_Tabs(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Tabs_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Tabs ends.")
    }
}
