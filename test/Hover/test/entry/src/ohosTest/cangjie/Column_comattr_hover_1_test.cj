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
// Test class for Column_comattr_hover_1 scenarios
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Hover_AllComponents.*
import ohos_app_cangjie_entry.Column_comattr_hover_arkts.*
import ohos_app_cangjie_entry.Column_comattr_hover_1.*
import ohos.arkui.component.custom_component.CustomView
import ohos.arkui.component.*
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
class Column_comattr_hover_1_test {
    /*
     * @tc.number    : TestColumn_comattr_hover_None_0100
     * @tc.name      : TestCase_None
     * @tc.desc      : test hoverEffect None of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_None(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_None begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_None"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_None(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.None\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_None ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Scale_0100
     * @tc.name      : TestCase_Scale
     * @tc.desc      : test hoverEffect Scale of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Scale(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Scale begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_Scale"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_Scale(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Scale\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Scale ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Highlight_0100
     * @tc.name      : TestCase_Highlight
     * @tc.desc      : test hoverEffect Highlight of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Highlight(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Highlight begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_Highlight"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_Highlight(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Highlight\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Highlight ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Auto_0100
     * @tc.name      : TestCase_Auto
     * @tc.desc      : test hoverEffect Auto of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Auto(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Auto begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_Auto"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_Auto(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Auto\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Auto ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_NoneValue_0100
     * @tc.name      : TestCase_NoneValue
     * @tc.desc      : test hoverEffect Option None of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NoneValue(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoneValue begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_NoneValue"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_NoneValue(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Auto\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoneValue ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Boundary_min_0100
     * @tc.name      : TestCase_Boundary_min
     * @tc.desc      : test hoverEffect min boundary None(0) of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Boundary_min(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Boundary_min begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_Boundary_min"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_Boundary_min(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.None\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Boundary_min ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Boundary_max_0100
     * @tc.name      : TestCase_Boundary_max
     * @tc.desc      : test hoverEffect max boundary Auto(4) of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Boundary_max(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Boundary_max begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_Boundary_max"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_Boundary_max(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Auto\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Boundary_max ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Default_0100
     * @tc.name      : TestCase_Default
     * @tc.desc      : test hoverEffect default Auto(4) of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Default(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Default begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_Default"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_Default(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Auto\"")
        @Expect(HoverEffect.Auto == HoverEffect.Auto)
        @Expect(HoverEffect.Auto != HoverEffect.Scale)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Default ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Repeat_0100
     * @tc.name      : TestCase_Repeat
     * @tc.desc      : test hoverEffect repeat set last wins Highlight(3) of Column
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Repeat(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Repeat begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Column_comattr_hover_1_test"
            modtestCaseText[0] = "TestCase_Repeat"
            modtestView[0] = {_: CustomView => View_Column_comattr_hover_Repeat(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id")["hoverEffect"], "\"HoverEffect.Highlight\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Repeat ends.")
    }
    /*
     * @tc.number    : TestColumn_comattr_hover_Exception_0100
     * @tc.name      : TestCase_Exception
     * @tc.desc      : test hoverEffect unknown enum value throws BusinessException
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Exception(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Exception begins.")
        var caughtException = false
        try {
            TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
            launch{
                modtestSuiteText[0] = "Column_comattr_hover_1_test"
                modtestCaseText[0] = "TestCase_Exception"
                modtestView[0] = {_: CustomView => View_Column_comattr_hover_Exception(Option<CustomView>.None)}
            }
            TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
            TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        } catch (e: Exception) {
            caughtException = true
        }
        @Expect(caughtException, false)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Exception ends.")
    }
}
