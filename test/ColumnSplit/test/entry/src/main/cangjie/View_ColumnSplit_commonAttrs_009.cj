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
 * ColumnSplit 继承 CommonMethodComponent：卸载事件 onDisAppear（visibility(None) 触发）
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ColumnSplit_commonAttrs_009 {
    @State
    var cs9Visible: Bool = true
    @State
    var disResult: String = "not-disappeared"

    func build() {
        Column(space: 10) {
            Text(this.disResult).id("cs9_dis_result").fontSize(12)
            ColumnSplit() {
                Text("area1").size(width: 100.percent, height: 100.px).backgroundColor(0xF5DEB3).id("cs9_1")
                Text("area2").size(width: 100.percent, height: 100.px).backgroundColor(0xD2B48C).id("cs9_2")
            }
            .width(300.px)
            .height(200.px)
            .backgroundColor(0xAFEEEE)
            .id("cs9_common")
            .visibility(if (this.cs9Visible) { Visibility.Visible } else { Visibility.None })
            .onDisAppear({ => this.disResult = "disappeared;" })
            Button("隐藏组件").fontSize(10).id("btn_hide").onClick({ evt =>
                this.cs9Visible = false
            })
        }.margin(top: 10, left: 10)
    }
}
