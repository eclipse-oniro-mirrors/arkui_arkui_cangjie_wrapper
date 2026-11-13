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
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

/**
 * RelativeContainer.localizedBarrier 测试
 */
@Component
public class View_RelativeContainer_barrier_001 {
    func build() {
        Column(space: 10) {
            Text("End barrier (LTR)").fontSize(14)
            RelativeContainer() {
                    Text("A").size(width: 100.px, height: 100.px).backgroundColor(0xF5DEB3).id("lbe_a")
                    Text("B").size(width: 80.px, height: 80.px).backgroundColor(0xD2B48C)
                        .alignRules(AlignRuleOption(
                            left: HorizontalAlignParam("lbe_a", HorizontalAlign.End),
                            top: VerticalAlignParam("lbe_a", VerticalAlign.Top)
                        )).id("lbe_b")
                    Text("C").size(width: 50.px, height: 50.px).backgroundColor(0xFF0000)
                        .alignRules(AlignRuleOption(
                            left: HorizontalAlignParam("lbe_bar", HorizontalAlign.Start)
                        )).id("lbe_c")
                }
                .barrier([LocalizedBarrierStyle("lbe_bar", LocalizedBarrierDirection.End, ["lbe_a", "lbe_b"])])
                .width(400.px).height(200.px).backgroundColor(0xAFEEEE).id("rc_lbe")
        }.margin(top: 20, left: 20)
    }
}
