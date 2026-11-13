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
 * ColumnSplit 继承 CommonMethodComponent：responseRegion 触摸区域限定（对照 + 限定）
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ColumnSplit_commonAttrs_019 {
    @State
    var limitedResult: String = "no-click"
    @State
    var normalResult: String = "no-click"

    func build() {
        Column(space: 10) {
            Text("limited: " + this.limitedResult).id("cs19_limited_result").fontSize(12)
            Text("normal: " + this.normalResult).id("cs19_normal_result").fontSize(12)
            ColumnSplit() {
                Text("limited").size(width: 100.percent, height: 100.px).backgroundColor(0xF5DEB3).id("cs19_1")
            }
            .width(300.px)
            .height(200.px)
            .backgroundColor(0xAFEEEE)
            .responseRegion(Rectangle(x: 0, y: 0, width: 300.px, height: 60.px))
            .id("cs19_limited")
            .onClick({ evt => this.limitedResult = "clicked" })
            ColumnSplit() {
                Text("normal").size(width: 100.percent, height: 100.px).backgroundColor(0xD2B48C).id("cs19_2")
            }
            .width(300.px)
            .height(200.px)
            .backgroundColor(0xAFEEEE)
            .id("cs19_normal")
            .onClick({ evt => this.normalResult = "clicked" })
        }.margin(top: 10, left: 10)
    }
}
