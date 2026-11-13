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
 * 新增接口测试页：ListScroller
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
internal import ohos.business_exception.BusinessException

@Component
public class View_ListScroller_getItemRectInGroup_003 {
    var ls: ListScroller = ListScroller()
    @State
    var girResult: String = ""

    func trunc1(v: ?Float64): String {
        let f = v ?? -1.0
        let scaled = f * 10.0
        var t = if (scaled >= 0.0) { Int64(scaled + 0.000000001) } else { Int64(scaled - 0.000000001) }
        let neg = t < 0
        if (neg) { t = -t }
        return if (neg) { "-${t / 10}.${t % 10}" } else { "${t / 10}.${t % 10}" }
    }

    func runGirScenario() {
        var out = ""
        try {
            let rect = this.ls.getItemRectInGroup(0, 9)
            out = "rect.x: ${trunc1(rect.x)}, rect.y: ${trunc1(rect.y)}, rect.width: ${trunc1(rect.width)}, rect.height: ${trunc1(rect.height)};"
        } catch (e: BusinessException) {
            out = "code: ${e.code}, meesage: ${e};"
        }
        this.girResult = out
    }

    func build() {
        Column(space: 8) {
            List(space: 5, scroller: this.ls) {
                ListItemGroup(space: 5) {
                    ListItem() { Text("g0i0").width(100.percent).height(80.px).backgroundColor(0xF5DEB3).id("g0i0") }
                    ListItem() { Text("g0i1").width(100.percent).height(80.px).backgroundColor(0xD2B48C) }
                    ListItem() { Text("g0i2").width(100.percent).height(80.px).backgroundColor(0xF5DEB3) }
                }
                ListItemGroup(space: 5) {
                    ListItem() { Text("g1i0").width(100.percent).height(80.px).backgroundColor(0xD2B48C).id("g1i0") }
                    ListItem() { Text("g1i1").width(100.percent).height(80.px).backgroundColor(0xF5DEB3) }
                    ListItem() { Text("g1i2").width(100.percent).height(80.px).backgroundColor(0xD2B48C).id("g1i2") }
                }
            }.width(300.px).height(300.px).backgroundColor(0xAFEEEE).id("list_scroller_main")

            Text(this.girResult).id("gir_result").fontSize(9)
            Button("getItemRectInGroup(0, 9)").fontSize(10).id("btn_gir").onClick({ evt => this.runGirScenario() })
        }.width(100.percent)
    }

}
