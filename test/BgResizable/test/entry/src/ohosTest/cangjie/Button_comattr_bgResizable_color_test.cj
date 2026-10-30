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
// Test class for Button_comattr_bgResizable_color scenarios
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Button_comattr_bgResizable_color.*
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
class Button_comattr_bgResizable_color_test {
    /*
     * @tc.number    : TestButton_comattr_bgResizable_color_001
     * @tc.name      : TestCase_1
     * @tc.desc      : backgroundColor(Color.Grey) effective, inspector value is #FF808080
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
            modtestSuiteText[0] = "Button_comattr_bgResizable_color_test"
            modtestCaseText[0] = "TestCase_1"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_color_Grey(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundColor"], "\"#FF808080\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_color_002
     * @tc.name      : TestCase_2
     * @tc.desc      : backgroundColor(Color.Orange) effective, inspector value is #FFFFA500
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
            modtestSuiteText[0] = "Button_comattr_bgResizable_color_test"
            modtestCaseText[0] = "TestCase_2"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_color_Orange(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundColor"], "\"#FFFFA500\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestButton_comattr_bgResizable_color_003
     * @tc.name      : TestCase_3
     * @tc.desc      : backgroundColor(Color.Yellow) effective, inspector value is #FFFFFF00
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
            modtestSuiteText[0] = "Button_comattr_bgResizable_color_test"
            modtestCaseText[0] = "TestCase_3"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_color_Yellow(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundColor"], "\"#FFFFFF00\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_3 ends.")
    }
}
