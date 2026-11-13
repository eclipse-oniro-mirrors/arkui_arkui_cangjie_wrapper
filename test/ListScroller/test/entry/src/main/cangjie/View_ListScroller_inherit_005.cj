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
 * ListScroller 继承 Scroller：调用继承方法 scrollToIndex
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ListScroller_inherit_005 {
    var ls: ListScroller = ListScroller()

    func build() {
        Column(space: 8) {
            List(scroller: this.ls) {
                ListItem() { Text("i0").width(100.percent).height(100).backgroundColor(0x668866).id("inherit5_i0") }
                ListItem() { Text("i1").width(100.percent).height(100).backgroundColor(0x00ff00) }
                ListItem() { Text("i2").width(100.percent).height(100).backgroundColor(0xff0000).id("inherit5_item2") }
                ListItem() { Text("i3").width(100.percent).height(100).backgroundColor(0x6688aa) }
                ListItem() { Text("i4").width(100.percent).height(100).backgroundColor(0x8866aa) }
                ListItem() { Text("i5").width(100.percent).height(100).backgroundColor(0xaa6688) }
            }.cachedCount(6).width(300).height(400).backgroundColor(0xAFEEEE).id("inherit5_list")
            Button("scrollToIndex(2)").fontSize(10).id("btn_s2i").onClick({ evt =>
                this.ls.scrollToIndex(2)
            })
        }.width(100.percent)
    }
}
