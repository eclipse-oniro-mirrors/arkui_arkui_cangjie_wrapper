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
 * ListItemGroupArea Equatable
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
class ListItemGroupAreaEquatableTest {
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListItemGroupAreaEquatableEqual() {
        @Expect(ListItemGroupArea.None == ListItemGroupArea.None, true)
        @Expect(ListItemGroupArea.None == ListItemGroupArea.InListItemArea, false)
        @Expect(ListItemGroupArea.None == ListItemGroupArea.InHeaderArea, false)
        @Expect(ListItemGroupArea.None == ListItemGroupArea.InFooterArea, false)
        @Expect(ListItemGroupArea.InListItemArea == ListItemGroupArea.None, false)
        @Expect(ListItemGroupArea.InListItemArea == ListItemGroupArea.InListItemArea, true)
        @Expect(ListItemGroupArea.InListItemArea == ListItemGroupArea.InHeaderArea, false)
        @Expect(ListItemGroupArea.InListItemArea == ListItemGroupArea.InFooterArea, false)
        @Expect(ListItemGroupArea.InHeaderArea == ListItemGroupArea.None, false)
        @Expect(ListItemGroupArea.InHeaderArea == ListItemGroupArea.InListItemArea, false)
        @Expect(ListItemGroupArea.InHeaderArea == ListItemGroupArea.InHeaderArea, true)
        @Expect(ListItemGroupArea.InHeaderArea == ListItemGroupArea.InFooterArea, false)
        @Expect(ListItemGroupArea.InFooterArea == ListItemGroupArea.None, false)
        @Expect(ListItemGroupArea.InFooterArea == ListItemGroupArea.InListItemArea, false)
        @Expect(ListItemGroupArea.InFooterArea == ListItemGroupArea.InHeaderArea, false)
        @Expect(ListItemGroupArea.InFooterArea == ListItemGroupArea.InFooterArea, true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListItemGroupAreaEquatableNotEqual() {
        @Expect(ListItemGroupArea.None != ListItemGroupArea.None, false)
        @Expect(ListItemGroupArea.None != ListItemGroupArea.InListItemArea, true)
        @Expect(ListItemGroupArea.None != ListItemGroupArea.InHeaderArea, true)
        @Expect(ListItemGroupArea.None != ListItemGroupArea.InFooterArea, true)
        @Expect(ListItemGroupArea.InListItemArea != ListItemGroupArea.None, true)
        @Expect(ListItemGroupArea.InListItemArea != ListItemGroupArea.InListItemArea, false)
        @Expect(ListItemGroupArea.InListItemArea != ListItemGroupArea.InHeaderArea, true)
        @Expect(ListItemGroupArea.InListItemArea != ListItemGroupArea.InFooterArea, true)
        @Expect(ListItemGroupArea.InHeaderArea != ListItemGroupArea.None, true)
        @Expect(ListItemGroupArea.InHeaderArea != ListItemGroupArea.InListItemArea, true)
        @Expect(ListItemGroupArea.InHeaderArea != ListItemGroupArea.InHeaderArea, false)
        @Expect(ListItemGroupArea.InHeaderArea != ListItemGroupArea.InFooterArea, true)
        @Expect(ListItemGroupArea.InFooterArea != ListItemGroupArea.None, true)
        @Expect(ListItemGroupArea.InFooterArea != ListItemGroupArea.InListItemArea, true)
        @Expect(ListItemGroupArea.InFooterArea != ListItemGroupArea.InHeaderArea, true)
        @Expect(ListItemGroupArea.InFooterArea != ListItemGroupArea.InFooterArea, false)
    }
}
