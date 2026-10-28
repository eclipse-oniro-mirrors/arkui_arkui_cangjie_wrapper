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
// Test class for ArkTS-aligned Column_comattr_hover_arkts scenarios
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
class Column_comattr_hover_arkts_test {
    /*
     * @tc.number    : TestColumn_comattr_hover_arkts_0100
     * @tc.name      : TestCase_arkts_example
     * @tc.desc      : test hoverEffect aligned to ArkTS example Scale+Highlight+None
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
            modtestSuiteText[0] = "Column_comattr_hover_arkts_test"
            modtestCaseText[0] = "TestCase_arkts_example"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_arkts_example(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_Scale_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_Scale_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        TestDriver.driver.waitForComponent(On().id("Column_comattr_Highlight_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_Highlight_id")["hoverEffect"], "\"HoverEffect.Highlight\"")
        TestDriver.driver.waitForComponent(On().id("Column_comattr_None_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_None_id")["hoverEffect"], "\"HoverEffect.None\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example ends.")
    }
}
