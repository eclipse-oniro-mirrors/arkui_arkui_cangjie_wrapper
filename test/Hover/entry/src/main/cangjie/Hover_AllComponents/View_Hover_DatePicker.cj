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
// Test view for Hover_DatePicker - hoverEffect test page
package ohos_app_cangjie_entry.Hover_AllComponents

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.component.path_2d.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos.resource.__GenerateResource__
import std.time.*

@Component
public class View_Hover_DatePicker {
    func build() {
        Column {
            DatePicker(start: DateTime.of(year: 1971, month: Month.of(1), dayOfMonth: 1),
                end: DateTime.of(year: 2099, month: Month.of(5), dayOfMonth: 8))
                .id("DatePicker_comattr_id")
                .hoverEffect(HoverEffect.Scale)
        }.width(100.percent).height(100.percent)
    }
}
