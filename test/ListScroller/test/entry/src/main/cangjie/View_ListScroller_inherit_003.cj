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
 * Scroller open 继承：框架子类 ListScroller 调用从 Scroller 继承的 scrollTo
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ListScroller_inherit_003 {
    var ls: ListScroller = ListScroller()

    func build() {
        Column(space: 8) {
            List(scroller: this.ls) {
                ListItem() { Text("item0").width(100.percent).height(80).backgroundColor(0xF5DEB3).id("inherit3_item0") }
                ListItem() { Text("item1").width(100.percent).height(80).backgroundColor(0xD2B48C).id("inherit3_item1") }
                ListItem() { Text("item2").width(100.percent).height(80).backgroundColor(0xF5DEB3).id("inherit3_item2") }
                ListItem() { Text("item3").width(100.percent).height(80).backgroundColor(0xD2B48C).id("inherit3_item3") }
                ListItem() { Text("item4").width(100.percent).height(80).backgroundColor(0xF5DEB3).id("inherit3_item4") }
                ListItem() { Text("item5").width(100.percent).height(80).backgroundColor(0xD2B48C).id("inherit3_item5") }
            }.cachedCount(6).width(300).height(300).backgroundColor(0xAFEEEE).id("inherit3_list")
            Button("ListScroller 调用继承 scrollTo(0, 400)").fontSize(10).id("btn_inherit_003").onClick({ evt =>
                this.ls.scrollTo(xOffset: 0.vp, yOffset: 400.vp)
            })
        }.width(100.percent)
    }
}
