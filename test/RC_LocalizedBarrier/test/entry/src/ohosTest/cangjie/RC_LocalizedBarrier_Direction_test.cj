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
class RC_LocalizedBarrierDirectionTest {
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierDirectionEquatable() {
        // == 全成员有序对穷举
        @Expect(LocalizedBarrierDirection.Start == LocalizedBarrierDirection.Start, true)
        @Expect(LocalizedBarrierDirection.Start == LocalizedBarrierDirection.End, false)
        @Expect(LocalizedBarrierDirection.Start == LocalizedBarrierDirection.Top, false)
        @Expect(LocalizedBarrierDirection.Start == LocalizedBarrierDirection.Bottom, false)
        @Expect(LocalizedBarrierDirection.End == LocalizedBarrierDirection.Start, false)
        @Expect(LocalizedBarrierDirection.End == LocalizedBarrierDirection.End, true)
        @Expect(LocalizedBarrierDirection.End == LocalizedBarrierDirection.Top, false)
        @Expect(LocalizedBarrierDirection.End == LocalizedBarrierDirection.Bottom, false)
        @Expect(LocalizedBarrierDirection.Top == LocalizedBarrierDirection.Start, false)
        @Expect(LocalizedBarrierDirection.Top == LocalizedBarrierDirection.End, false)
        @Expect(LocalizedBarrierDirection.Top == LocalizedBarrierDirection.Top, true)
        @Expect(LocalizedBarrierDirection.Top == LocalizedBarrierDirection.Bottom, false)
        @Expect(LocalizedBarrierDirection.Bottom == LocalizedBarrierDirection.Start, false)
        @Expect(LocalizedBarrierDirection.Bottom == LocalizedBarrierDirection.End, false)
        @Expect(LocalizedBarrierDirection.Bottom == LocalizedBarrierDirection.Top, false)
        @Expect(LocalizedBarrierDirection.Bottom == LocalizedBarrierDirection.Bottom, true)

        // != 全成员有序对穷举（含同值反向预期）
        @Expect(LocalizedBarrierDirection.Start != LocalizedBarrierDirection.Start, false)
        @Expect(LocalizedBarrierDirection.Start != LocalizedBarrierDirection.End, true)
        @Expect(LocalizedBarrierDirection.Start != LocalizedBarrierDirection.Top, true)
        @Expect(LocalizedBarrierDirection.Start != LocalizedBarrierDirection.Bottom, true)
        @Expect(LocalizedBarrierDirection.End != LocalizedBarrierDirection.Start, true)
        @Expect(LocalizedBarrierDirection.End != LocalizedBarrierDirection.End, false)
        @Expect(LocalizedBarrierDirection.End != LocalizedBarrierDirection.Top, true)
        @Expect(LocalizedBarrierDirection.End != LocalizedBarrierDirection.Bottom, true)
        @Expect(LocalizedBarrierDirection.Top != LocalizedBarrierDirection.Start, true)
        @Expect(LocalizedBarrierDirection.Top != LocalizedBarrierDirection.End, true)
        @Expect(LocalizedBarrierDirection.Top != LocalizedBarrierDirection.Top, false)
        @Expect(LocalizedBarrierDirection.Top != LocalizedBarrierDirection.Bottom, true)
        @Expect(LocalizedBarrierDirection.Bottom != LocalizedBarrierDirection.Start, true)
        @Expect(LocalizedBarrierDirection.Bottom != LocalizedBarrierDirection.End, true)
        @Expect(LocalizedBarrierDirection.Bottom != LocalizedBarrierDirection.Top, true)
        @Expect(LocalizedBarrierDirection.Bottom != LocalizedBarrierDirection.Bottom, false)
    }
}
