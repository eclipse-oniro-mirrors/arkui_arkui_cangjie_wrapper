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

package ohos_app_cangjie_entry.textinput_halfleading

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/* ═══════════════════════════════════════════════════
 * 接口3 TextInput.halfLeading — BC 基准值: true
 * ═══════════════════════════════════════════════════ */

/**
 * View_1: BC 基准·全基准值 halfLeading(true) (TestTextInput_halfLeading_001)
 */
@Component
public class View_TextInput_halfLeading_1 {
    func build() {
        TextInput(text: "half leading true")
            .id("TextInput_comattr_id")
            .halfLeading(true)
            .width(200)
            .height(50)
    }
}

/**
 * View_2: BC·变化 value=false (TestTextInput_halfLeading_002)
 */
@Component
public class View_TextInput_halfLeading_2 {
    func build() {
        TextInput(text: "half leading false")
            .id("TextInput_comattr_id")
            .halfLeading(false)
            .width(200)
            .height(50)
    }
}

/**
 * View_3: BC·None Reset halfLeading(Option.None) (TestTextInput_halfLeading_003)
 */
@Component
public class View_TextInput_halfLeading_3 {
    func build() {
        TextInput(text: "half leading reset")
            .id("TextInput_comattr_id")
            .halfLeading(Option<Bool>.None)
            .width(200)
            .height(50)
    }
}

/**
 * View_4: BC·默认值 不调用 halfLeading (TestTextInput_halfLeading_004)
 */
@Component
public class View_TextInput_halfLeading_4 {
    func build() {
        TextInput(text: "half leading default")
            .id("TextInput_comattr_id")
            .width(200)
            .height(50)
    }
}
