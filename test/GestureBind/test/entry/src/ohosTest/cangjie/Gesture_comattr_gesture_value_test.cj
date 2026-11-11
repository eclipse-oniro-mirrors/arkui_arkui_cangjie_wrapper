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

// Test class for SR-006 data-plane value-level assertions (SR.IR20260916000104.008 DT-116~123).
// All cases enter the View_Gesture_EventFields page (300x300vp area), reset the
// GestureEventRecords direct-capture buffer, inject a controlled multi-frame pan, then
// assert on raw recorded field values (range / relation / consistency), never on
// booleanized status text.
package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Gesture_comattr_gesture_1.*
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

private func enterValueView(caseName: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch {
        modtestSuiteText[0] = "Gesture_comattr_gesture_value_test"
        modtestCaseText[0] = caseName
        modtestView[0] = {_: CustomView => View_Gesture_EventFields(Option<CustomView>.None)}
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("gesture_area"), 3000i32)
    sleepFor(500.milliSecond)
}

private func enterFingerDisplayView(caseName: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch {
        modtestSuiteText[0] = "Gesture_comattr_gesture_value_test"
        modtestCaseText[0] = caseName
        modtestView[0] = {_: CustomView => View_Gesture_FingerDisplay(Option<CustomView>.None)}
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("gesture_area"), 3000i32)
    sleepFor(500.milliSecond)
}

private func findEndRecord(): GestureEventRecord {
    var endRecord: ?GestureEventRecord = Option<GestureEventRecord>.None
    for (r in GestureEventRecords.records) {
        if (r.phase == "end") {
            endRecord = Option<GestureEventRecord>.Some(r)
        }
    }
    return endRecord.getOrThrow()
}

