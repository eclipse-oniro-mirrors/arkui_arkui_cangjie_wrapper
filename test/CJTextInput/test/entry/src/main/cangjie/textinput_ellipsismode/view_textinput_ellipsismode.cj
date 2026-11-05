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

package ohos_app_cangjie_entry.textinput_ellipsismode

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/* ═══════════════════════════════════════════════════
 * 接口2 TextInput.ellipsisMode — BC 基准值: End+maxLines(1)+overflow(Ellipsis)
 * ═══════════════════════════════════════════════════ */

/**
 * View_1: TC0 BC 基准·全基准值 ellipsisMode(End)+maxLines(1)+overflow(Ellipsis) (TestTextInput_ellipsisMode_001)
 */
@Component
public class View_TextInput_ellipsisMode_1 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.End)
            .width(200)
            .height(50)
    }
}

/**
 * View_2: TC1 BC·变化 mode=Start (TestTextInput_ellipsisMode_002)
 */
@Component
public class View_TextInput_ellipsisMode_2 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.Start)
            .width(200)
            .height(50)
    }
}

/**
 * View_3: TC2 BC·变化 mode=Center (TestTextInput_ellipsisMode_003)
 */
@Component
public class View_TextInput_ellipsisMode_3 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.Center)
            .width(200)
            .height(50)
    }
}

/**
 * View_4: TC3 BC·变化 mode 边界 MultilineStart+maxLines(1) (TestTextInput_ellipsisMode_004)
 */
@Component
public class View_TextInput_ellipsisMode_4 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.MultilineStart)
            .width(200)
            .height(50)
    }
}

/**
 * View_5: TC4 BC·变化 mode 边界 MultilineCenter+maxLines(1) (TestTextInput_ellipsisMode_005)
 */
@Component
public class View_TextInput_ellipsisMode_5 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.MultilineCenter)
            .width(200)
            .height(50)
    }
}

/**
 * View_6: TC5 BC·None Reset ellipsisMode(Option.None) (TestTextInput_ellipsisMode_006)
 */
@Component
public class View_TextInput_ellipsisMode_6 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(Option<EllipsisMode>.None)
            .width(200)
            .height(50)
    }
}

/**
 * View_7: TC6 BC·默认值 不调用 ellipsisMode (TestTextInput_ellipsisMode_007)
 */
@Component
public class View_TextInput_ellipsisMode_7 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .textOverflow(TextOverflow.Ellipsis)
            .width(200)
            .height(50)
    }
}

/* ── 编辑态 + maxLines(1)（条件2：Start/Center 生效；条件3：End/MultilineStart/MultilineCenter 正常生效） ── */

/**
 * View_8: BC·编辑态+maxLines(1)+Start (TestTextInput_ellipsisMode_008)
 */
@Component
public class View_TextInput_ellipsisMode_8 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.Start)
            .width(200)
            .height(50)
    }
}

/**
 * View_9: BC·编辑态+maxLines(1)+Center (TestTextInput_ellipsisMode_009)
 */
@Component
public class View_TextInput_ellipsisMode_9 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.Center)
            .width(200)
            .height(50)
    }
}

/**
 * View_10: BC·编辑态+maxLines(1)+End (TestTextInput_ellipsisMode_010)
 */
@Component
public class View_TextInput_ellipsisMode_10 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.End)
            .width(200)
            .height(50)
    }
}

/**
 * View_11: BC·编辑态+maxLines(1)+MultilineStart (TestTextInput_ellipsisMode_011)
 */
@Component
public class View_TextInput_ellipsisMode_11 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.MultilineStart)
            .width(200)
            .height(50)
    }
}

/**
 * View_12: BC·编辑态+maxLines(1)+MultilineCenter (TestTextInput_ellipsisMode_012)
 */
@Component
public class View_TextInput_ellipsisMode_12 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(1)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.MultilineCenter)
            .width(200)
            .height(50)
    }
}

/* ── 编辑态 + maxLines(2)（条件3：End/MultilineStart/MultilineCenter 生效；Start/Center 不生效，规格空白需实证） ── */

/**
 * View_13: BC·编辑态+maxLines(2)+End (TestTextInput_ellipsisMode_013)
 */
@Component
public class View_TextInput_ellipsisMode_13 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(2)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.End)
            .width(200)
            .height(50)
    }
}

/**
 * View_14: BC·编辑态+maxLines(2)+MultilineStart (TestTextInput_ellipsisMode_014)
 */
@Component
public class View_TextInput_ellipsisMode_14 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(2)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.MultilineStart)
            .width(200)
            .height(50)
    }
}

/**
 * View_15: BC·编辑态+maxLines(2)+MultilineCenter (TestTextInput_ellipsisMode_015)
 */
@Component
public class View_TextInput_ellipsisMode_15 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(2)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.MultilineCenter)
            .width(200)
            .height(50)
    }
}

/**
 * View_16: BC·编辑态+maxLines(2)+Start 规格空白 (TestTextInput_ellipsisMode_016)
 */
@Component
public class View_TextInput_ellipsisMode_16 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(2)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.Start)
            .width(200)
            .height(50)
    }
}

/**
 * View_17: BC·编辑态+maxLines(2)+Center 规格空白 (TestTextInput_ellipsisMode_017)
 */
@Component
public class View_TextInput_ellipsisMode_17 {
    func build() {
        TextInput(text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            .id("TextInput_comattr_id")
            .maxLines(2)
            .enableKeyboardOnFocus(false)
            .defaultFocus(true)
            .textOverflow(TextOverflow.Ellipsis)
            .ellipsisMode(EllipsisMode.Center)
            .width(200)
            .height(50)
    }
}
