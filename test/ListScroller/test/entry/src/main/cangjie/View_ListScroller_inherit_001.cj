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
 * ListScroller 继承 Scroller：绑定 List，直接调用继承方法 scrollTo
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ListScroller_inherit_001 {
    var ls: ListScroller = ListScroller()

    func build() {
        Column(space: 8) {
            List(scroller: this.ls) {
                ListItem() {
                    Text("inherit_top").width(100.percent).height(100).backgroundColor(0x668866).id("inherit_top")
                }
                ListItem() {
                    Text("inherit_bottom").width(100.percent).height(100).backgroundColor(0x00ff00).id("inherit_bottom")
                }
                ListItem() {
                    Text("inherit_extra").width(100.percent).height(100).backgroundColor(0x0000ff).id("inherit_extra")
                }
            }.cachedCount(3).width(300).height(200).backgroundColor(0xAFEEEE).id("inherit_scroll_001")
            Button("ListScroller 调用继承 scrollTo(0, 200)").fontSize(10).id("btn_inherit_001").onClick({ evt =>
                this.ls.scrollTo(xOffset: 0.vp, yOffset: 200.vp)
            })
        }.width(100.percent)
    }
}
