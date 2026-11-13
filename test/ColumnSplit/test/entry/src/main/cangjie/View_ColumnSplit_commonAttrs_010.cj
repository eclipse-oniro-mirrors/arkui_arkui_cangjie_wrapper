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
 * ColumnSplit 继承 CommonMethodComponent：布局变化事件 onAreaChange（初始布局触发）
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ColumnSplit_commonAttrs_010 {
    @State
    var areaResult: String = "no-change"

    func build() {
        Column(space: 10) {
            Text(this.areaResult).id("cs10_area_result").fontSize(12)
            ColumnSplit() {
                Text("area1").size(width: 100.percent, height: 100.px).backgroundColor(0xF5DEB3).id("cs10_1")
                Text("area2").size(width: 100.percent, height: 100.px).backgroundColor(0xD2B48C).id("cs10_2")
            }
            .width(300.px)
            .height(200.px)
            .backgroundColor(0xAFEEEE)
            .id("cs10_common")
            .onAreaChange({ oldArea, newArea => this.areaResult = "area-changed;" })
        }.margin(top: 10, left: 10)
    }
}
