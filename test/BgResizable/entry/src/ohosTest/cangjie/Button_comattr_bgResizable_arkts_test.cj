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
// Test class for ArkTS-aligned Button_comattr_bgResizable_arkts scenarios
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
class Button_comattr_bgResizable_arkts_test {
    /*
     * @tc.number    : TestButton_comattr_bgResizable_arkts_001
     * @tc.name      : TestCase_arkts_example
     * @tc.desc      : ArkTS arkts_example aligned: Button backgroundImageResizable slice_4dir_10vp, inspector contains 10.00vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Button_comattr_bgResizable_arkts_test"
            modtestCaseText[0] = "TestCase_arkts_example"
            modtestView[0] = {_: CustomView => View_Button_comattr_bgResizable_arkts_example(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Button_comattr_id"), 3000)
        let propValue = Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Button_comattr_id")["backgroundImageResizable"]
        @Expect(propValue.contains("10.00vp"))
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example ends.")
    }
}
