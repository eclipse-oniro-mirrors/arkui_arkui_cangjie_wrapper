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

// Test view for Gesture_MaskNormal
package ohos_app_cangjie_entry.Gesture_comattr_gesture_2

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_Gesture_MaskNormal {
    @State
    var parentStatus: String = "idle"
    @State
    var childStatus: String = "idle"

    func build() {
        Column() {
            Text(this.parentStatus).id("mask_parent_status").fontSize(16)
            Text(this.childStatus).id("mask_child_status").fontSize(16)
            Text("child pan area").id("mask_child_area").fontSize(18)
                .width(250).height(150).backgroundColor(0xDDDDDD)
                .gesture(PanGesture()
                    .onActionStart({ e =>
                        GestureEventRecords.record("child-start", e)
                        this.childStatus = "child start" }))
        }.width(300).height(350).backgroundColor(0xF0F0F0).borderRadius(12).id("mask_parent_area")
        .gesture(PanGesture()
            .onActionStart({ e =>
                GestureEventRecords.record("parent-start", e)
                this.parentStatus = "parent start" }), Option<GestureMask>.Some(GestureMask.Normal))
    }
}
