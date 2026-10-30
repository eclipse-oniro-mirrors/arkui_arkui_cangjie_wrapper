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
// Test class for Stack_comattr_hitTest_1 scenarios
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Stack_comattr_hitTest_arkts.*
import ohos_app_cangjie_entry.Stack_comattr_hitTest_1.*
import ohos_app_cangjie_entry.HitTest_AllComponents.*
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
class Stack_comattr_hitTest_1_test {
    private func clickAndWait(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stack_comattr_id"), 3000)
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0100
     * @tc.name      : TestCase_Default
     * @tc.desc      : test hitTestBehavior Default valid equivalence
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Default(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_Default"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_Default(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
        @Expect(HitTestMode.Default == HitTestMode.Default)
        @Expect(HitTestMode.Default != HitTestMode.Block)
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0200
     * @tc.name      : TestCase_Block
     * @tc.desc      : test hitTestBehavior Block valid equivalence
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Block(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_Block"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_Block(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0300
     * @tc.name      : TestCase_Transparent
     * @tc.desc      : test hitTestBehavior Transparent valid equivalence
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Transparent(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_Transparent"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_Transparent(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Transparent\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0400
     * @tc.name      : TestCase_None
     * @tc.desc      : test hitTestBehavior None valid equivalence
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_None(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_None"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_None(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.None\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0500
     * @tc.name      : TestCase_BlockHierarchy
     * @tc.desc      : test hitTestBehavior BlockHierarchy valid equivalence
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_BlockHierarchy(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_BlockHierarchy"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_BlockHierarchy(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0600
     * @tc.name      : TestCase_BlockDescendants
     * @tc.desc      : test hitTestBehavior BlockDescendants valid equivalence
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_BlockDescendants(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_BlockDescendants"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_BlockDescendants(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0700
     * @tc.name      : TestCase_NoneValue
     * @tc.desc      : test hitTestBehavior Option None invalid equivalence
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NoneValue(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_NoneValue"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_NoneValue(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0800
     * @tc.name      : TestCase_Boundary_min
     * @tc.desc      : test hitTestBehavior min boundary value Default
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Boundary_min(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_Boundary_min"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_Boundary_min(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_0900
     * @tc.name      : TestCase_Boundary_max
     * @tc.desc      : test hitTestBehavior max boundary value BlockDescendants
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Boundary_max(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_Boundary_max"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_Boundary_max(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_1000
     * @tc.name      : TestCase_DefaultNoCall
     * @tc.desc      : test hitTestBehavior default value without call
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DefaultNoCall(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_DefaultNoCall"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_DefaultNoCall(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_1100
     * @tc.name      : TestCase_Repeat
     * @tc.desc      : test hitTestBehavior repeat set last wins
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Repeat(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_Repeat"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_Repeat(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Transparent\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_1200
     * @tc.name      : TestCase_Exception
     * @tc.desc      : test hitTestBehavior exception placeholder for unknown enum
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Exception(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_1_test"
            modtestCaseText[0] = "TestCase_Exception"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_Exception(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }
}
