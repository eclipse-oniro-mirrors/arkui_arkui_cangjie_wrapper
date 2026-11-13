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
 * 新增接口测试页：Radio.radioStyle + RadioIndicatorType
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Component
public class View_Radio_radioStyle_010 {
    func build() {
        Column(space: 10) {
            Radio(value: "r12", group: "styleGroup")
            .radioStyle(uncheckedBorderColor: Color(0x00000000))
            .size(width: 40.vp, height: 40.vp)
            .id("radio_style")
        }.margin(top: 20, left: 20)
    }
}
