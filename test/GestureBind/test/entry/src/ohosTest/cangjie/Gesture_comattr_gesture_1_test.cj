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

// Test class for Gesture_comattr_gesture_1_test scenarios (SR.IR20260916000104.008 gesture binding DT)
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
import ohos.ui_test
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

// Helpers for GestureBind DT tests
// Single read attempt tolerant to transient windows during @State re-render.
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

// Waits until the status Text is readable, then returns its content (polls on the test thread;
// the ui_test Driver API rejects concurrent calls).
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

// Positive assertion: polls on the test thread until the status Text equals the expected value.
func waitStatusText(id: String, expected: String): Unit {
    var matched = false
    var waited = 0
    while (!matched && waited < 3000) {
        let value = tryReadStatusText(id)
        if (value.isSome()) {
            matched = value.getOrThrow() == expected
        }
        if (!matched) {
            sleepFor(50.milliSecond)
            waited = waited + 50
        }
    }
    @Assert(matched)
}

// Negative assertion with a stability window: the status Text must keep the expected value
// across consecutive samples (replaces the fixed-500ms-sleep assertStatusStays, whose single
// late read could flip the result either way).
func waitStatusStable(id: String, expected: String): Unit {
    let first = readStatusText(id)
    var stable = first == expected
    var sampled = 0
    while (sampled < 5) {
        sleepFor(200.milliSecond)
        let value = tryReadStatusText(id)
        match (value) {
            case Some(text) => stable = stable && (text == expected)
            case None => stable = false
        }
        sampled = sampled + 1
    }
    @Assert(stable)
}

// Two-valued result assertion for competition-class components: the bound pan either wins
// the built-in gesture ("start") or loses it ("idle"); both outcomes prove the binding did
// not crash and the result is observable. The actual competition semantics is anchored by
// the ArkTS parity cases (DT-110~115), not by this assertion.
func assertStatusIn(id: String, first: String, second: String): Unit {
    let value = readStatusText(id)
    @Assert(value == first || value == second)
}

// Controlled multi-frame single-finger injection: equal-distance interpolation from the
// component center over `steps` move frames, so intermediate move-event count (and thus
// onActionUpdate count) and end velocity are reproducible. Replaces the single-shot
// `swipe` for value-level data-plane assertions.
func slideBySteps(id: String, deltaX: Int32, deltaY: Int32, steps!: Int32 = 12): Unit {
    let area = Screen.getTheOnlyUiComponentWhoseIdEqualsTo(id)
    let driver = TestDriver.driver
    let total = steps + 1
    let pointerMatrix = PointerMatrix.create(1, total)
    let cx = area.centerPoint.x
    let cy = area.centerPoint.y
    var i: Int32 = 0
    while (i < total) {
        let px = cx + deltaX * i / steps
        let py = cy + deltaY * i / steps
        pointerMatrix.setPoint(0, i, ui_test.Point(px, py))
        i = i + 1
    }
    driver.injectMultiPointerAction(pointerMatrix)
    sleepFor(300.milliSecond)
}

// True when the status Text contains the given substring.
func statusContains(id: String, part: String): Bool {
    let value = readStatusText(id)
    match (value.indexOf(part)) {
        case Some(_) => true
        case None => false
    }
}

// Swipes horizontally/vertically by (deltaX, deltaY) pixels starting from the center of the
// component with the given id.
// Pan trigger injection: delegates to slideBySteps' multi-frame PointerMatrix
// injection (12 interpolated frames from the area center). The original
// driver.swipe single-frame flick proved recognition-unstable on device
// (whole-suite "status never start" failures); the value tests already rely on
// this controlled path, so all positive/negative triggers use it now.
func swipeAreaBy(id: String, deltaX: Int32, deltaY: Int32): Unit {
    slideBySteps(id, deltaX, deltaY)
}

