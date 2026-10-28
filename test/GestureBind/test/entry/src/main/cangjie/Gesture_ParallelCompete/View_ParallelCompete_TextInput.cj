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
// Test view for ParallelCompete_TextInput - gesture binding test page
// focusOnTouch(false) works around a native defect (stack-buffer-overflow in
// GetTextInputModifer when a focused text-input component is swapped out on the next
// case); gesture callbacks are focus-independent.
package ohos_app_cangjie_entry.Gesture_ParallelCompete

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_ParallelCompete_TextInput {
    @State
    var status: String = "idle"

    func build() {
        Column {
            TextInput(placeholder: "test", text: "test")
                .id("TextInput_parallel_area")
                .focusOnTouch(false)
                .parallelGesture(PanGesture().onActionStart({ e =>
                    GestureEventRecords.record("start", e)
                    this.status = "start" }))
            Text(this.status).id("TextInput_parallel_status")
        }.width(100.percent).height(100.percent)
    }
}
