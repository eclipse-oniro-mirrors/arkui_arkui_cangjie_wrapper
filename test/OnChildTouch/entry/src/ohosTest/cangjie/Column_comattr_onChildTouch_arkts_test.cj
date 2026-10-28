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
// Test class for ArkTS-aligned Column_comattr_onChildTouch_arkts scenarios.
// Views mirror ts-universal-attributes-on-child-touch-test.md examples 1/2/3
// (13 ListItems + edgeEffect(Spring) + onScrollIndex + Button margin(top:80) + callback logic).
// Dispatch results are asserted via @State variables read back through inspector "content"
// (enterOnChildTouchView / dragBlankAreaBelowMyList / clickMyButton are defined in
//  Column_comattr_onChildTouch_1_test.cj, same package).
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
class Column_comattr_onChildTouch_arkts_test {
    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_arkts_0100
     * @tc.name      : TestCase_arkts_example1
     * @tc.desc      : onChildTouchTest returns TouchResult(ForwardCompetition, id: MyList): blank-area drag scrolls List and Button responds onClick, aligned to ts-universal-attributes-on-child-touch-test.md#示例1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example1(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example1 begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_arkts_example1(Option<CustomView>.None) }, "Column_comattr_onChildTouch_arkts_test", "TestCase_arkts_example1")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MyList").isSome(), true)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MyButton").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        waitStatusText("dispatchStatusText", "\"scroll=true;click=0\"")
        clickMyButton()
        waitStatusText("dispatchStatusText", "\"scroll=true;click=1\"")
        @Expect(readStatusText("callbackStatusText"), "\"cb=2;seen=true\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example1 ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_arkts_0200
     * @tc.name      : TestCase_arkts_example2
     * @tc.desc      : onChildTouchTest returns TouchResult(Forward, id: MyList): blank-area drag scrolls List and Button does not respond onClick, aligned to ts-universal-attributes-on-child-touch-test.md#示例2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example2(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example2 begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_arkts_example2(Option<CustomView>.None) }, "Column_comattr_onChildTouch_arkts_test", "TestCase_arkts_example2")
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("Column_comattr_id").isSome(), true)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MyList").isSome(), true)
        @Expect(Screen.findTheOnlyUiComponentWhoseIdEqualsTo("MyButton").isSome(), true)
        @Expect(readStatusText("callbackStatusText"), "\"cb=0;seen=false\"")
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=false;click=0\"")
        dragBlankAreaBelowMyList()
        waitStatusText("dispatchStatusText", "\"scroll=true;click=0\"")
        clickMyButton()
        waitStatusText("callbackStatusText", "\"cb=2;seen=true\"")
        graceForNegativeAssert()
        @Expect(readStatusText("dispatchStatusText"), "\"scroll=true;click=0\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example2 ends.")
    }

    /*
     * @tc.number    : TestColumn_comattr_onChildTouch_arkts_0300
     * @tc.name      : TestCase_arkts_example3
     * @tc.desc      : onChildTouchTest returns TouchResult(Default): blank-area drag does not scroll List and Button responds onClick, aligned to ts-universal-attributes-on-child-touch-test.md#示例3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_arkts_example3(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example3 begins.")
        enterOnChildTouchView({_: CustomView => View_Column_comattr_onChildTouch_arkts_example3(Option<CustomView>.None) }, "Column_comattr_onChildTouch_arkts_test", "TestCase_arkts_example3")
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
        @Expect(readStatusText("callbackStatusText"), "\"cb=2;seen=true\"")
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_arkts_example3 ends.")
    }
}
