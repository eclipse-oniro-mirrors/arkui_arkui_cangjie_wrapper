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
// Test class for all components OnChildTouch_AllComponents coverage (part 5/5).
// Components: Refresh Sidebar Navigation RelativeContainer Shape Ellipse Circle Path Path2D Line Rect Canvas
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
class OnChildTouch_AllComponents_5_test {
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Refresh_0100
     * @tc.name      : TestCase_Refresh
     * @tc.desc      : test Refresh onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Refresh(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Refresh begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Refresh"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Refresh(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Refresh_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Refresh_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Refresh_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Refresh ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Sidebar_0100
     * @tc.name      : TestCase_Sidebar
     * @tc.desc      : test Sidebar onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Sidebar(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Sidebar begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Sidebar"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Sidebar(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Sidebar_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Sidebar_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Sidebar_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Sidebar ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Navigation_0100
     * @tc.name      : TestCase_Navigation
     * @tc.desc      : test Navigation onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Navigation(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Navigation begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Navigation"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Navigation(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Navigation_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Navigation_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Navigation_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Navigation ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_RelativeContainer_0100
     * @tc.name      : TestCase_RelativeContainer
     * @tc.desc      : test RelativeContainer onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RelativeContainer(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RelativeContainer begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_RelativeContainer"
            modtestView[0] = {_: CustomView => View_OnChildTouch_RelativeContainer(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RelativeContainer_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("RelativeContainer_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("RelativeContainer_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RelativeContainer ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Shape_0100
     * @tc.name      : TestCase_Shape
     * @tc.desc      : test Shape onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Shape(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Shape begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Shape"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Shape(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Shape_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Shape_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Shape_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Shape ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Ellipse_0100
     * @tc.name      : TestCase_Ellipse
     * @tc.desc      : test Ellipse onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Ellipse(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Ellipse begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Ellipse"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Ellipse(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Ellipse_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Ellipse_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Ellipse_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Ellipse ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Circle_0100
     * @tc.name      : TestCase_Circle
     * @tc.desc      : test Circle onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Circle(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Circle begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Circle"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Circle(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Circle_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Circle_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Circle_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Circle ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Path_0100
     * @tc.name      : TestCase_Path
     * @tc.desc      : test Path onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Path(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Path"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Path(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Path_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Path_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Path_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Path2D_0100
     * @tc.name      : TestCase_Path2D
     * @tc.desc      : test Path2D onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Path2D(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path2D begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Path2D"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Path2D(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Path2D_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Path2D_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Path2D_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Path2D ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Line_0100
     * @tc.name      : TestCase_Line
     * @tc.desc      : test Line onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Line(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Line begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Line"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Line(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Line_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Line_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Line_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Line ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Rect_0100
     * @tc.name      : TestCase_Rect
     * @tc.desc      : test Rect onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Rect(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Rect begins.")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Rect ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Canvas_0100
     * @tc.name      : TestCase_Canvas
     * @tc.desc      : test Canvas onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Canvas(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Canvas begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_5_test"
            modtestCaseText[0] = "TestCase_Canvas"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Canvas(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Canvas_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Canvas_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Canvas_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Canvas ends.")
    }
}
