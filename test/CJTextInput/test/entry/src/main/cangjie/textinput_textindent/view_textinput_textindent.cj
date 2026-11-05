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

package ohos_app_cangjie_entry.textinput_textindent

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/* ═══════════════════════════════════════════════════
 * 接口4 TextInput.textIndent — BC 基准值: 10.vp
 * ═══════════════════════════════════════════════════ */

/**
 * View_1: BC 基准·全基准值 textIndent(10.vp) (TestTextInput_textIndent_001)
 */
@Component
public class View_TextInput_textIndent_1 {
    func build() {
        TextInput(text: "indent 10vp")
            .id("TextInput_comattr_id")
            .textIndent(10.vp)
            .width(200)
            .height(50)
    }
}

/**
 * View_2: BC·变化 value 边界 0.vp (TestTextInput_textIndent_002)
 */
@Component
public class View_TextInput_textIndent_2 {
    func build() {
        TextInput(text: "indent 0vp")
            .id("TextInput_comattr_id")
            .textIndent(0.vp)
            .width(200)
            .height(50)
    }
}

/**
 * View_3: BC·变化 value 边界 Float64.Max.vp (TestTextInput_textIndent_003)
 */
@Component
public class View_TextInput_textIndent_3 {
    func build() {
        TextInput(text: "indent max")
            .id("TextInput_comattr_id")
            .textIndent(Float64.Max.vp)
            .width(200)
            .height(50)
    }
}

/**
 * View_4: BC·变化 value 无效 Float64.Min.vp (TestTextInput_textIndent_004)
 */
@Component
public class View_TextInput_textIndent_4 {
    func build() {
        TextInput(text: "indent min")
            .id("TextInput_comattr_id")
            .textIndent(Float64.Min.vp)
            .width(200)
            .height(50)
    }
}

/**
 * View_5: BC·变化 value 无效负值 (-5).vp (TestTextInput_textIndent_005)
 */
@Component
public class View_TextInput_textIndent_5 {
    func build() {
        TextInput(text: "indent negative")
            .id("TextInput_comattr_id")
            .textIndent((-5).vp)
            .width(200)
            .height(50)
    }
}

/**
 * View_6: BC·变化 value 百分比 50.percent (TestTextInput_textIndent_006)
 */
@Component
public class View_TextInput_textIndent_6 {
    func build() {
        TextInput(text: "indent percent")
            .id("TextInput_comattr_id")
            .textIndent(50.percent)
            .width(200)
            .height(50)
    }
}

/**
 * View_7: BC·默认值 Option<Length>.None (TestTextInput_textIndent_007)
 */
@Component
public class View_TextInput_textIndent_7 {
    func build() {
        TextInput(text: "indent reset")
            .id("TextInput_comattr_id")
            .textIndent(Option<Length>.None)
            .width(200)
            .height(50)
    }
}

/**
 * View_8: BC·默认值 不调用 textIndent（系统默认 0，inspector 输出 textIndent 字段） (TestTextInput_textIndent_008)
 */
@Component
public class View_TextInput_textIndent_8 {
    func build() {
        TextInput(text: "no indent")
            .id("TextInput_comattr_id")
            .width(200)
            .height(50)
    }
}
