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

// Test view for Gesture_Arkts_SettingsExample1
package ohos_app_cangjie_entry.Gesture_comattr_gesture_arkts

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_Gesture_Arkts_SettingsExample1 {
    @State
    var parallelTestValue: String = ""

    func build() {
        Column() {
            Column() {
                Text("PanGesture:" + this.parallelTestValue).fontSize(28).id("arkts_settings_text")
                    .gesture(PanGesture()
                        .onActionStart({ e =>
                            GestureEventRecords.record("text-start", e)
                            this.parallelTestValue = this.parallelTestValue + "|Text" }))
            }.height(200).width(250).padding(20).margin(20).borderWidth(3).id("arkts_settings_child")
            .parallelGesture(PanGesture()
                    .onActionStart({ e =>
                        GestureEventRecords.record("column-start", e)
                        this.parallelTestValue = this.parallelTestValue + "|Column" }),
                Option<GestureMask>.Some(GestureMask.Normal))
        }.id("arkts_settings_root")
    }
}
