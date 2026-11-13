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
public class View_ListScroller_scrollToItemInGroup_002 {
    var ls: ListScroller = ListScroller()
    @State
    var stiResult: String = ""

    func runStiScenario() {
        var out = ""
        try {
            this.ls.scrollToItemInGroup(0, -1, smooth: Option<Bool>.None, align: Option<ScrollAlign>.None)
            out = "ok;"
        } catch (e: BusinessException) {
            out = "code: ${e.code}, meesage: ${e};"
        }
        this.stiResult = out
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

            Text(this.stiResult).id("sti_result").fontSize(9)
            Button("scrollToItemInGroup(0, -1, smooth: Option<Bool>.None, align: Option<ScrollAlign>.None)").fontSize(10).id("btn_sti").onClick({ evt => this.runStiScenario() })
        }.width(100.percent)
    }

}
