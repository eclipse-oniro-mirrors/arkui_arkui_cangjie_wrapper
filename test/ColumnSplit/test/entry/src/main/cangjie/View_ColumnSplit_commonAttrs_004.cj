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
 * ColumnSplit 继承 CommonMethodComponent：通用属性 size + position + visibility(None)
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_ColumnSplit_commonAttrs_004 {
    func build() {
        Column(space: 10) {
            ColumnSplit() {
                Text("area1").size(width: 100.percent, height: 100.px).backgroundColor(0xF5DEB3).id("cs4_1")
                Text("area2").size(width: 100.percent, height: 100.px).backgroundColor(0xD2B48C).id("cs4_2")
            }
            .width(300.px)
            .height(200.px)
            .backgroundColor(0xAFEEEE)
            .position(x: 20, y: 30)
            .size(width: 250.px, height: 180.px)
            .id("cs4_common")
        }.margin(top: 10, left: 10)
    }
}