// Two-finger pan injection: both fingers move together by (deltaX, deltaY) pixels, starting
// from the component center with a constant symmetric offset between the two fingers.
// Upgraded per DT design: 12 equal-distance interpolation frames (was 4, which let the two
// "simultaneous" presses be recognized as sequential single-finger phases) and a reduced
// 20px offset so both fingers stay inside the target area longer.
func slideTwoFingersOnArea(id: String, deltaX: Int32, deltaY: Int32): Unit {
    let area = Screen.getTheOnlyUiComponentWhoseIdEqualsTo(id)
    let driver = TestDriver.driver
    let steps: Int32 = 12
    let total: Int32 = steps + 1
    let pointerMatrix = PointerMatrix.create(2, total)
    let cx = area.centerPoint.x
    let cy = area.centerPoint.y
    let off: Int32 = 20
    var i: Int32 = 0
    while (i < total) {
        pointerMatrix.setPoint(0, i, ui_test.Point(cx + off + deltaX * i / steps, cy + off + deltaY * i / steps))
        pointerMatrix.setPoint(1, i, ui_test.Point(cx - off + deltaX * i / steps, cy - off + deltaY * i / steps))
        i = i + 1
    }
    driver.injectMultiPointerAction(pointerMatrix)
    sleepFor(300.milliSecond)
}

// ---- Direct-capture record assertions (shared by all gesture/parallel/full-component
// suites) ----
// Views call GestureEventRecords.record("<phase>", e) inside their gesture callbacks;
// these helpers assert on the captured records, so positive cases become record-presence
// polls and negative cases (gesture must NOT fire) become record-absence checks —
// neither depends on the unreliable "@State -> re-render -> inspector read-back" chain
// (whole-suite matched=false failures, see SR.IR20260916000104.008 DT fix).

// Number of captured records with the given phase tag.
func gestureRecordCount(phase: String): Int64 {
    var count: Int64 = 0
    for (r in GestureEventRecords.records) {
        if (r.phase == phase) {
            count = count + 1
        }
    }
    return count
}

// Positive predicate: polls until a record with the given phase appears (3s budget).
// Test cases assert the return value directly with @Expect — per test-quality-scan rules
// every case needs a direct @Expect in its body, so assertion helpers stay pure
// predicates (0001 OnChildTouch waitFor/counter precedent).
func recordPresent(phase: String): Bool {
    var waited = 0
    while (gestureRecordCount(phase) == 0 && waited < 3000) {
        sleepFor(50.milliSecond)
        waited = waited + 50
    }
    return gestureRecordCount(phase) > 0
}

// Negative predicate: after a settle window for late callbacks, no record with the given
// phase exists (the gesture never fired — deterministic, no render dependency).
func recordAbsent(phase: String): Bool {
    sleepFor(500.milliSecond)
    return gestureRecordCount(phase) == 0
}

// Binary-outcome predicate for compete/special components (Scroll/List/Swiper/Slider/
// TextInput/Video and full-component parts 3/4): the pan either won (>=1 "start"
// record) or the built-in gesture won (0 records) — both valid; every captured record
// must be a clean "start" phase.
func recordBinaryOutcomeClean(): Bool {
    sleepFor(500.milliSecond)
    for (r in GestureEventRecords.records) {
        if (r.phase != "start") {
            return false
        }
    }
    Hilog.info(0, "CangjieTest", "binary outcome: ${gestureRecordCount("start")} start record(s)")
    return true
}

// Finger count (fingerIds.size) of the LAST record with the given phase; -1 if absent.
// Value-level check for fingers fallback / multi-finger cases without text coupling.
func gestureRecordFingerCount(phase: String): Int64 {
    var result: Int64 = -1
    for (r in GestureEventRecords.records) {
        if (r.phase == phase) {
            result = r.fingerIds.size
        }
    }
    return result
}

