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
// Test view for Column_comattr_hover_NoneValue - hoverEffect test page
package ohos_app_cangjie_entry.Column_comattr_hover_1

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

@Component
public class View_Column_comattr_hover_NoneValue {
    func build() {
        Column {
            Column {
                Text("test").fontSize(20.vp)
            }
                .id("Column_comattr_id")
                .width(80.percent)
                .height(200.vp)
                .backgroundColor(Color.Gray)
                .hoverEffect(Option<HoverEffect>.None)
        }.width(100.percent).height(100.percent)
    }
}
