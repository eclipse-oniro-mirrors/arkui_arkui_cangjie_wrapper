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
 * ColumnSplit 继承 CommonMethodComponent：可见率变化 onVisibleAreaChange（内嵌 Scroll 正向滚动触发）
 * 回显 Text 置于 Scroll 外（UiTest 只能查询在屏组件，采样目标不得随内容滚出）
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ColumnSplit_commonAttrs_023 {
    @State
    var visResult: String = "not-fired"

    func build() {
        Column(space: 10) {
            Text(this.visResult).id("cs23_vis_result").fontSize(12)
            Scroll() {
                Column(space: 10) {
                    ColumnSplit() {
                        Text("target").size(width: 100.percent, height: 200.px).backgroundColor(0xF5DEB3).id("cs23_1")
                    }
                    .width(300.px)
                    .height(200.px)
                    .backgroundColor(0xAFEEEE)
                    .id("cs23_common")
                    .onVisibleAreaChange([0.5], { isTrigger, rate => this.visResult = "fired;" })
                    Text("").width(100.percent).height(2000.px).backgroundColor(0xEEEEEE).id("cs23_fill")
                }
                .width(100.percent)
            }
            .width(100.percent)
            .height(300)
            .backgroundColor(0xDDDDDD)
        }.margin(top: 10, left: 10)
    }
}
