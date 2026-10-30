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
// Test class for all components BgResizable_AllComponents coverage
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Button_comattr_bgResizable_arkts.*
import ohos_app_cangjie_entry.Button_comattr_bgResizable_1.*
import ohos_app_cangjie_entry.BgResizable_AllComponents.*
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
class BgResizable_AllComponents_test {
    /*
     * @tc.number    : TestBgResizable_AllComponents_Button_0100
     * @tc.name      : TestBgResizable_AllComponents_Button_0100
     * @tc.desc      : Button backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Button_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Button_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Button_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Button(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Button_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Text_0100
     * @tc.name      : TestBgResizable_AllComponents_Text_0100
     * @tc.desc      : Text backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Text_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Text_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Text_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Text(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Text_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Text_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Image_0100
     * @tc.name      : TestBgResizable_AllComponents_Image_0100
     * @tc.desc      : Image backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Image_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Image_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Image_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Image(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Image_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Image_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Image_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Blank_0100
     * @tc.name      : TestBgResizable_AllComponents_Blank_0100
     * @tc.desc      : Blank backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Blank_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Blank_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Blank_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Blank(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Blank_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Blank_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Blank_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Divider_0100
     * @tc.name      : TestBgResizable_AllComponents_Divider_0100
     * @tc.desc      : Divider backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Divider_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Divider_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Divider_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Divider(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Divider_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Divider_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Divider_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Progress_0100
     * @tc.name      : TestBgResizable_AllComponents_Progress_0100
     * @tc.desc      : Progress backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Progress_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Progress_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Progress_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Progress(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Progress_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Progress_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Progress_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_LoadingProgress_0100
     * @tc.name      : TestBgResizable_AllComponents_LoadingProgress_0100
     * @tc.desc      : LoadingProgress backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_LoadingProgress_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_LoadingProgress_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_LoadingProgress_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_LoadingProgress(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("LoadingProgress_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("LoadingProgress_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_LoadingProgress_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Toggle_0100
     * @tc.name      : TestBgResizable_AllComponents_Toggle_0100
     * @tc.desc      : Toggle backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Toggle_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Toggle_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Toggle_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Toggle(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Toggle_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Toggle_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Toggle_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Badge_0100
     * @tc.name      : TestBgResizable_AllComponents_Badge_0100
     * @tc.desc      : Badge backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Badge_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Badge_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Badge_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Badge(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Badge_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Badge_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Badge_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Search_0100
     * @tc.name      : TestBgResizable_AllComponents_Search_0100
     * @tc.desc      : Search backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Search_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Search_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Search_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Search(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Search_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Search_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Search_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Select_0100
     * @tc.name      : TestBgResizable_AllComponents_Select_0100
     * @tc.desc      : Select backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Select_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Select_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Select_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Select(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Select_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Select_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Select_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Slider_0100
     * @tc.name      : TestBgResizable_AllComponents_Slider_0100
     * @tc.desc      : Slider backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Slider_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Slider_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Slider_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Slider(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Slider_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Slider_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Slider_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Rating_0100
     * @tc.name      : TestBgResizable_AllComponents_Rating_0100
     * @tc.desc      : Rating backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Rating_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Rating_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Rating_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Rating(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Rating_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Rating_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Rating_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Gauge_0100
     * @tc.name      : TestBgResizable_AllComponents_Gauge_0100
     * @tc.desc      : Gauge backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Gauge_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Gauge_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Gauge_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Gauge(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Gauge_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Gauge_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Gauge_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_DataPanel_0100
     * @tc.name      : TestBgResizable_AllComponents_DataPanel_0100
     * @tc.desc      : DataPanel backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_DataPanel_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_DataPanel_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_DataPanel_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_DataPanel(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("DataPanel_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("DataPanel_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_DataPanel_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_QRCode_0100
     * @tc.name      : TestBgResizable_AllComponents_QRCode_0100
     * @tc.desc      : QRCode backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_QRCode_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_QRCode_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_QRCode_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_QRCode(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("QRCode_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("QRCode_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_QRCode_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_TextInput_0100
     * @tc.name      : TestBgResizable_AllComponents_TextInput_0100
     * @tc.desc      : TextInput backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_TextInput_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextInput_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_TextInput_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_TextInput(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextInput_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextInput_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextInput_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_TextArea_0100
     * @tc.name      : TestBgResizable_AllComponents_TextArea_0100
     * @tc.desc      : TextArea backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_TextArea_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextArea_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_TextArea_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_TextArea(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextArea_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextArea_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextArea_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_TextField_0100
     * @tc.name      : TestBgResizable_AllComponents_TextField_0100
     * @tc.desc      : TextField backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_TextField_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextField_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_TextField_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_TextField(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextField_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextField_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextField_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_RichEditor_0100
     * @tc.name      : TestBgResizable_AllComponents_RichEditor_0100
     * @tc.desc      : RichEditor backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_RichEditor_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RichEditor_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_RichEditor_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_RichEditor(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RichEditor_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RichEditor_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RichEditor_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_PatternLock_0100
     * @tc.name      : TestBgResizable_AllComponents_PatternLock_0100
     * @tc.desc      : PatternLock backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_PatternLock_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_PatternLock_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_PatternLock_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_PatternLock(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("PatternLock_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("PatternLock_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_PatternLock_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Checkbox_0100
     * @tc.name      : TestBgResizable_AllComponents_Checkbox_0100
     * @tc.desc      : Checkbox backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Checkbox_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Checkbox_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Checkbox_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Checkbox(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Checkbox_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Checkbox_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Checkbox_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_CheckboxGroup_0100
     * @tc.name      : TestBgResizable_AllComponents_CheckboxGroup_0100
     * @tc.desc      : CheckboxGroup backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_CheckboxGroup_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_CheckboxGroup_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_CheckboxGroup_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_CheckboxGroup(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("CheckboxGroup_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("CheckboxGroup_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_CheckboxGroup_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Radio_0100
     * @tc.name      : TestBgResizable_AllComponents_Radio_0100
     * @tc.desc      : Radio backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Radio_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Radio_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Radio_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Radio(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Radio_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Radio_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Radio_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_DatePicker_0100
     * @tc.name      : TestBgResizable_AllComponents_DatePicker_0100
     * @tc.desc      : DatePicker backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_DatePicker_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_DatePicker_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_DatePicker_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_DatePicker(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("DatePicker_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("DatePicker_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_DatePicker_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_TextPicker_0100
     * @tc.name      : TestBgResizable_AllComponents_TextPicker_0100
     * @tc.desc      : TextPicker backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_TextPicker_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextPicker_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_TextPicker_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_TextPicker(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextPicker_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextPicker_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextPicker_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Stepper_0100
     * @tc.name      : TestBgResizable_AllComponents_Stepper_0100
     * @tc.desc      : Stepper backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Stepper_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Stepper_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Stepper_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Stepper(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stepper_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stepper_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Stepper_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_StepperItem_0100
     * @tc.name      : TestBgResizable_AllComponents_StepperItem_0100
     * @tc.desc      : StepperItem backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_StepperItem_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_StepperItem_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_StepperItem_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_StepperItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("StepperItem_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("StepperItem_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_StepperItem_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Counter_0100
     * @tc.name      : TestBgResizable_AllComponents_Counter_0100
     * @tc.desc      : Counter backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Counter_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Counter_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Counter_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Counter(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Counter_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Counter_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Counter_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_TextClock_0100
     * @tc.name      : TestBgResizable_AllComponents_TextClock_0100
     * @tc.desc      : TextClock backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_TextClock_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextClock_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_TextClock_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_TextClock(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextClock_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextClock_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextClock_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_TextTimer_0100
     * @tc.name      : TestBgResizable_AllComponents_TextTimer_0100
     * @tc.desc      : TextTimer backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_TextTimer_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextTimer_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_TextTimer_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_TextTimer(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextTimer_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TextTimer_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TextTimer_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Video_0100
     * @tc.name      : TestBgResizable_AllComponents_Video_0100
     * @tc.desc      : Video backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Video_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Video_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Video_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Video(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Video_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Video_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Video_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Web_0100
     * @tc.name      : TestBgResizable_AllComponents_Web_0100
     * @tc.desc      : Web backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Web_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Web_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Web_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Web(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Web_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Web_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Web_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Span_0100
     * @tc.name      : TestBgResizable_AllComponents_Span_0100
     * @tc.desc      : Span parent Text backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Span_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Span_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Span_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Span(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Span_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Span_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Span_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_ImageSpan_0100
     * @tc.name      : TestBgResizable_AllComponents_ImageSpan_0100
     * @tc.desc      : ImageSpan parent Text backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_ImageSpan_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ImageSpan_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_ImageSpan_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_ImageSpan(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ImageSpan_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ImageSpan_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ImageSpan_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_RichText_0100
     * @tc.name      : TestBgResizable_AllComponents_RichText_0100
     * @tc.desc      : RichText backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_RichText_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RichText_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_RichText_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_RichText(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RichText_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RichText_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RichText_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Column_0100
     * @tc.name      : TestBgResizable_AllComponents_Column_0100
     * @tc.desc      : Column backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Column_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Column_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Column_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Column(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Column_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Row_0100
     * @tc.name      : TestBgResizable_AllComponents_Row_0100
     * @tc.desc      : Row backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Row_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Row_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Row_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Row(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Row_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Row_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Row_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Stack_0100
     * @tc.name      : TestBgResizable_AllComponents_Stack_0100
     * @tc.desc      : Stack backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Stack_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Stack_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Stack_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Stack(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stack_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Stack_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Flex_0100
     * @tc.name      : TestBgResizable_AllComponents_Flex_0100
     * @tc.desc      : Flex backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Flex_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Flex_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Flex_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Flex(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Flex_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Flex_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Flex_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Grid_0100
     * @tc.name      : TestBgResizable_AllComponents_Grid_0100
     * @tc.desc      : Grid backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Grid_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Grid_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Grid_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Grid(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Grid_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Grid_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Grid_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_GridItem_0100
     * @tc.name      : TestBgResizable_AllComponents_GridItem_0100
     * @tc.desc      : GridItem backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_GridItem_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_GridItem_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_GridItem_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_GridItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridItem_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridItem_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_GridItem_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_GridRow_0100
     * @tc.name      : TestBgResizable_AllComponents_GridRow_0100
     * @tc.desc      : GridRow backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_GridRow_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_GridRow_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_GridRow_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_GridRow(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridRow_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridRow_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_GridRow_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_GridCol_0100
     * @tc.name      : TestBgResizable_AllComponents_GridCol_0100
     * @tc.desc      : GridCol backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_GridCol_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_GridCol_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_GridCol_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_GridCol(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridCol_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("GridCol_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_GridCol_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_List_0100
     * @tc.name      : TestBgResizable_AllComponents_List_0100
     * @tc.desc      : List backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_List_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_List_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_List_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_List(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("List_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("List_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_List_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_ListItem_0100
     * @tc.name      : TestBgResizable_AllComponents_ListItem_0100
     * @tc.desc      : ListItem backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_ListItem_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ListItem_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_ListItem_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_ListItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ListItem_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ListItem_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ListItem_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_ListItemGroup_0100
     * @tc.name      : TestBgResizable_AllComponents_ListItemGroup_0100
     * @tc.desc      : ListItemGroup backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_ListItemGroup_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ListItemGroup_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_ListItemGroup_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_ListItemGroup(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ListItemGroup_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ListItemGroup_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ListItemGroup_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Scroll_0100
     * @tc.name      : TestBgResizable_AllComponents_Scroll_0100
     * @tc.desc      : Scroll backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Scroll_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Scroll_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Scroll_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Scroll(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Scroll_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Scroll_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Scroll_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_ScrollBar_0100
     * @tc.name      : TestBgResizable_AllComponents_ScrollBar_0100
     * @tc.desc      : ScrollBar backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_ScrollBar_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ScrollBar_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_ScrollBar_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_ScrollBar(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ScrollBar_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("ScrollBar_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_ScrollBar_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Swiper_0100
     * @tc.name      : TestBgResizable_AllComponents_Swiper_0100
     * @tc.desc      : Swiper backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Swiper_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Swiper_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Swiper_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Swiper(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Swiper_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Swiper_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Swiper_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_TabContent_0100
     * @tc.name      : TestBgResizable_AllComponents_TabContent_0100
     * @tc.desc      : TabContent backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_TabContent_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TabContent_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_TabContent_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_TabContent(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TabContent_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("TabContent_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_TabContent_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Refresh_0100
     * @tc.name      : TestBgResizable_AllComponents_Refresh_0100
     * @tc.desc      : Refresh backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Refresh_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Refresh_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Refresh_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Refresh(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Refresh_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Refresh_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Refresh_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Sidebar_0100
     * @tc.name      : TestBgResizable_AllComponents_Sidebar_0100
     * @tc.desc      : Sidebar backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Sidebar_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Sidebar_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Sidebar_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Sidebar(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Sidebar_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Sidebar_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Sidebar_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Navigation_0100
     * @tc.name      : TestBgResizable_AllComponents_Navigation_0100
     * @tc.desc      : Navigation backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Navigation_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Navigation_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Navigation_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Navigation(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Navigation_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Navigation_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Navigation_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_RelativeContainer_0100
     * @tc.name      : TestBgResizable_AllComponents_RelativeContainer_0100
     * @tc.desc      : RelativeContainer backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_RelativeContainer_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RelativeContainer_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_RelativeContainer_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_RelativeContainer(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RelativeContainer_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RelativeContainer_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RelativeContainer_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Shape_0100
     * @tc.name      : TestBgResizable_AllComponents_Shape_0100
     * @tc.desc      : Shape backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Shape_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Shape_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Shape_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Shape(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Shape_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Shape_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Shape_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Ellipse_0100
     * @tc.name      : TestBgResizable_AllComponents_Ellipse_0100
     * @tc.desc      : Ellipse backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Ellipse_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Ellipse_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Ellipse_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Ellipse(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Ellipse_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Ellipse_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Ellipse_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Circle_0100
     * @tc.name      : TestBgResizable_AllComponents_Circle_0100
     * @tc.desc      : Circle backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Circle_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Circle_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Circle_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Circle(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Circle_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Circle_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Circle_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Path_0100
     * @tc.name      : TestBgResizable_AllComponents_Path_0100
     * @tc.desc      : Path backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Path_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Path_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Path_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Path(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Path_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Path_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Path_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Line_0100
     * @tc.name      : TestBgResizable_AllComponents_Line_0100
     * @tc.desc      : Line backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Line_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Line_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Line_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Line(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Line_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Line_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Line_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Canvas_0100
     * @tc.name      : TestBgResizable_AllComponents_Canvas_0100
     * @tc.desc      : Canvas backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Canvas_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Canvas_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Canvas_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Canvas(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Canvas_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Canvas_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Canvas_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_AlphabetIndexer_0100
     * @tc.name      : TestBgResizable_AllComponents_AlphabetIndexer_0100
     * @tc.desc      : AlphabetIndexer backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_AlphabetIndexer_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_AlphabetIndexer_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_AlphabetIndexer_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_AlphabetIndexer(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("AlphabetIndexer_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("AlphabetIndexer_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_AlphabetIndexer_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Menu_0100
     * @tc.name      : TestBgResizable_AllComponents_Menu_0100
     * @tc.desc      : Menu backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Menu_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Menu_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Menu_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Menu(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Menu_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Menu_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Menu_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_MenuItem_0100
     * @tc.name      : TestBgResizable_AllComponents_MenuItem_0100
     * @tc.desc      : MenuItem backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_MenuItem_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_MenuItem_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_MenuItem_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_MenuItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("MenuItem_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("MenuItem_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_MenuItem_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_MenuItemGroup_0100
     * @tc.name      : TestBgResizable_AllComponents_MenuItemGroup_0100
     * @tc.desc      : MenuItemGroup backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_MenuItemGroup_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_MenuItemGroup_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_MenuItemGroup_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_MenuItemGroup(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("MenuItemGroup_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("MenuItemGroup_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_MenuItemGroup_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_NavDestination_0100
     * @tc.name      : TestBgResizable_AllComponents_NavDestination_0100
     * @tc.desc      : NavDestination backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_NavDestination_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_NavDestination_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_NavDestination_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_NavDestination(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("NavDestination_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("NavDestination_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_NavDestination_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_RowSplit_0100
     * @tc.name      : TestBgResizable_AllComponents_RowSplit_0100
     * @tc.desc      : RowSplit backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_RowSplit_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RowSplit_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_RowSplit_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_RowSplit(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RowSplit_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("RowSplit_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_RowSplit_0100 ends.")
    }

    /*
     * @tc.number    : TestBgResizable_AllComponents_Tabs_0100
     * @tc.name      : TestBgResizable_AllComponents_Tabs_0100
     * @tc.desc      : Tabs backgroundImageResizable slice 10vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestBgResizable_AllComponents_Tabs_0100(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Tabs_0100 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "BgResizable_AllComponents_test"
            modtestCaseText[0] = "TestBgResizable_AllComponents_Tabs_0100"
            modtestView[0] = {_: CustomView => View_BgResizable_Tabs(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Tabs_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestBgResizable_AllComponents_Tabs_0100 ends.")
    }
}
