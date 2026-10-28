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
// Test class for all components OnChildTouch_AllComponents coverage (part 2/5).
// Components: Gauge DataPanel QRCode TextInput TextArea TextField RichEditor PatternLock Checkbox CheckboxGroup Radio DatePicker TextPicker
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
class OnChildTouch_AllComponents_2_test {
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Gauge_0100
     * @tc.name      : TestCase_Gauge
     * @tc.desc      : test Gauge onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Gauge(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Gauge begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_Gauge"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Gauge(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Gauge_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Gauge_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Gauge_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Gauge ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_DataPanel_0100
     * @tc.name      : TestCase_DataPanel
     * @tc.desc      : test DataPanel onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DataPanel(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DataPanel begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_DataPanel"
            modtestView[0] = {_: CustomView => View_OnChildTouch_DataPanel(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("DataPanel_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("DataPanel_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("DataPanel_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DataPanel ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_QRCode_0100
     * @tc.name      : TestCase_QRCode
     * @tc.desc      : test QRCode onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_QRCode(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_QRCode begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_QRCode"
            modtestView[0] = {_: CustomView => View_OnChildTouch_QRCode(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("QRCode_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("QRCode_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("QRCode_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_QRCode ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_TextInput_0100
     * @tc.name      : TestCase_TextInput
     * @tc.desc      : test TextInput onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextInput(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextInput begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_TextInput"
            modtestView[0] = {_: CustomView => View_OnChildTouch_TextInput(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextInput_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("TextInput_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("TextInput_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextInput ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_TextArea_0100
     * @tc.name      : TestCase_TextArea
     * @tc.desc      : test TextArea onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextArea(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextArea begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_TextArea"
            modtestView[0] = {_: CustomView => View_OnChildTouch_TextArea(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextArea_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("TextArea_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("TextArea_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextArea ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_TextField_0100
     * @tc.name      : TestCase_TextField
     * @tc.desc      : test TextField onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextField(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextField begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_TextField"
            modtestView[0] = {_: CustomView => View_OnChildTouch_TextField(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextField_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("TextField_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("TextField_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextField ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_RichEditor_0100
     * @tc.name      : TestCase_RichEditor
     * @tc.desc      : test RichEditor onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_RichEditor(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichEditor begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_RichEditor"
            modtestView[0] = {_: CustomView => View_OnChildTouch_RichEditor(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("RichEditor_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("RichEditor_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("RichEditor_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_RichEditor ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_PatternLock_0100
     * @tc.name      : TestCase_PatternLock
     * @tc.desc      : test PatternLock onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_PatternLock(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_PatternLock begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_PatternLock"
            modtestView[0] = {_: CustomView => View_OnChildTouch_PatternLock(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("PatternLock_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("PatternLock_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("PatternLock_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_PatternLock ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Checkbox_0100
     * @tc.name      : TestCase_Checkbox
     * @tc.desc      : test Checkbox onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Checkbox(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Checkbox begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_Checkbox"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Checkbox(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Checkbox_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Checkbox_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Checkbox_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Checkbox ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_CheckboxGroup_0100
     * @tc.name      : TestCase_CheckboxGroup
     * @tc.desc      : test CheckboxGroup onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_CheckboxGroup(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_CheckboxGroup begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_CheckboxGroup"
            modtestView[0] = {_: CustomView => View_OnChildTouch_CheckboxGroup(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("CheckboxGroup_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("CheckboxGroup_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("CheckboxGroup_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_CheckboxGroup ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_Radio_0100
     * @tc.name      : TestCase_Radio
     * @tc.desc      : test Radio onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Radio(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Radio begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_Radio"
            modtestView[0] = {_: CustomView => View_OnChildTouch_Radio(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Radio_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Radio_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("Radio_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Radio ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_DatePicker_0100
     * @tc.name      : TestCase_DatePicker
     * @tc.desc      : test DatePicker onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DatePicker(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DatePicker begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_DatePicker"
            modtestView[0] = {_: CustomView => View_OnChildTouch_DatePicker(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("DatePicker_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("DatePicker_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("DatePicker_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DatePicker ends.")
    }
    /*
     * @tc.number    : TestOnChildTouch_AllComponents_TextPicker_0100
     * @tc.name      : TestCase_TextPicker
     * @tc.desc      : test TextPicker onChildTouchTest callback returns TouchResult(strategy: Default), callback is registered and invoked on touch
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TextPicker(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextPicker begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
        launch{
            modtestSuiteText[0] = "OnChildTouch_AllComponents_2_test"
            modtestCaseText[0] = "TestCase_TextPicker"
            modtestView[0] = {_: CustomView => View_OnChildTouch_TextPicker(Option<CustomView>.None) }
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("TextPicker_comattr_id"), 3000)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("TextPicker_comattr_id").isSome(), true)
        OnChildTouchCount.reset()
        TestDriver.driver.findComponent(On().id("TextPicker_comattr_id")).getOrThrow().click()
        waitFor(2.second, { => OnChildTouchCount.count == 1 })
        @Expect(OnChildTouchCount.count, 1)
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TextPicker ends.")
    }
}
