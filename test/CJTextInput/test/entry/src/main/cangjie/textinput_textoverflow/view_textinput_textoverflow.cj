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

package ohos_app_cangjie_entry.textinput_textoverflow

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/* ═══════════════════════════════════════════════════
 * 接口 TextInput.textOverflow — BC 基准值: 非编辑态 + style(Inline) + value=Ellipsis
 * ═══════════════════════════════════════════════════ */

/**
 * View_1: TC0 BC 基准·全基准值 textOverflow(Ellipsis) (TestTextInput_textOverflow_001)
 */
@Component
public class View_TextInput_textOverflow_1 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .style(TextInputStyle.Inline)
            .textOverflow(TextOverflow.Ellipsis)
            .width(200)
            .height(50)
    }
}

/**
 * View_2: TC1 BC·变化 value=Clip (TestTextInput_textOverflow_002)
 */
@Component
public class View_TextInput_textOverflow_2 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .style(TextInputStyle.Inline)
            .textOverflow(TextOverflow.Clip)
            .width(200)
            .height(50)
    }
}

/**
 * View_3: TC2 BC·变化 value=None 等效 Clip (TestTextInput_textOverflow_003)
 */
@Component
public class View_TextInput_textOverflow_3 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .style(TextInputStyle.Inline)
            .textOverflow(TextOverflow.None)
            .width(200)
            .height(50)
    }
}

/**
 * View_4: TC3 BC·None Reset textOverflow(Option.None) (TestTextInput_textOverflow_004)
 */
@Component
public class View_TextInput_textOverflow_4 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .style(TextInputStyle.Inline)
            .textOverflow(Option<TextOverflow>.None)
            .width(200)
            .height(50)
    }
}

/**
 * View_5: TC4 BC·默认值 不调用 textOverflow (TestTextInput_textOverflow_005)
 */
@Component
public class View_TextInput_textOverflow_5 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .style(TextInputStyle.Inline)
            .width(200)
            .height(50)
    }
}