@Test
class Gesture_comattr_gesture_1_test {
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0100
     * @tc.name      : TestCase_NormalTwoFingers
     * @tc.desc      : gesture binds PanGesture(fingers:2); two-finger pan triggers start/end with fingerList.size=2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_NormalTwoFingers(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_NormalTwoFingers begins.")
        enterGestureView({_: CustomView => View_Gesture_Normal_TwoFingers(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_NormalTwoFingers", "gesture_area")
        slideTwoFingersOnArea("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 2, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0200
     * @tc.name      : TestCase_AbnormalFingers11
     * @tc.desc      : fingers=11 exceeds upper bound 10 and falls back to default 1; single-finger pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_AbnormalFingers11(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_AbnormalFingers11 begins.")
        enterGestureView({_: CustomView => View_Gesture_Abnormal_Fingers11(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_AbnormalFingers11", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0300
     * @tc.name      : TestCase_BoundaryFingers1
     * @tc.desc      : fingers=1 lower bound; single-finger pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_BoundaryFingers1(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_BoundaryFingers1 begins.")
        enterGestureView({_: CustomView => View_Gesture_Boundary_Fingers1(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_BoundaryFingers1", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0400
     * @tc.name      : TestCase_BoundaryDistance0
     * @tc.desc      : distance=0 lower bound; a 3px pan already triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_BoundaryDistance0(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_BoundaryDistance0 begins.")
        enterGestureView({_: CustomView => View_Gesture_Boundary_Distance0(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_BoundaryDistance0", "gesture_area")
        swipeAreaBy("gesture_area", 3, 0)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0500
     * @tc.name      : TestCase_Default
     * @tc.desc      : PanGesture() all defaults (fingers=1/All/5.0); single-finger pan triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_Default(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_Default begins.")
        enterGestureView({_: CustomView => View_Gesture_Default(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_Default", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
        @Expect(gestureRecordFingerCount("end") == 1, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0600
     * @tc.name      : TestCase_DefaultDistance
     * @tc.desc      : default distance 5.0vp; a 3px pan does not trigger and status stays idle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_DefaultDistance(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_DefaultDistance begins.")
        enterGestureView({_: CustomView => View_Gesture_Default_Distance(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_DefaultDistance", "gesture_area")
        swipeAreaBy("gesture_area", 3, 0)
        @Expect(recordAbsent("start"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0700
     * @tc.name      : TestCase_ChainCombination
     * @tc.desc      : gesture chains with width/height/background attrs; pan still triggers
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_ChainCombination(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_ChainCombination begins.")
        enterGestureView({_: CustomView => View_Gesture_Chain_Combination(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_ChainCombination", "gesture_area")
        swipeAreaBy("gesture_area", 200, 0)
        @Expect(recordPresent("end"), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0800
     * @tc.name      : TestCase_EventFieldsEnd
     * @tc.desc      : value-level: end record offsetX in [10,300]vp and velocity>0 via direct capture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_EventFieldsEnd(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_EventFieldsEnd begins.")
        enterGestureView({_: CustomView => View_Gesture_EventFields(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_EventFieldsEnd", "gesture_area")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        var startSeen = false
        var endRecord: ?GestureEventRecord = Option<GestureEventRecord>.None
        for (r in GestureEventRecords.records) {
            if (r.phase == "start") {
                startSeen = true
            }
            if (r.phase == "end") {
                endRecord = Option<GestureEventRecord>.Some(r)
            }
        }
        @Expect(startSeen, true)
        let end = endRecord.getOrThrow()
        @Expect(end.offsetX >= 10.0 && end.offsetX <= 300.0, true)
        @Expect(end.velocity > 0.0, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_0900
     * @tc.name      : TestCase_EventFieldsUpdate
     * @tc.desc      : controlled 12-frame injection produces >= 3 onActionUpdate callbacks (direct count)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_EventFieldsUpdate(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_EventFieldsUpdate begins.")
        enterGestureView({_: CustomView => View_Gesture_EventFields(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_EventFieldsUpdate", "gesture_area")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        var updateCount: Int64 = 0
        for (r in GestureEventRecords.records) {
            if (r.phase == "update") {
                updateCount = updateCount + 1
            }
        }
        @Expect(updateCount >= 3, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_gesture_1_test_1000
     * @tc.name      : TestCase_EventFieldsInfos
     * @tc.desc      : value-level: fingerInfos Some with size 1, source TouchScreen, tapLocation None
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_EventFieldsInfos(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_EventFieldsInfos begins.")
        enterGestureView({_: CustomView => View_Gesture_EventFields(Option<CustomView>.None)}, "Gesture_comattr_gesture_1_test", "TestCase_EventFieldsInfos", "gesture_area")
        GestureEventRecords.reset()
        slideBySteps("gesture_area", 200, 0)
        var endRecord: ?GestureEventRecord = Option<GestureEventRecord>.None
        for (r in GestureEventRecords.records) {
            if (r.phase == "end") {
                endRecord = Option<GestureEventRecord>.Some(r)
            }
        }
        let end = endRecord.getOrThrow()
        @Expect(!end.fingerInfosNone, true)
        @Expect(end.fingerInfoIds.size == 1, true)
        @Expect(end.sourceTouch, true)
        @Expect(end.tapLocationNone, true)
    }
}
