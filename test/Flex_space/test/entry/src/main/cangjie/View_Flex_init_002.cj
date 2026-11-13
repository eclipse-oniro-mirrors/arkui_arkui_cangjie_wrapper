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
public class View_Flex_init_002 {
    func build() {
        Column(space: 10) {
            Flex(direction: FlexDirection.Row, space: Option<FlexSpaceOptions>.None) {
                Text("A").size(width: 50.vp, height: 50.vp).backgroundColor(0xF5DEB3).id("fsn_1")
                Text("B").size(width: 50.vp, height: 50.vp).backgroundColor(0xD2B48C).id("fsn_2")
            }.width(320.px).backgroundColor(0xAFEEEE).id("flex_space_none")
        }.margin(top: 10, left: 10)
    }
}
