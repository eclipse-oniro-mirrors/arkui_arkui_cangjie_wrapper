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
 * Scroller open 继承：自定义子类组合调用继承方法 scrollEdge/scrollBy/scrollPage
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ListScroller_inherit_002 {
    var ls: ListScroller = ListScroller()
    @State
    var stepResult: String = "ready"

    func build() {
        Column(space: 8) {
            Text(this.stepResult).id("inherit_result_002").fontSize(9)
            List(scroller: this.ls) {
                ListItem() {
                    Text("top").width(100.percent).height(100).backgroundColor(0x668866).id("inherit2_top")
                }
                ListItem() {
                    Text("mid").width(100.percent).height(100).backgroundColor(0x00ff00).id("inherit2_mid")
                }
                ListItem() {
                    Text("bottom").width(100.percent).height(100).backgroundColor(0xff0000).id("inherit2_bottom")
                }
                ListItem() {
                    Text("item4").width(100.percent).height(100).backgroundColor(0x6688aa).id("inherit2_item4")
                }
                ListItem() {
                    Text("item5").width(100.percent).height(100).backgroundColor(0x8866aa).id("inherit2_item5")
                }
                ListItem() {
                    Text("item6").width(100.percent).height(100).backgroundColor(0xaa6688).id("inherit2_item6")
                }
            }.cachedCount(6).width(300).height(400).backgroundColor(0xAFEEEE).id("inherit_scroll_002")
            Column(space: 2) {
                Button("scrollEdge(Bottom)").fontSize(10).id("btn_edge_bottom").onClick({ evt =>
                    this.ls.scrollEdge(Edge.Bottom)
                    this.stepResult = "edge-bottom-done;"
                })
                Button("scrollEdge(Top)").fontSize(10).id("btn_edge_top").onClick({ evt =>
                    this.ls.scrollEdge(Edge.Top)
                    this.stepResult = "edge-top-done;"
                })
                Button("scrollBy(0, 100)").fontSize(10).id("btn_by").onClick({ evt =>
                    this.ls.scrollBy(xOffset: 0.vp, yOffset: 100.vp)
                    this.stepResult = "by-done;"
                })
                Button("scrollPage(true)").fontSize(10).id("btn_page").onClick({ evt =>
                    this.ls.scrollPage(true)
                    this.stepResult = "page-done;"
                })
            }
        }.width(100.percent)
    }
}
