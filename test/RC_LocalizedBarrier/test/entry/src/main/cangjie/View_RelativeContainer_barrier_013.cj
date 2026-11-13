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
public class View_RelativeContainer_barrier_013 {
    func build() {
        Column(space: 10) {
            Text("End barrier id duplicates component id").fontSize(14)
            RelativeContainer() {
                    Text("A").size(width: 100.px, height: 100.px).backgroundColor(0xF5DEB3).id("lbd_a")
                    Text("C").size(width: 50.px, height: 50.px).backgroundColor(0xFF0000)
                        .alignRules(AlignRuleOption(
                            left: HorizontalAlignParam("lbd_a", HorizontalAlign.Start)
                        )).id("lbd_c")
                }
                .barrier([LocalizedBarrierStyle("lbd_a", LocalizedBarrierDirection.End, ["lbd_a"])])
                .width(400.px).height(150.px).backgroundColor(0xAFEEEE).id("rc_lbd")
        }.margin(top: 20, left: 20)
    }
}
