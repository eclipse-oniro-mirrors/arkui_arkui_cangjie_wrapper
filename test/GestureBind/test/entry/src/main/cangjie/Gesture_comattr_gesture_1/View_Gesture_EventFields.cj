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

// Test view for Gesture_EventFields
// PanGesture callbacks feed the shared GestureEventRecords direct-capture buffer (raw field
// values for SR-006 value-level assertions) and keep the coarse @State status texts for
// on-screen observation only.
package ohos_app_cangjie_entry.Gesture_comattr_gesture_1

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_Gesture_EventFields {
    @State
    var startStatus: String = "start:none"
    @State
    var endStatus: String = "end:none"
    @State
    var updateStatus: String = "updateGe3=false"
    @State
    var infosStatus: String = "infos:none"
    @State
    var updateCount: Int64 = 0

    func build() {
        Column() {
            Column() {
                Text(this.startStatus).id("event_start_status").fontSize(14)
                Text(this.endStatus).id("event_end_status").fontSize(14)
                Text(this.updateStatus).id("event_update_status").fontSize(14)
                Text(this.infosStatus).id("event_infos_status").fontSize(14)
            }.width(300).height(300).backgroundColor(0xF0F0F0).borderRadius(12).id("gesture_area")
            .gesture(PanGesture(fingers: 1, direction: PanDirection.All, distance: 5.0)
                .onActionStart({ e =>
                    GestureEventRecords.record("start", e)
                    this.startStatus = "start:fingers=${e.fingerList.size}" })
                .onActionUpdate({ e =>
                    GestureEventRecords.record("update", e)
                    this.updateCount = this.updateCount + 1
                    this.updateStatus = "updateGe3=${this.updateCount >= 3}" })
                .onActionEnd({ e =>
                    GestureEventRecords.record("end", e)
                    this.endStatus = "end:offsetGe20=${e.offsetX >= 20.0},velocityGt0=${e.velocity > 0.0}"
                    let infosSize = match (e.fingerInfos) {
                        case Some(infos) => infos.size
                        case None => -1
                    }
                    this.infosStatus = "infos:size=${infosSize}" }))
            // Dedicated two-finger area for DT-121: the single-finger area above binds
            // PanGesture(fingers: 1), which never yields fingerList.size==2 records for
            // the two-finger injection. Same direct-capture phases, fingers=2 binding.
            Column() {
                Text("two finger pan area").fontSize(14)
            }.width(300).height(150).backgroundColor(0xDDDDDD).borderRadius(12).id("two_finger_area")
            .gesture(PanGesture(fingers: 2, direction: PanDirection.All, distance: 5.0)
                .onActionStart({ e =>
                    GestureEventRecords.record("start", e)
                    this.startStatus = "start:fingers=${e.fingerList.size}" })
                .onActionUpdate({ e =>
                    GestureEventRecords.record("update", e) })
                .onActionEnd({ e =>
                    GestureEventRecords.record("end", e) }))
        }.width(100.percent).height(100.percent)
    }
}
