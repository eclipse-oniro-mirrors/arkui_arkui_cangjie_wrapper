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

// Test class for Gesture_comattr_gesture_arkts_test scenarios (SR.IR20260916000104.008 gesture binding DT)
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_comattr_gesture_arkts.*
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
class Gesture_comattr_gesture_arkts_test {
    /*
     * @tc.number    : TestGesture_comattr_gesture_arkts_test_4600
     * @tc.name      : TestCase_ArktsPanExample1
     * @tc.desc      : ArkTS pangesture example translated: Left|Right direction (vertical pan must not trigger), drag with translate follow, pan end
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ArktsPanExample1(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ArktsPanExample1 begins.")
        enterGestureView({_: CustomView => View_Gesture_Arkts_PanExample1(Option<CustomView>.None)}, "Gesture_comattr_gesture_arkts_test", "TestCase_ArktsPanExample1", "arkts_pan_area")
        swipeAreaBy("arkts_pan_area", 0, 200)
        @Expect(recordAbsent("start"), true)
        swipeAreaBy("arkts_pan_area", 200, 0)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_arkts_test_4700
     * @tc.name      : TestCase_ArktsSettingsExample1
     * @tc.desc      : ArkTS gesture-settings example1 translated (TapGesture->PanGesture, priorityGesture segment not provided by Cangjie): parallel makes both Text and Column respond
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ArktsSettingsExample1(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ArktsSettingsExample1 begins.")
        enterGestureView({_: CustomView => View_Gesture_Arkts_SettingsExample1(Option<CustomView>.None)}, "Gesture_comattr_gesture_arkts_test", "TestCase_ArktsSettingsExample1", "arkts_settings_text")
        // Swipe the child Text region (DT-047 "在子区域水平滑动"): the Column's center
        // point falls below the top-aligned Text, so "arkts_settings_child" missed the
        // Text and text-start never fired. The parent Column's parallelGesture still
        // receives the touch since the Text lies inside it.
        swipeAreaBy("arkts_settings_text", 200, 0)
        @Expect(recordPresent("text-start"), true)
        @Expect(recordPresent("column-start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_arkts_test_12700
     * @tc.name      : TestCase_ArktsSettingsExample2
     * @tc.desc      : ArkTS gesture-settings example2 translated: fingerInfos monitors effective finger count during pan; count resets to 0 on end
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ArktsSettingsExample2(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ArktsSettingsExample2 begins.")
        enterGestureView({_: CustomView => View_Gesture_Arkts_SettingsExample2(Option<CustomView>.None)}, "Gesture_comattr_gesture_arkts_test", "TestCase_ArktsSettingsExample2", "arkts_finger_area")
        GestureEventRecords.reset()
        slideBySteps("arkts_finger_area", 200, 0)
        var seenActiveFinger = false
        for (r in GestureEventRecords.records) {
            if (!r.fingerInfosNone && r.fingerInfoIds.size == 1) {
                seenActiveFinger = true
            }
        }
        @Expect(seenActiveFinger, true)
        @Expect(recordPresent("end"), true)
    }
}
