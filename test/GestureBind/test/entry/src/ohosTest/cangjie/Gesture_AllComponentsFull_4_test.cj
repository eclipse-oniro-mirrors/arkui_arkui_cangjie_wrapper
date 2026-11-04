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
// Test class for DT full-component coverage (gesture single-param overload).
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_AllComponentsFull.*
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

private func enterGestureView(view: (CustomView) -> CustomView, suiteName: String, caseName: String, waitId: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch {
        modtestSuiteText[0] = suiteName
        modtestCaseText[0] = caseName
        modtestView[0] = view
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id(waitId), 3000i32)
    GestureEventRecords.reset()
    sleepFor(500.milliSecond)
}

@Test
class Gesture_AllComponentsFull_4_test {
    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_9500
     * @tc.name      : TestCase_Comp_RichText
     * @tc.desc      : RichText binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_RichText(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_RichText begins.")
        enterGestureView({_: CustomView => View_GestureComp_RichText(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_RichText", "RichText_gesture_area")
        swipeAreaBy("RichText_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_9600
     * @tc.name      : TestCase_Comp_Scroll
     * @tc.desc      : Scroll binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Scroll(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Scroll begins.")
        enterGestureView({_: CustomView => View_GestureComp_Scroll(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_Scroll", "Scroll_gesture_area")
        swipeAreaBy("Scroll_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_9700
     * @tc.name      : TestCase_Comp_ScrollBar
     * @tc.desc      : ScrollBar binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_ScrollBar(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_ScrollBar begins.")
        enterGestureView({_: CustomView => View_GestureComp_ScrollBar(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_ScrollBar", "ScrollBar_gesture_area")
        swipeAreaBy("ScrollBar_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_9800
     * @tc.name      : TestCase_Comp_List
     * @tc.desc      : List binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_List(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_List begins.")
        enterGestureView({_: CustomView => View_GestureComp_List(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_List", "List_gesture_area")
        swipeAreaBy("List_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_9900
     * @tc.name      : TestCase_Comp_ListItem
     * @tc.desc      : ListItem binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_ListItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_ListItem begins.")
        enterGestureView({_: CustomView => View_GestureComp_ListItem(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_ListItem", "ListItem_gesture_area")
        swipeAreaBy("ListItem_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10000
     * @tc.name      : TestCase_Comp_ListItemGroup
     * @tc.desc      : ListItemGroup binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_ListItemGroup(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_ListItemGroup begins.")
        enterGestureView({_: CustomView => View_GestureComp_ListItemGroup(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_ListItemGroup", "ListItemGroup_gesture_area")
        swipeAreaBy("ListItemGroup_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10100
     * @tc.name      : TestCase_Comp_Grid
     * @tc.desc      : Grid binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Grid(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Grid begins.")
        enterGestureView({_: CustomView => View_GestureComp_Grid(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_Grid", "Grid_gesture_area")
        swipeAreaBy("Grid_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10200
     * @tc.name      : TestCase_Comp_GridItem
     * @tc.desc      : GridItem binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_GridItem(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_GridItem begins.")
        enterGestureView({_: CustomView => View_GestureComp_GridItem(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_GridItem", "GridItem_gesture_area")
        swipeAreaBy("GridItem_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10300
     * @tc.name      : TestCase_Comp_GridRow
     * @tc.desc      : GridRow binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_GridRow(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_GridRow begins.")
        enterGestureView({_: CustomView => View_GestureComp_GridRow(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_GridRow", "GridRow_gesture_area")
        swipeAreaBy("GridRow_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10400
     * @tc.name      : TestCase_Comp_GridCol
     * @tc.desc      : GridCol binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_GridCol(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_GridCol begins.")
        enterGestureView({_: CustomView => View_GestureComp_GridCol(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_GridCol", "GridCol_gesture_area")
        swipeAreaBy("GridCol_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10500
     * @tc.name      : TestCase_Comp_Swiper
     * @tc.desc      : Swiper binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Swiper(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Swiper begins.")
        enterGestureView({_: CustomView => View_GestureComp_Swiper(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_Swiper", "Swiper_gesture_area")
        swipeAreaBy("Swiper_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10600
     * @tc.name      : TestCase_Comp_TabContent
     * @tc.desc      : TabContent binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_TabContent(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_TabContent begins.")
        enterGestureView({_: CustomView => View_GestureComp_TabContent(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_TabContent", "TabContent_gesture_area")
        swipeAreaBy("TabContent_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10700
     * @tc.name      : TestCase_Comp_Refresh
     * @tc.desc      : Refresh binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Refresh(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Refresh begins.")
        enterGestureView({_: CustomView => View_GestureComp_Refresh(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_Refresh", "Refresh_gesture_area")
        swipeAreaBy("Refresh_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10800
     * @tc.name      : TestCase_Comp_Sidebar
     * @tc.desc      : Sidebar binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Sidebar(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Sidebar begins.")
        enterGestureView({_: CustomView => View_GestureComp_Sidebar(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_Sidebar", "Sidebar_gesture_area")
        swipeAreaBy("Sidebar_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_4_test_10900
     * @tc.name      : TestCase_Comp_Navigation
     * @tc.desc      : Navigation binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Navigation(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Navigation begins.")
        enterGestureView({_: CustomView => View_GestureComp_Navigation(Option<CustomView>.None)}, "Gesture_AllComponentsFull_4_test", "TestCase_Comp_Navigation", "Navigation_gesture_area")
        swipeAreaBy("Navigation_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }
}
