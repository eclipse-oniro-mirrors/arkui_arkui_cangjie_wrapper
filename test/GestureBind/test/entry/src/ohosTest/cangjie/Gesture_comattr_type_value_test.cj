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

// Test class for SR-005 nested-type value checks (SR.IR20260916000104.008 DT-124~126).
// Pure logic cases: no page, no injection. PanDirection raw values are protected
// (getValue), but the public Computed(UInt32) constructor plus Equatable lets the
// operator results be asserted directly.
package ohos_app_cangjie_entry_test
import kit.PerformanceAnalysisKit.Hilog
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*

@Test
class Gesture_comattr_type_value_test {
    /*
     * @tc.number    : TestGesture_comattr_type_value_test_12400
     * @tc.name      : TestCase_TypeValueOr
     * @tc.desc      : PanDirection | results: Left|Up==Computed(5), Right|Down==Computed(10)
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TypeValueOr(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TypeValueOr begins.")
        @Expect((PanDirection.Left | PanDirection.Up) == PanDirection.Computed(UInt32(5)), true)
        @Expect((PanDirection.Right | PanDirection.Down) == PanDirection.Computed(UInt32(10)), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_type_value_test_12500
     * @tc.name      : TestCase_TypeValueAnd
     * @tc.desc      : PanDirection & results: All&Up==Computed(4), Left|Right==Computed(3) (=Horizontal), commutativity
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TypeValueAnd(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TypeValueAnd begins.")
        @Expect((PanDirection.All & PanDirection.Up) == PanDirection.Computed(UInt32(4)), true)
        @Expect((PanDirection.Left | PanDirection.Right) == PanDirection.Computed(UInt32(3)), true)
        @Expect((PanDirection.Up | PanDirection.Left) == (PanDirection.Left | PanDirection.Up), true)
    }
    /*
     * @tc.number    : TestGesture_comattr_type_value_test_12600
     * @tc.name      : TestCase_TypeValueMask
     * @tc.desc      : GestureMask variants are distinct (value semantics covered behaviorally by DT-014~016/036~038)
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TypeValueMask(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TypeValueMask begins.")
        @Expect(GestureMask.Normal != GestureMask.IgnoreInternal, true)
    }
    /*
     * @tc.number    : TestGesture_comattr_type_value_test_12900
     * @tc.name      : TestCase_TypeValueMaskEquals
     * @tc.desc      : value-level GestureMask ==: reflexive true per variant; Normal == IgnoreInternal false (complements != in DT-126)
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TypeValueMaskEquals(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TypeValueMaskEquals begins.")
        @Expect(GestureMask.Normal == GestureMask.Normal, true)
        @Expect(GestureMask.IgnoreInternal == GestureMask.IgnoreInternal, true)
        @Expect(GestureMask.Normal == GestureMask.IgnoreInternal, false)
    }
    /*
     * @tc.number    : TestGesture_comattr_type_value_test_13000
     * @tc.name      : TestCase_TypeValueInteractionHand
     * @tc.desc      : value-level InteractionHand: None/Left/Right pairwise distinct; == reflexive per variant
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_TypeValueInteractionHand(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_TypeValueInteractionHand begins.")
        @Expect(InteractionHand.None != InteractionHand.Left, true)
        @Expect(InteractionHand.None != InteractionHand.Right, true)
        @Expect(InteractionHand.Left != InteractionHand.Right, true)
        @Expect(InteractionHand.None == InteractionHand.Left, false)
        @Expect(InteractionHand.Left == InteractionHand.Left, true)
        @Expect(InteractionHand.Right == InteractionHand.Right, true)
    }
}
