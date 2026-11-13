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
 * ListScroller 继承 Scroller：调用继承方法 scrollTo（animation: ?Bool 三参重载）
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ListScroller_inherit_008 {
    var ls: ListScroller = ListScroller()

    func build() {
        Column(space: 8) {
            List(scroller: this.ls) {
                ListItem() { Text("top").width(100.percent).height(100).backgroundColor(0x668866).id("inherit8_top") }
                ListItem() { Text("mid").width(100.percent).height(100).backgroundColor(0x00ff00).id("inherit8_mid") }
                ListItem() { Text("bottom").width(100.percent).height(100).backgroundColor(0xff0000).id("inherit8_bottom") }
            }.cachedCount(3).width(300).height(200).backgroundColor(0xAFEEEE).id("inherit8_list")
            Button("scrollTo(0, 100, animation: true)").fontSize(10).id("btn_anim_bool").onClick({ evt =>
                this.ls.scrollTo(xOffset: 0.vp, yOffset: 100.vp, animation: Option<Bool>.Some(true))
            })
        }.width(100.percent)
    }
}
