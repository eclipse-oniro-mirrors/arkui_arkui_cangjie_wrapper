/*
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

package ohos_app_cangjie_entry_test

import std.unittest.*
import std.unittest.testmacro.*
import ohos.arkui.component.*

@Test
class Radio_indicatorTypeTest {
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioIndicatorTypeEquatableEqual() {
        // 全成员有序对穷举：N×N 含反向预期
        @Expect(RadioIndicatorType.Tick == RadioIndicatorType.Tick, true)
        @Expect(RadioIndicatorType.Tick == RadioIndicatorType.Dot, false)
        @Expect(RadioIndicatorType.Tick == RadioIndicatorType.Custom, false)
        @Expect(RadioIndicatorType.Dot == RadioIndicatorType.Tick, false)
        @Expect(RadioIndicatorType.Dot == RadioIndicatorType.Dot, true)
        @Expect(RadioIndicatorType.Dot == RadioIndicatorType.Custom, false)
        @Expect(RadioIndicatorType.Custom == RadioIndicatorType.Tick, false)
        @Expect(RadioIndicatorType.Custom == RadioIndicatorType.Dot, false)
        @Expect(RadioIndicatorType.Custom == RadioIndicatorType.Custom, true)
    }

    // testRadioIndicatorTypeEquatableNotEqual：异值 !=
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioIndicatorTypeEquatableNotEqual() {
        @Expect(RadioIndicatorType.Tick != RadioIndicatorType.Tick, false)
        @Expect(RadioIndicatorType.Tick != RadioIndicatorType.Dot, true)
        @Expect(RadioIndicatorType.Tick != RadioIndicatorType.Custom, true)
        @Expect(RadioIndicatorType.Dot != RadioIndicatorType.Tick, true)
        @Expect(RadioIndicatorType.Dot != RadioIndicatorType.Dot, false)
        @Expect(RadioIndicatorType.Dot != RadioIndicatorType.Custom, true)
        @Expect(RadioIndicatorType.Custom != RadioIndicatorType.Tick, true)
        @Expect(RadioIndicatorType.Custom != RadioIndicatorType.Dot, true)
        @Expect(RadioIndicatorType.Custom != RadioIndicatorType.Custom, false)
    }
}
