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
// Test class for all components OnChildTouch_AllComponents coverage (part 4/5).
// Components: Flex Grid GridItem GridRow GridCol List ListItem ListItemGroup Scroll ScrollBar Swiper TabContent
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
class OnChildTouch_AllComponents_4_test {
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Flex_0100
     * @tc.name      : TestCase_Flex
     * @tc.desc      : test Flex onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_Flex"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Flex(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Flex_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Flex_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Flex_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Flex ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Grid_0100
     * @tc.name      : TestCase_Grid
     * @tc.desc      : test Grid onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_Grid"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Grid(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Grid_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Grid_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Grid_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Grid ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_GridItem_0100
     * @tc.name      : TestCase_GridItem
     * @tc.desc      : test GridItem onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_GridItem"
            modtestView[0] = {_: CustomView => View_OnChildTouch_GridItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridItem_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("GridItem_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("GridItem_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridItem ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_GridRow_0100
     * @tc.name      : TestCase_GridRow
     * @tc.desc      : test GridRow onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_GridRow"
            modtestView[0] = {_: CustomView => View_OnChildTouch_GridRow(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridRow_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("GridRow_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("GridRow_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridRow ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_GridCol_0100
     * @tc.name      : TestCase_GridCol
     * @tc.desc      : test GridCol onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_GridCol"
            modtestView[0] = {_: CustomView => View_OnChildTouch_GridCol(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("GridCol_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("GridCol_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("GridCol_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_GridCol ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_List_0100
     * @tc.name      : TestCase_List
     * @tc.desc      : test List onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_List"
            modtestView[0] = {_: CustomView => View_OnChildTouch_List(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("List_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("List_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("List_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_List ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_ListItem_0100
     * @tc.name      : TestCase_ListItem
     * @tc.desc      : test ListItem onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_ListItem"
            modtestView[0] = {_: CustomView => View_OnChildTouch_ListItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ListItem_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("ListItem_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("ListItem_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ListItem ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_ListItemGroup_0100
     * @tc.name      : TestCase_ListItemGroup
     * @tc.desc      : test ListItemGroup onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_ListItemGroup"
            modtestView[0] = {_: CustomView => View_OnChildTouch_ListItemGroup(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ListItemGroup_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("ListItemGroup_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("ListItemGroup_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ListItemGroup ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Scroll_0100
     * @tc.name      : TestCase_Scroll
     * @tc.desc      : test Scroll onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_Scroll"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Scroll(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Scroll_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Scroll_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Scroll_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Scroll ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_ScrollBar_0100
     * @tc.name      : TestCase_ScrollBar
     * @tc.desc      : test ScrollBar onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_ScrollBar"
            modtestView[0] = {_: CustomView => View_OnChildTouch_ScrollBar(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ScrollBar_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("ScrollBar_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("ScrollBar_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ScrollBar ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Swiper_0100
     * @tc.name      : TestCase_Swiper
     * @tc.desc      : test Swiper onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_Swiper"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Swiper(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Swiper_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Swiper_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Swiper_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Swiper ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_TabContent_0100
     * @tc.name      : TestCase_TabContent
     * @tc.desc      : test TabContent onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
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
            modtestSuiteText[0] = "OnChildTouch_AllComponents_4_test"
            modtestCaseText[0] = "TestCase_TabContent"
            modtestView[0] = {_: CustomView => View_OnChildTouch_TabContent(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TabContent_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("TabContent_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("TabContent_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TabContent ends.")
    }
}
