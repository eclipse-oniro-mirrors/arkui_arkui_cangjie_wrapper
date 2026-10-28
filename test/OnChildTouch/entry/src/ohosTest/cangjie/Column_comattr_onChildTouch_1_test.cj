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
// Test class for Column_comattr_onChildTouch_1 scenarios.
// Dispatch strategy is verified end-to-end via @State variables shown in the view
// (callbackStatusText: cb=<gesture count>;seen=<MyList in callback input>,
//  dispatchStatusText: scroll=<List scrolled>;click=<Button onClick count>)
// read back through inspector "content".
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

// Shared helpers for onChildTouchTest strategy cases (also used by Column_comattr_onChildTouch_arkts_test.cj)

func enterOnChildTouchView(view: (CustomView) -> CustomView, suiteName: String, caseName: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
    launch {
        modtestSuiteText[0] = suiteName
        modtestCaseText[0] = caseName
        modtestView[0] = view
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Column_comattr_id"), 3000)
}

// Single read attempt tolerant to transient windows: returns None when the component is
// momentarily unfindable/unreadable during a @State re-render, instead of throwing, so
// that callers can keep polling on the test thread.
func tryReadStatusText(id: String): Option<String> {
    try {
        match (Screen.findTheOnlyUiComponentWhoseIdEqualsTo(id)) {
            case Some(component) => Option<String>.Some(component["content"])
            case None => Option<String>.None
        }
    } catch (_: Exception) {
        Option<String>.None
    }
}

// Waits until the status Text is readable, then returns its content.
// IMPORTANT: polling must stay on the test thread. The ui_test Driver API rejects
// concurrent calls ("uitest-api does not allow calling concurrently"): utility waitFor
// polls on a Timer thread, and after cancel an in-flight poll RPC overlaps the next
// main-thread Driver call (findComponent/drag/click), failing cases intermittently.
func readStatusText(id: String): String {
    var value = tryReadStatusText(id)
    var waited = 0
    while (value.isNone() && waited < 1000) {
        sleepFor(50.milliSecond)
        waited = waited + 50
        value = tryReadStatusText(id)
    }
    value.getOrThrow()
}

// Positive assertion: polls on the test thread (50ms interval, ~3 render frames) until
// the status Text matches; 2s budget; transient not-found/not-readable windows keep
// polling; a genuine mismatch or missing component surfaces as a timeout exception.
func waitStatusText(id: String, expected: String): Unit {
    var matched = false
    var waited = 0
    while (!matched && waited < 2000) {
        let value = tryReadStatusText(id)
        if (value.isSome()) {
            matched = value.getOrThrow() == expected
        }
        if (!matched) {
            sleepFor(50.milliSecond)
            waited = waited + 50
        }
    }
    if (!matched) {
        throw Exception("waitStatusText timeout: id=${id} expected=${expected}")
    }
}

// Drag upward inside the blank area below MyList (between List bottom and Button top margin gap).
// speed 2000 keeps the 600px gesture at ~300ms; the dispatch decision is made at touch-down,
// so gesture speed does not affect the strategy under test.
func dragBlankAreaBelowMyList(): Unit {
    let listRect = TestDriver.driver.findComponent(On().id("MyList")).getOrThrow().getBounds()
    let buttonRect = TestDriver.driver.findComponent(On().id("MyButton")).getOrThrow().getBounds()
    let gapY = (listRect.bottom + buttonRect.top) / 2
    let centerX = (listRect.left + listRect.right) / 2
    TestDriver.driver.drag(centerX, gapY, centerX, gapY - 600, speed: 2000)
}

func clickMyButton(): Unit {
    TestDriver.driver.findComponent(On().id("MyButton")).getOrThrow().click()
}

// Grace window before a negative assertion (state should NOT change): covers the touch-up
// event and one re-render frame that may land after the synchronous gesture call returns.
func graceForNegativeAssert(): Unit {
    sleepFor(300.milliSecond)
}

@Test
class Column_comattr_onChildTouch_1_test {
    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0100
     * @tc.name      : TestCase_Default
     * @tc.desc      : onChildTouchTest returns TouchResult(Default): callback invoked with MyList info, blank-area drag does not scroll List, Button responds onClick
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Default(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Default begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_Default(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_Default")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        clickMyButton()
        waitStatusText("dispatchStatusText", "\"scroll=false;click=1\"")
        @Expect(readStatusText("callbackStatusText"), "\"cb=2;seen=true\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Default ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0200
     * @tc.name      : TestCase_ForwardCompetition
     * @tc.desc      : onChildTouchTest returns TouchResult(ForwardCompetition, id: MyList): callback invoked, blank-area drag scrolls List, Button responds onClick
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ForwardCompetition(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ForwardCompetition begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_ForwardCompetition(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_ForwardCompetition")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        waitStatusText("dispatchStatusText", "\"scroll=true;click=0\"")
        clickMyButton()
        waitStatusText("dispatchStatusText", "\"scroll=true;click=1\"")
        @Expect(readStatusText("callbackStatusText"), "\"cb=2;seen=true\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ForwardCompetition ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0300
     * @tc.name      : TestCase_Forward
     * @tc.desc      : onChildTouchTest returns TouchResult(Forward, id: MyList): callback invoked, blank-area drag scrolls List, Button onClick blocked
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Forward(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Forward begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_Forward(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_Forward")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        waitStatusText("dispatchStatusText", "\"scroll=true;click=0\"")
        clickMyButton()
        waitStatusText("callbackStatusText", "\"cb=2;seen=true\"")
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=true;click=0\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Forward ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0400
     * @tc.name      : TestCase_None
     * @tc.desc      : onChildTouchTest(Option.None) wraps a Default-returning callback: no user callback executes, dispatch equals system default (blank-area drag no scroll, Button responds), no exception
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_None(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_None begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_None(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_None")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        clickMyButton()
        waitStatusText("dispatchStatusText", "\"scroll=false;click=1\"")
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_None ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0500
     * @tc.name      : TestCase_NoId_Forward
     * @tc.desc      : onChildTouchTest returns TouchResult(Forward) without id: callback invoked with MyList info, empty id degrades to Default (blank-area drag no scroll, Button responds)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NoId_Forward(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoId_Forward begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_NoId_Forward(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_NoId_Forward")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        clickMyButton()
        waitStatusText("dispatchStatusText", "\"scroll=false;click=1\"")
        @Expect(readStatusText("callbackStatusText"), "\"cb=2;seen=true\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoId_Forward ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0600
     * @tc.name      : TestCase_NoId_ForwardCompetition
     * @tc.desc      : onChildTouchTest returns TouchResult(ForwardCompetition) without id: callback invoked, empty id degrades to Default (blank-area drag no scroll, Button responds)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NoId_ForwardCompetition(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoId_ForwardCompetition begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_NoId_ForwardCompetition(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_NoId_ForwardCompetition")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        clickMyButton()
        waitStatusText("dispatchStatusText", "\"scroll=false;click=1\"")
        @Expect(readStatusText("callbackStatusText"), "\"cb=2;seen=true\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoId_ForwardCompetition ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0700
     * @tc.name      : TestCase_NoCallback
     * @tc.desc      : no onChildTouchTest call: callback not registered (counter stays 0), system default dispatch (blank-area drag no scroll, Button responds)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NoCallback(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoCallback begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_NoCallback(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_NoCallback")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MyList").isSome(), true)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MyButton").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        clickMyButton()
        waitStatusText("dispatchStatusText", "\"scroll=false;click=1\"")
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NoCallback ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_1_0800
     * @tc.name      : TestCase_Repeat
     * @tc.desc      : register Default then register Forward(id: MyList): only the final registration takes effect, dispatch follows Forward (blank-area drag scrolls List, Button onClick blocked)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Repeat(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Repeat begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_Repeat(Option<CustomView>.None) }, "Column_comattr_onChildTouch_1_test", "TestCase_Repeat")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        waitStatusText("dispatchStatusText", "\"scroll=true;click=0\"")
        clickMyButton()
        waitStatusText("callbackStatusText", "\"cb=2;seen=true\"")
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=true;click=0\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Repeat ends.")
    }
}
