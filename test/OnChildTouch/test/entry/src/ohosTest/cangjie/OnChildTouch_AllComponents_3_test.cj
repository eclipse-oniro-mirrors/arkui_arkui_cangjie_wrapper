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
// Test class for all components OnChildTouch_AllComponents coverage (part 3/5).
// Components: Stepper StepperItem Counter TextClock TextTimer Video Web Span ImageSpan RichText Column Row Stack
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
class OnChildTouch_AllComponents_3_test {
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Stepper_0100
     * @tc.name      : TestCase_Stepper
     * @tc.desc      : test Stepper onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Stepper(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stepper begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Stepper"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Stepper(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stepper_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Stepper_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Stepper_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stepper ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_StepperItem_0100
     * @tc.name      : TestCase_StepperItem
     * @tc.desc      : test StepperItem onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_StepperItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_StepperItem begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_StepperItem"
            modtestView[0] = {_: CustomView => View_OnChildTouch_StepperItem(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("StepperItem_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("StepperItem_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("StepperItem_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_StepperItem ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Counter_0100
     * @tc.name      : TestCase_Counter
     * @tc.desc      : test Counter onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Counter(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Counter begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Counter"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Counter(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Counter_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Counter_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Counter_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Counter ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_TextClock_0100
     * @tc.name      : TestCase_TextClock
     * @tc.desc      : test TextClock onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextClock(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextClock begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_TextClock"
            modtestView[0] = {_: CustomView => View_OnChildTouch_TextClock(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextClock_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("TextClock_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("TextClock_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextClock ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_TextTimer_0100
     * @tc.name      : TestCase_TextTimer
     * @tc.desc      : test TextTimer onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextTimer(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextTimer begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_TextTimer"
            modtestView[0] = {_: CustomView => View_OnChildTouch_TextTimer(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextTimer_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("TextTimer_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("TextTimer_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextTimer ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Video_0100
     * @tc.name      : TestCase_Video
     * @tc.desc      : test Video onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Video(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Video begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Video"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Video(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Video_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Video_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Video_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Video ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Web_0100
     * @tc.name      : TestCase_Web
     * @tc.desc      : test Web onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Web(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Web begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Web"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Web(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Web_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Web_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Web_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Web ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Span_0100
     * @tc.name      : TestCase_Span
     * @tc.desc      : test Span onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Span(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Span begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Span"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Span(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Span_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Span_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Span_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Span ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_ImageSpan_0100
     * @tc.name      : TestCase_ImageSpan
     * @tc.desc      : test ImageSpan onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ImageSpan(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ImageSpan begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_ImageSpan"
            modtestView[0] = {_: CustomView => View_OnChildTouch_ImageSpan(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("ImageSpan_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("ImageSpan_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("ImageSpan_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ImageSpan ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_RichText_0100
     * @tc.name      : TestCase_RichText
     * @tc.desc      : test RichText onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RichText(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichText begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_RichText"
            modtestView[0] = {_: CustomView => View_OnChildTouch_RichText(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RichText_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("RichText_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("RichText_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichText ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Column_0100
     * @tc.name      : TestCase_Column
     * @tc.desc      : test Column onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Column(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Column begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Column"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Column(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Column_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Column ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Row_0100
     * @tc.name      : TestCase_Row
     * @tc.desc      : test Row onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Row(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Row begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Row"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Row(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Row_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Row_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Row_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Row ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Stack_0100
     * @tc.name      : TestCase_Stack
     * @tc.desc      : test Stack onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Stack(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stack begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_3_test"
            modtestCaseText[0] = "TestCase_Stack"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Stack(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Stack_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Stack_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Stack_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Stack ends.")
    }
}
