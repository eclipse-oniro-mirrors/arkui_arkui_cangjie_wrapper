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
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_Scroll_edgeEffect_014 {
    func build() {
        Column(space: 10) {
            Scroll() {
                Column() {
                    Text("s").width(100.percent).height(300.px).backgroundColor(0x668866).id("scroll_e_i0")
                    Text("s").width(100.percent).height(300.px).backgroundColor(0x00ff00).id("scroll_e_i1")
                }
            }.width(300.px).height(200.px).edgeEffect(EdgeEffect.Spring, options: EdgeEffectOptions(false, effectEdge: -1)).id("scroll_e")
        }.margin(top: 10, left: 10)
    }
}
