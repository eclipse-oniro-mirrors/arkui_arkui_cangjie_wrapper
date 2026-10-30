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
// Test view for Column_comattr_hover_arkts_example - hoverEffect test page
package ohos_app_cangjie_entry.Column_comattr_hover_arkts

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

@Component
public class View_Column_comattr_hover_arkts_example {
    func build() {
        Column(space: 5.vp) {
            Column(space: 5.vp) {
                Text("Scale").fontSize(20.vp).fontColor(Color.Gray).width(90.percent)
                Column()
                    .width(80.percent)
                    .height(200.vp)
                    .backgroundColor(Color.Gray)
                    .hoverEffect(HoverEffect.Scale)
                    .id("Column_comattr_Scale_id")
                Text("Board").fontSize(20.vp).fontColor(Color.Gray).width(90.percent)
                Column()
                    .width(80.percent)
                    .height(200.vp)
                    .backgroundColor(Color.Yellow)
                    .hoverEffect(HoverEffect.Highlight)
                    .id("Column_comattr_Highlight_id")
            }
                .hoverEffect(HoverEffect.None)
                .width(100.percent)
                .height(100.percent)
                .id("Column_comattr_None_id")
        }.width(100.percent).height(100.percent)
    }
}
