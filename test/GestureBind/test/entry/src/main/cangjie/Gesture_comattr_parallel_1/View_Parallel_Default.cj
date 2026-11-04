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

// Test view for Parallel_Default
package ohos_app_cangjie_entry.Gesture_comattr_parallel_1

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_Parallel_Default {
    @State
    var parentStatus: String = "idle"
    @State
    var childStatus: String = "idle"

    func build() {
        Column() {
            Text(this.parentStatus).id("parallel_parent_status").fontSize(16)
            Text(this.childStatus).id("parallel_child_status").fontSize(16)
            Column() {
                Text("child pan area").fontSize(18)
            }.width(250).height(150).backgroundColor(0xDDDDDD).id("parallel_child_area")
            .gesture(PanGesture()
                .onActionStart({ e =>
                    GestureEventRecords.record("child-start", e)
                    this.childStatus = "child start" }))
        }.width(300).height(350).backgroundColor(0xF0F0F0).borderRadius(12).id("parallel_parent_area")
        .parallelGesture(PanGesture()
            .onActionStart({ e =>
                GestureEventRecords.record("parent-start", e)
                this.parentStatus = "parent start" }))
    }
}
