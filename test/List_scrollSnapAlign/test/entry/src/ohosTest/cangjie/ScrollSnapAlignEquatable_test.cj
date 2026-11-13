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

/**
 * ScrollSnapAlign Equatable
 */
package ohos_app_cangjie_entry_test

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.Hilog

@Test
class ScrollSnapAlignEquatableTest {
    // ===== Equatable =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignEquatableEqual() {
        @Expect(ScrollSnapAlign.None == ScrollSnapAlign.None, true)
        @Expect(ScrollSnapAlign.None == ScrollSnapAlign.Start, false)
        @Expect(ScrollSnapAlign.None == ScrollSnapAlign.Center, false)
        @Expect(ScrollSnapAlign.None == ScrollSnapAlign.End, false)
        @Expect(ScrollSnapAlign.Start == ScrollSnapAlign.None, false)
        @Expect(ScrollSnapAlign.Start == ScrollSnapAlign.Start, true)
        @Expect(ScrollSnapAlign.Start == ScrollSnapAlign.Center, false)
        @Expect(ScrollSnapAlign.Start == ScrollSnapAlign.End, false)
        @Expect(ScrollSnapAlign.Center == ScrollSnapAlign.None, false)
        @Expect(ScrollSnapAlign.Center == ScrollSnapAlign.Start, false)
        @Expect(ScrollSnapAlign.Center == ScrollSnapAlign.Center, true)
        @Expect(ScrollSnapAlign.Center == ScrollSnapAlign.End, false)
        @Expect(ScrollSnapAlign.End == ScrollSnapAlign.None, false)
        @Expect(ScrollSnapAlign.End == ScrollSnapAlign.Start, false)
        @Expect(ScrollSnapAlign.End == ScrollSnapAlign.Center, false)
        @Expect(ScrollSnapAlign.End == ScrollSnapAlign.End, true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignEquatableNotEqual() {
        @Expect(ScrollSnapAlign.None != ScrollSnapAlign.None, false)
        @Expect(ScrollSnapAlign.None != ScrollSnapAlign.Start, true)
        @Expect(ScrollSnapAlign.None != ScrollSnapAlign.Center, true)
        @Expect(ScrollSnapAlign.None != ScrollSnapAlign.End, true)
        @Expect(ScrollSnapAlign.Start != ScrollSnapAlign.None, true)
        @Expect(ScrollSnapAlign.Start != ScrollSnapAlign.Start, false)
        @Expect(ScrollSnapAlign.Start != ScrollSnapAlign.Center, true)
        @Expect(ScrollSnapAlign.Start != ScrollSnapAlign.End, true)
        @Expect(ScrollSnapAlign.Center != ScrollSnapAlign.None, true)
        @Expect(ScrollSnapAlign.Center != ScrollSnapAlign.Start, true)
        @Expect(ScrollSnapAlign.Center != ScrollSnapAlign.Center, false)
        @Expect(ScrollSnapAlign.Center != ScrollSnapAlign.End, true)
        @Expect(ScrollSnapAlign.End != ScrollSnapAlign.None, true)
        @Expect(ScrollSnapAlign.End != ScrollSnapAlign.Start, true)
        @Expect(ScrollSnapAlign.End != ScrollSnapAlign.Center, true)
        @Expect(ScrollSnapAlign.End != ScrollSnapAlign.End, false)
    }
}