@Test
class Gesture_comattr_gesture_value_test {
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_11600
     * @tc.name      : TestCase_ValueOffset
     * @tc.desc      : value-level offsetX/offsetY: horizontal end offsetX in [10,300]vp, |offsetY|<=10vp, updates positive; vertical (upward) end offsetY in [-300,-10]vp, updates negative
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueOffset(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueOffset begins.")
        enterValueView("TestCase_ValueOffset")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        let end = findEndRecord()
        @Expect(end.offsetX >= 10.0 && end.offsetX <= 300.0, true)
        @Expect(end.offsetY >= -10.0 && end.offsetY <= 10.0, true)
        for (r in GestureEventRecords.records) {
            if (r.phase != "start") {
                @Expect(r.offsetX > 0.0, true)
            }
        }
        // Vertical segment (upward pan): offsetY sign semantics — positive means downward
        // per FDD, so an upward slide must yield a negative end offsetY with |offsetX| small.
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 0, -200)
        let endUp = findEndRecord()
        @Expect(endUp.offsetY >= -300.0 && endUp.offsetY <= -10.0, true)
        @Expect(endUp.offsetX >= -10.0 && endUp.offsetX <= 10.0, true)
        for (r in GestureEventRecords.records) {
            if (r.phase != "start") {
                @Expect(r.offsetY < 0.0, true)
            }
        }
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_11700
     * @tc.name      : TestCase_ValueVelocity
     * @tc.desc      : value-level velocity family: velocity>0, velocityX>0, |vx|>=|vy|, pythagorean relation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueVelocity(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueVelocity begins.")
        enterValueView("TestCase_ValueVelocity")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        let end = findEndRecord()
        @Expect(end.velocity > 0.0, true)
        @Expect(end.velocityX > 0.0, true)
        @Expect(end.velocityX >= end.velocityY && end.velocityX >= -end.velocityY, true)
        let lhs = end.velocity * end.velocity
        let rhs = end.velocityX * end.velocityX + end.velocityY * end.velocityY
        @Expect(lhs >= rhs * 0.9 && lhs <= rhs * 1.1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_11800
     * @tc.name      : TestCase_ValueFingerList
     * @tc.desc      : value-level fingerList: size 1, id 0, local coords within component rect (+/-10vp), global window offset constant (X/Y) and agreeing with fingerInfos
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueFingerList(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueFingerList begins.")
        enterValueView("TestCase_ValueFingerList")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        for (r in GestureEventRecords.records) {
            @Expect(r.fingerIds.size == 1, true)
            @Expect(r.fingerIds[0] == 0, true)
            @Expect(r.fingerLocalXs[0] >= -10.0 && r.fingerLocalXs[0] <= 310.0, true)
            @Expect(r.fingerLocalYs[0] >= -10.0 && r.fingerLocalYs[0] <= 310.0, true)
        }
        // fingerList global coordinates: window offset (global - local) must stay constant
        // across callbacks on BOTH axes (same window origin for every callback).
        var windowRefX: ?Float64 = Option<Float64>.None
        var windowRefY: ?Float64 = Option<Float64>.None
        for (r in GestureEventRecords.records) {
            if (r.fingerIds.size == 1) {
                let wox = r.fingerGlobalXs[0] - r.fingerLocalXs[0]
                let woy = r.fingerGlobalYs[0] - r.fingerLocalYs[0]
                match (windowRefX) {
                    case None => windowRefX = Option<Float64>.Some(wox)
                    case Some(ref) => { =>
                        @Expect(wox >= ref - 1.0 && wox <= ref + 1.0, true)
                    }
                }
                match (windowRefY) {
                    case None => windowRefY = Option<Float64>.Some(woy)
                    case Some(ref) => { =>
                        @Expect(woy >= ref - 1.0 && woy <= ref + 1.0, true)
                    }
                }
            }
        }
        @Expect(windowRefX.isSome() && windowRefY.isSome(), true)
        // Cross-channel agreement: fingerList and fingerInfos describe the same window
        // origin, so their window offsets must agree on the end record.
        let end = findEndRecord()
        let listWox = end.fingerGlobalXs[0] - end.fingerLocalXs[0]
        let listWoy = end.fingerGlobalYs[0] - end.fingerLocalYs[0]
        @Expect(!end.fingerInfosNone, true)
        @Expect(end.fingerInfoGlobalXs[0] - end.fingerInfoLocalXs[0] >= listWox - 1.0 &&
            end.fingerInfoGlobalXs[0] - end.fingerInfoLocalXs[0] <= listWox + 1.0, true)
        @Expect(end.fingerInfoGlobalYs[0] - end.fingerInfoLocalYs[0] >= listWoy - 1.0 &&
            end.fingerInfoGlobalYs[0] - end.fingerInfoLocalYs[0] <= listWoy + 1.0, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_11900
     * @tc.name      : TestCase_ValueFingerInfos
     * @tc.desc      : value-level fingerInfos: Some with size 1 id 0; window offset consistent across callbacks on both X and Y axes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueFingerInfos(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueFingerInfos begins.")
        enterValueView("TestCase_ValueFingerInfos")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        let end = findEndRecord()
        @Expect(!end.fingerInfosNone, true)
        @Expect(end.fingerInfoIds.size == 1, true)
        @Expect(end.fingerInfoIds[0] == 0, true)
        var offsetRef: ?Float64 = Option<Float64>.None
        var offsetRefY: ?Float64 = Option<Float64>.None
        for (r in GestureEventRecords.records) {
            if (!r.fingerInfosNone && r.fingerInfoIds.size >= 1) {
                let windowOffsetX = r.fingerInfoGlobalXs[0] - r.fingerInfoLocalXs[0]
                let windowOffsetY = r.fingerInfoGlobalYs[0] - r.fingerInfoLocalYs[0]
                match (offsetRef) {
                    case None => offsetRef = Option<Float64>.Some(windowOffsetX)
                    case Some(ref) => { =>
                        @Expect(windowOffsetX >= ref - 1.0 && windowOffsetX <= ref + 1.0, true)
                    }
                }
                match (offsetRefY) {
                    case None => offsetRefY = Option<Float64>.Some(windowOffsetY)
                    case Some(ref) => { =>
                        @Expect(windowOffsetY >= ref - 1.0 && windowOffsetY <= ref + 1.0, true)
                    }
                }
            }
        }
        @Expect(offsetRef.isSome() && offsetRefY.isSome(), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_12000
     * @tc.name      : TestCase_ValueTimestamp
     * @tc.desc      : value-level timestamp: positive and non-decreasing across start/update/end
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueTimestamp(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueTimestamp begins.")
        enterValueView("TestCase_ValueTimestamp")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        @Expect(GestureEventRecords.records.size >= 3, true)
        var prev: Int64 = 0
        for (r in GestureEventRecords.records) {
            @Expect(r.timestamp > 0, true)
            @Expect(r.timestamp >= prev, true)
            prev = r.timestamp
        }
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_12100
     * @tc.name      : TestCase_ValueTwoFingers
     * @tc.desc      : value-level two-finger: fingerList size 2 distinct ids, fingerInfos size 2, shared window offset
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueTwoFingers(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueTwoFingers begins.")
        enterValueView("TestCase_ValueTwoFingers")
        GestureEventRecords.reset()
        // two_finger_area binds PanGesture(fingers: 2); the fingers:1 gesture_area can
        // never produce fingerList.size==2 records for this injection.
        slideTwoFingersOnArea("two_finger_area", 200, 0)
        let end = findEndRecord()
        @Expect(end.fingerIds.size == 2, true)
        @Expect(end.fingerIds[0] != end.fingerIds[1], true)
        @Expect(!end.fingerInfosNone, true)
        @Expect(end.fingerInfoIds.size == 2, true)
        let offset0 = end.fingerInfoGlobalXs[0] - end.fingerInfoLocalXs[0]
        let offset1 = end.fingerInfoGlobalXs[1] - end.fingerInfoLocalXs[1]
        @Expect(offset0 >= offset1 - 2.0 && offset0 <= offset1 + 2.0, true)
        @Expect(end.fingerInfoGlobalXs[0] != end.fingerInfoGlobalXs[1], true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_12200
     * @tc.name      : TestCase_ValuePanSemantics
     * @tc.desc      : value-level pan semantics: tapLocation None and repeat false on every callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValuePanSemantics(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValuePanSemantics begins.")
        enterValueView("TestCase_ValuePanSemantics")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        for (r in GestureEventRecords.records) {
            @Expect(r.tapLocationNone, true)
            @Expect(!r.repeatValue, true)
        }
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_12300
     * @tc.name      : TestCase_ValueSource
     * @tc.desc      : value-level source: TouchScreen on every callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueSource(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueSource begins.")
        enterValueView("TestCase_ValueSource")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        for (r in GestureEventRecords.records) {
            @Expect(r.sourceTouch, true)
        }
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_13100
     * @tc.name      : TestCase_ValueHand
     * @tc.desc      : value-level FingerInfo.hand: every record's hand within the declared variant domain, constant across one injected pan, fingerList/fingerInfos channels consistent on the end record (actual device value is logged, not assumed)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueHand(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueHand begins.")
        enterValueView("TestCase_ValueHand")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        @Expect(GestureEventRecords.records.size >= 3, true)
        let handRef = GestureEventRecords.records[0].fingerHandValue
        for (r in GestureEventRecords.records) {
            @Expect(r.fingerHandValue == "OptionNone" || r.fingerHandValue == "None" ||
                r.fingerHandValue == "Left" || r.fingerHandValue == "Right", true)
            @Expect(r.fingerHandValue == handRef, true)
        }
        // END record (Some fingerInfos on end is backed by DT-119): both channels must
        // report the same hand value — fingerInfos is a reordering of fingerList.
        let end = findEndRecord()
        @Expect(!end.fingerInfosNone, true)
        @Expect(end.fingerInfoIds.size >= 1, true)
        @Expect(end.fingerInfoHandValue == end.fingerHandValue, true)
        Hilog.info(0u32, "CangjieTest", "observed FingerInfo.hand on injected pan: ${handRef}")
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_value_test_13200
     * @tc.name      : TestCase_ValueFingerDisplay
     * @tc.desc      : value-level FingerInfo display coordinates: displayX/displayY (screen origin) with screen-vs-window offset constant across callbacks on both axes and agreeing with fingerInfos channel; globalDisplayX/globalDisplayY (?Float64) is the touch point position (tracks the moving finger), so only the Some/None state is asserted stable across every callback, plus fingerList/fingerInfos channel agreement on every record (actual Some/None state is logged, not assumed)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ValueFingerDisplay(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ValueFingerDisplay begins.")
        enterFingerDisplayView("TestCase_ValueFingerDisplay")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        let end = findEndRecord()
        @Expect(end.fingerIds.size == 1, true)
        // display (screen origin) vs global (application window origin) offset must stay
        // constant across callbacks on BOTH axes (same window position on screen for
        // every callback of one injected pan).
        var screenRefX: ?Float64 = Option<Float64>.None
        var screenRefY: ?Float64 = Option<Float64>.None
        for (r in GestureEventRecords.records) {
            if (r.fingerIds.size == 1) {
                let sox = r.fingerDisplayXs[0] - r.fingerGlobalXs[0]
                let soy = r.fingerDisplayYs[0] - r.fingerGlobalYs[0]
                match (screenRefX) {
                    case None => screenRefX = Option<Float64>.Some(sox)
                    case Some(ref) => { =>
                        @Expect(sox >= ref - 1.0 && sox <= ref + 1.0, true)
                    }
                }
                match (screenRefY) {
                    case None => screenRefY = Option<Float64>.Some(soy)
                    case Some(ref) => { =>
                        @Expect(soy >= ref - 1.0 && soy <= ref + 1.0, true)
                    }
                }
            }
        }
        @Expect(screenRefX.isSome() && screenRefY.isSome(), true)
        let gdRefX = end.fingerGlobalDisplayXs[0]
        let gdRefY = end.fingerGlobalDisplayYs[0]
        for (r in GestureEventRecords.records) {
            if (r.fingerIds.size == 1) {
                @Expect((r.fingerGlobalDisplayXs[0] == "OptionNone") == (gdRefX == "OptionNone"), true)
                @Expect((r.fingerGlobalDisplayYs[0] == "OptionNone") == (gdRefY == "OptionNone"), true)
            }
            if (r.fingerIds.size == 1 && !r.fingerInfosNone && r.fingerInfoIds.size >= 1) {
                @Expect(r.fingerGlobalDisplayXs[0] == r.fingerInfoGlobalDisplayXs[0], true)
                @Expect(r.fingerGlobalDisplayYs[0] == r.fingerInfoGlobalDisplayYs[0], true)
            }
        }
        // Cross-channel agreement: fingerList and fingerInfos describe the same touch
        // point, so their display coordinates and globalDisplay serializations must
        // agree on the end record.
        @Expect(!end.fingerInfosNone, true)
        @Expect(end.fingerInfoDisplayXs[0] >= end.fingerDisplayXs[0] - 1.0 &&
            end.fingerInfoDisplayXs[0] <= end.fingerDisplayXs[0] + 1.0, true)
        @Expect(end.fingerInfoDisplayYs[0] >= end.fingerDisplayYs[0] - 1.0 &&
            end.fingerInfoDisplayYs[0] <= end.fingerDisplayYs[0] + 1.0, true)
        @Expect(end.fingerInfoGlobalDisplayXs[0] == gdRefX, true)
        @Expect(end.fingerInfoGlobalDisplayYs[0] == gdRefY, true)
        Hilog.info(0u32, "CangjieTest",
            "observed FingerInfo.globalDisplay on injected pan: X=${gdRefX}, Y=${gdRefY}")
    }
}
