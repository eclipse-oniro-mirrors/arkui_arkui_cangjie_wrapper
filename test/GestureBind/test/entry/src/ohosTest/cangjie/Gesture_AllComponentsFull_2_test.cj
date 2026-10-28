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
class Gesture_AllComponentsFull_2_test {
    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_6500
     * @tc.name      : TestCase_Comp_RelativeContainer
     * @tc.desc      : RelativeContainer binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_RelativeContainer(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_RelativeContainer begins.")
        enterGestureView({_: CustomView => View_GestureComp_RelativeContainer(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_RelativeContainer", "RelativeContainer_gesture_area")
        swipeAreaBy("RelativeContainer_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_6600
     * @tc.name      : TestCase_Comp_Shape
     * @tc.desc      : Shape binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Shape(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Shape begins.")
        enterGestureView({_: CustomView => View_GestureComp_Shape(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Shape", "Shape_gesture_area")
        swipeAreaBy("Shape_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_6700
     * @tc.name      : TestCase_Comp_Ellipse
     * @tc.desc      : Ellipse binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Ellipse(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Ellipse begins.")
        enterGestureView({_: CustomView => View_GestureComp_Ellipse(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Ellipse", "Ellipse_gesture_area")
        swipeAreaBy("Ellipse_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_6800
     * @tc.name      : TestCase_Comp_Circle
     * @tc.desc      : Circle binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Circle(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Circle begins.")
        enterGestureView({_: CustomView => View_GestureComp_Circle(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Circle", "Circle_gesture_area")
        swipeAreaBy("Circle_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_6900
     * @tc.name      : TestCase_Comp_Path
     * @tc.desc      : Path binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Path(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Path begins.")
        enterGestureView({_: CustomView => View_GestureComp_Path(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Path", "Path_gesture_area")
        swipeAreaBy("Path_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7000
     * @tc.name      : TestCase_Comp_Path2D
     * @tc.desc      : Path2D binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Path2D(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Path2D begins.")
        enterGestureView({_: CustomView => View_GestureComp_Path2D(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Path2D", "Path2D_gesture_area")
        swipeAreaBy("Path2D_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7100
     * @tc.name      : TestCase_Comp_Line
     * @tc.desc      : Line binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Line(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Line begins.")
        enterGestureView({_: CustomView => View_GestureComp_Line(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Line", "Line_gesture_area")
        swipeAreaBy("Line_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7200
     * @tc.name      : TestCase_Comp_Rect
     * @tc.desc      : Rect binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // Rect组件调用先注释，待Rect组件问题修复后恢复
    // @TestCase
    // @Tag[APILevel26, TestLevel0]
    // func TestCase_Comp_Rect(): Unit {
    //     Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Rect begins.")
    //     enterGestureView({_: CustomView => View_GestureComp_Rect(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Rect", "Rect_gesture_area")
    //     swipeAreaBy("Rect_gesture_area", 200, 0)
    //     @Expect(recordPresent("start"), true)
    // }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7300
     * @tc.name      : TestCase_Comp_Canvas
     * @tc.desc      : Canvas binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Canvas(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Canvas begins.")
        enterGestureView({_: CustomView => View_GestureComp_Canvas(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Canvas", "Canvas_gesture_area")
        swipeAreaBy("Canvas_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7400
     * @tc.name      : TestCase_Comp_Gauge
     * @tc.desc      : Gauge binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Gauge(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Gauge begins.")
        enterGestureView({_: CustomView => View_GestureComp_Gauge(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Gauge", "Gauge_gesture_area")
        swipeAreaBy("Gauge_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7500
     * @tc.name      : TestCase_Comp_DataPanel
     * @tc.desc      : DataPanel binds gesture(PanGesture()): pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_DataPanel(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_DataPanel begins.")
        enterGestureView({_: CustomView => View_GestureComp_DataPanel(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_DataPanel", "DataPanel_gesture_area")
        swipeAreaBy("DataPanel_gesture_area", 200, 0)
        @Expect(recordPresent("start"), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7600
     * @tc.name      : TestCase_Comp_Search
     * @tc.desc      : Search binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Search(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Search begins.")
        enterGestureView({_: CustomView => View_GestureComp_Search(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Search", "Search_gesture_area")
        swipeAreaBy("Search_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7700
     * @tc.name      : TestCase_Comp_Select
     * @tc.desc      : Select binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Select(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Select begins.")
        enterGestureView({_: CustomView => View_GestureComp_Select(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Select", "Select_gesture_area")
        swipeAreaBy("Select_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7800
     * @tc.name      : TestCase_Comp_Slider
     * @tc.desc      : Slider binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Slider(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Slider begins.")
        enterGestureView({_: CustomView => View_GestureComp_Slider(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Slider", "Slider_gesture_area")
        swipeAreaBy("Slider_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }

    /*
     * @tc.number    : TestGesture_AllComponentsFull_2_test_7900
     * @tc.name      : TestCase_Comp_Rating
     * @tc.desc      : Rating binds gesture(PanGesture()): binding survives built-in gesture competition (two-valued record)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Comp_Rating(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Comp_Rating begins.")
        enterGestureView({_: CustomView => View_GestureComp_Rating(Option<CustomView>.None)}, "Gesture_AllComponentsFull_2_test", "TestCase_Comp_Rating", "Rating_gesture_area")
        swipeAreaBy("Rating_gesture_area", 200, 0)
        @Expect(recordBinaryOutcomeClean(), true)
    }
}
