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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

/**
 * CheckboxGroup.mark
 */
@Component
public class View_CheckboxGroup_mark_003 {
    func build() {
        Column(space: 10) {
            Text("only strokeColor value form").fontSize(14)
            CheckboxGroup(group: "markGroup")
                .mark(strokeColor: 0xFF112233)
                .width(40.vp).height(40.vp)
                .id("cg_mark")
            Checkbox(name: "c", group: "markGroup").size(width: 40.vp, height: 40.vp)
        }.margin(top: 20, left: 20)
    }
}
