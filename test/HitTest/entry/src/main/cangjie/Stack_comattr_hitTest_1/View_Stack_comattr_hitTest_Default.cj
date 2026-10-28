/**
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
// Test view for Stack_comattr_hitTest_Default - hitTestBehavior test page
package ohos_app_cangjie_entry.Stack_comattr_hitTest_1

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

@Component
public class View_Stack_comattr_hitTest_Default {
    func build() {
        Stack {
            Button { Text("outer button").fontSize(20.vp) }
                .id("outer_button_id")
            Stack {
                Button { Text("inner button").fontSize(20.vp) }
                    .id("inner_button_id")
            }
                .width(100.percent).height(100.percent)
                .hitTestBehavior(HitTestMode.Default)
                .id("Stack_comattr_id")
            Text("test").fontSize(20.vp)
                .width(100.percent).height(100.percent)
        }.width(300.vp).height(300.vp)
    }
}
