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
 * 新增接口测试页：Flex 带 space 参数构造 + FlexSpaceOptions
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_Flex_init_016 {
    func build() {
        Column(space: 10) {
            Flex(direction: FlexDirection.Row, wrap: FlexWrap.Wrap,
            space: FlexSpaceOptions(crossSpacing: LengthMetrics(1000000000.0, unit: LengthUnit.Px))) {
                Text("A").size(width: 200.px, height: 50.px).backgroundColor(0xF5DEB3).id("fscv_1")
                Text("B").size(width: 200.px, height: 50.px).backgroundColor(0xD2B48C).id("fscv_2")
            }.width(320.px).height(60.px).backgroundColor(0xAFEEEE).id("flex_space_cross_huge")
        }.margin(top: 10, left: 10)
    }
}
