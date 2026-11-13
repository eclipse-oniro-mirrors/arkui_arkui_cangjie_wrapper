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
public class View_ListScroller_closeAllSwipeActions_001 {
    var ls: ListScroller = ListScroller()
    @State
    var csaResult: String = ""
    @State
    var csaCbResult: String = ""

    func runCsaScenario() {
        this.ls.closeAllSwipeActions(onFinish: { => this.csaCbResult = "cb-fired;" })
        this.csaResult = "called;"
    }

    @Builder
    func CsaDelBuilder() {
        Row() {
            Text("删除").fontSize(16).fontColor(Color.White)
        }
        .width(60.px).height(80.px).backgroundColor(0xE53935)
        .justifyContent(FlexAlign.Center)
    }

    func build() {
        Column(space: 8) {
            Text(this.csaResult).id("csa_result").fontSize(9)
            Text(this.csaCbResult).id("csa_cb_result").fontSize(9)
            List(space: 5, scroller: this.ls) {
                ListItem() {
                    Text("csa_item").width(100.percent).height(80.px).backgroundColor(0xFF0000).id("csa_item")
                }.swipeAction(end: bind(this.CsaDelBuilder, this))
            }.width(200.px).height(400.px).backgroundColor(0xAFEEEE).id("csa_list")
            Button("收拢全部+onFinish 回调").fontSize(10).id("btn_csa").onClick({ evt => this.runCsaScenario() })
        }.width(100.percent)
    }

}
