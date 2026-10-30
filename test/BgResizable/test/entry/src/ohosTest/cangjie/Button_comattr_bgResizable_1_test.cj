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
// Test class for Button_comattr_bgResizable_1 scenarios
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
class Button_comattr_bgResizable_1_test {
    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_001
     * @tc.name      : TestCase_1
     * @tc.desc      : slice_4dir_10vp effective, inspector contains 10.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_1 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_1"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_slice_4dir_10vp(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_002
     * @tc.name      : TestCase_2
     * @tc.desc      : slice_4dir_5vp effective, inspector contains 5.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_2 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_2"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_slice_4dir_5vp(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 5.00vp, right: 5.00vp, top: 5.00vp, bottom: 5.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_003
     * @tc.name      : TestCase_3
     * @tc.desc      : Option.None not effective, inspector does not contain 10.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_3 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_3"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_None(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(!propValue.contains("10.00vp"))
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_004
     * @tc.name      : TestCase_4
     * @tc.desc      : slice_all_zero not effective, inspector does not contain 10.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_4 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_4"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_slice_all_zero(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 0.00vp, right: 0.00vp, top: 0.00vp, bottom: 0.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_005
     * @tc.name      : TestCase_5
     * @tc.desc      : bottom_right_not_both_gt0 not effective, inspector does not contain 1.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_5 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_5"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_bottom_right_not_both_gt0(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 0.00vp, right: 0.00vp, top: 1.00vp, bottom: 1.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_5 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_006
     * @tc.name      : TestCase_6
     * @tc.desc      : top_bottom_gt_height not effective, inspector does not contain 1000.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_6 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_6"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_top_bottom_gt_height(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 1000.00vp, bottom: 1000.00vp}\"")
        
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_6 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_007
     * @tc.name      : TestCase_7
     * @tc.desc      : default: no backgroundImageResizable call, inspector does not contain 10.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_7 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_7"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_Default(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(!propValue.contains("10.00vp"))
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_7 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_1_008
     * @tc.name      : TestCase_8
     * @tc.desc      : repeat: first 5/10/5/10 then 10/10/10/10, final 10.00vp effective, 5.00vp not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_8 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_1_test"
            modtestCaseText[0] = "TestCase_8"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_Repeat(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue, "\"ImageResizableSlice: {left: 10.00vp, right: 10.00vp, top: 10.00vp, bottom: 10.00vp}\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_8 ends.")
    }
}
