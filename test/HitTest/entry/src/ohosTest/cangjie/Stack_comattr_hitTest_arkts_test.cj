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
// Test class for ArkTS-aligned Stack_comattr_hitTest_arkts scenarios
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
class Stack_comattr_hitTest_arkts_test {
    private func clickAndWait(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stack_comattr_id"), 3000)
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_arkts_0100
     * @tc.name      : TestCase_arkts_example1
     * @tc.desc      : test hitTestBehavior Block aligned to ArkTS example1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example1(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_arkts_test"
            modtestCaseText[0] = "TestCase_arkts_example1"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_arkts_example1(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Block\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_arkts_0200
     * @tc.name      : TestCase_arkts_example1b
     * @tc.desc      : test hitTestBehavior Transparent over Button penetration aligned to ArkTS example1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example1b(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_arkts_test"
            modtestCaseText[0] = "TestCase_arkts_example1b"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_arkts_example1b(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Transparent\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_arkts_0300
     * @tc.name      : TestCase_arkts_example2
     * @tc.desc      : test hitTestBehavior BlockHierarchy aligned to ArkTS example2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example2(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_arkts_test"
            modtestCaseText[0] = "TestCase_arkts_example2"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_arkts_example2(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_arkts_0400
     * @tc.name      : TestCase_arkts_example3
     * @tc.desc      : test hitTestBehavior BlockDescendants aligned to ArkTS example3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example3(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_arkts_test"
            modtestCaseText[0] = "TestCase_arkts_example3"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_arkts_example3(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.Default\"")
    }

    /*
     * @tc.number    : TestStack_comattr_hitTest_arkts_0500
     * @tc.name      : TestCase_arkts_example4
     * @tc.desc      : test hitTestBehavior None toggle aligned to ArkTS example4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example4(): Unit {
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "Stack_comattr_hitTest_arkts_test"
            modtestCaseText[0] = "TestCase_arkts_example4"
            modtestView[0] = {_: CustomView => View_Stack_comattr_hitTest_arkts_example4(Option<CustomView>.None) }
        }
        clickAndWait()
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id")["hitTestBehavior"], "\"HitTestMode.None\"")
    }
}
