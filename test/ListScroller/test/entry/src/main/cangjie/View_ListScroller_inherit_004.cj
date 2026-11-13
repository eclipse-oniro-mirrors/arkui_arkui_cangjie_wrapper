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
 * ListScroller 继承 Scroller：直接调用继承方法（补充：scrollTo+动画/fling/scrollEdge+选项/scrollBy/isAtEnd）
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ListScroller_inherit_004 {
    var ls: ListScroller = ListScroller()
    @State
    var opResult: String = "ready"
    @State
    var isAtEndResult: String = "N/A"
    @State
    var curOffsetResult: String = "N/A"

    func build() {
        Column(space: 8) {
            Text(this.opResult).id("inherit_result_004").fontSize(9)
            Text(this.isAtEndResult).id("isAtEnd_result").fontSize(9)
            Text(this.curOffsetResult).id("cur_offset_result").fontSize(9)
            List(scroller: this.ls) {
                ListItem() {
                    Text("top").width(100.percent).height(100).backgroundColor(0x668866).id("inherit4_top")
                }
                ListItem() {
                    Text("mid").width(100.percent).height(100).backgroundColor(0x00ff00).id("inherit4_mid")
                }
                ListItem() {
                    Text("bottom").width(100.percent).height(100).backgroundColor(0xff0000).id("inherit4_bottom")
                }
            }.cachedCount(3).width(300).height(200).backgroundColor(0xAFEEEE).id("inherit_scroll_004")
            Column(space: 2) {
                Button("scrollTo+Anim(500ms,Ease)").fontSize(10).id("btn_anim").onClick({ evt =>
                    this.ls.scrollTo(xOffset: 0.vp, yOffset: 200.vp,
                        animation: ScrollAnimationOptions(duration: 500.0, curve: Curve.Ease, canOverScroll: true))
                    this.opResult = "anim-done;"
                })
                Button("fling(1000)").fontSize(10).id("btn_fling_pos").onClick({ evt =>
                    this.ls.fling(1000.0)
                    this.opResult = "fling-pos;"
                })
                Button("fling(-3000)").fontSize(10).id("btn_fling_neg").onClick({ evt =>
                    this.ls.fling(-3000.0)
                    this.opResult = "fling-neg;"
                })
                Button("fling(0)").fontSize(10).id("btn_fling_zero").onClick({ evt =>
                    this.ls.fling(0.0)
                    this.opResult = "fling-zero;"
                })
                Button("scrollEdge(Top)+Opts(velocity:1000)").fontSize(10).id("btn_edge_opt").onClick({ evt =>
                    this.ls.scrollEdge(Edge.Top, ScrollEdgeOptions(velocity: 1000.0))
                    this.opResult = "edge-opt;"
                })
                Button("scrollBy(0, 50)").fontSize(10).id("btn_by_px").onClick({ evt =>
                    this.ls.scrollBy(xOffset: 0, yOffset: 50)
                    this.opResult = "by-px;"
                })
                Button("scrollEdge(Bottom)").fontSize(10).id("btn_bottom").onClick({ evt =>
                    this.ls.scrollEdge(Edge.Bottom)
                    this.opResult = "bottom;"
                })
                Button("查询 isAtEnd").fontSize(10).id("btn_isend").onClick({ evt =>
                    this.isAtEndResult = if (this.ls.isAtEnd()) { "isAtEnd:true" } else { "isAtEnd:false" }
                })
                Button("查询 currentOffset").fontSize(10).id("btn_cur_offset").onClick({ evt =>
                    let offset = this.ls.currentOffset()
                    this.curOffsetResult = if (offset.isSome()) { "yOffset: ${offset.getOrThrow().yOffset}" } else { "none" }
                })
            }.alignItems(HorizontalAlign.Start)
        }.width(100.percent)
    }
}
