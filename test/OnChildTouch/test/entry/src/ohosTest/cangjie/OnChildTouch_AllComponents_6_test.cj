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
// Test class for all components OnChildTouch_AllComponents coverage (part 6/6).
// Components: AlphabetIndexer Menu MenuItem MenuItemGroup NavDestination RowSplit Tabs
// CustomComponent/CustomView are exempted (DT-295/DT-296): custom-component infrastructure,
// not independently instantiable, consistent with HitTest AllComponents coverage scope.
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.OnChildTouch_AllComponents.*
import ohos_app_cangjie_entry.Column_comattr_onChildTouch_arkts.*
import ohos_app_cangjie_entry.Column_comattr_onChildTouch_1.*
import ohos.arkui.component.custom_component.CustomView
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText
import kit.PerformanceAnalysisKit.Hilog
import std.collection.*
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*

import ohos.base.*
import ohos.ui_test.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.Hilog
import ohos_app_cangjie_entry.*

@Test
class OnChildTouch_AllComponents_6_test {
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_AlphabetIndexer_0100
     * @tc.name      : TestCase_AlphabetIndexer
     * @tc.desc      : test AlphabetIndexer onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_6_test"
            modtestCaseText[0] = "TestCase_AlphabetIndexer"
            modtestView[0] = {_: CustomView => View_OnChildTouch_AlphabetIndexer(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("AlphabetIndexer_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("AlphabetIndexer_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("AlphabetIndexer_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_AlphabetIndexer ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Menu_0100
     * @tc.name      : TestCase_Menu
     * @tc.desc      : test Menu onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_6_test"
            modtestCaseText[0] = "TestCase_Menu"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Menu(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Menu_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Menu_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Menu_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Menu ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_MenuItem_0100
     * @tc.name      : TestCase_MenuItem
     * @tc.desc      : test MenuItem onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_6_test"
            modtestCaseText[0] = "TestCase_MenuItem"
            modtestView[0] = {_: CustomView => View_OnChildTouch_MenuItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("MenuItem_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MenuItem_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("MenuItem_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MenuItem ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_MenuItemGroup_0100
     * @tc.name      : TestCase_MenuItemGroup
     * @tc.desc      : test MenuItemGroup onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_6_test"
            modtestCaseText[0] = "TestCase_MenuItemGroup"
            modtestView[0] = {_: CustomView => View_OnChildTouch_MenuItemGroup(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("MenuItemGroup_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MenuItemGroup_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("MenuItemGroup_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_MenuItemGroup ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_NavDestination_0100
     * @tc.name      : TestCase_NavDestination
     * @tc.desc      : test NavDestination onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_6_test"
            modtestCaseText[0] = "TestCase_NavDestination"
            modtestView[0] = {_: CustomView => View_OnChildTouch_NavDestination(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("NavDestination_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("NavDestination_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("NavDestination_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NavDestination ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_RowSplit_0100
     * @tc.name      : TestCase_RowSplit
     * @tc.desc      : test RowSplit onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_6_test"
            modtestCaseText[0] = "TestCase_RowSplit"
            modtestView[0] = {_: CustomView => View_OnChildTouch_RowSplit(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RowSplit_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("RowSplit_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("RowSplit_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RowSplit ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Tabs_0100
     * @tc.name      : TestCase_Tabs
     * @tc.desc      : test Tabs onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_6_test"
            modtestCaseText[0] = "TestCase_Tabs"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Tabs(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Tabs_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Tabs_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Tabs ends.")
    }
}
