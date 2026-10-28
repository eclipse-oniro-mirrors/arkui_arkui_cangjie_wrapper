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

// Test view for Gesture_Arkts_SettingsExample2 - translated from ArkTS
// ts-gesture-settings.md#示例2 (PanGestureWithFingerCount):
// - monitors the number of effective fingers participating in the pan via event.fingerInfos
//   (start/update read the size, end/cancel reset it to 0);
// - panOption(direction: All, fingers: 1) → fixed named-param translation
//   PanGesture(fingers: 1, direction: PanDirection.All) (PanGestureOptions is not provided);
// - the "切换为双指滑动" Button (panOption.setFingers dynamic mutation) is not translated;
// - callbacks also feed GestureEventRecords for value-level assertions (fingerInfos size
//   during the pan), reusing the direct-capture infra of the EventFields page.
package ohos_app_cangjie_entry.Gesture_comattr_gesture_arkts

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_Gesture_Arkts_SettingsExample2 {
    @State
    var offsetX: Float64 = 0.0
    @State
    var offsetY: Float64 = 0.0
    @State
    var positionX: Float64 = 0.0
    @State
    var positionY: Float64 = 0.0
    @State
    var fingerCount: Int64 = 0

    private func fingerInfoCount(e: GestureEvent): Int64 {
        match (e.fingerInfos) {
            case Some(infos) => infos.size
            case None => 0
        }
    }

    func build() {
        Column() {
            Text("触点数量：${this.fingerCount}")
                .fontSize(20)
                .margin(10)
                .id("arkts_finger_count")
            Column() {
                Text("PanGesture offset:\nX: ${this.offsetX}\nY: ${this.offsetY}").fontSize(20).id("arkts_finger_offset")
            }
            .height(200)
            .width(300)
            .padding(20)
            .borderWidth(3)
            .margin(50)
            .translate(x: this.offsetX, y: this.offsetY)
            .id("arkts_finger_area")
            .gesture(PanGesture(fingers: 1, direction: PanDirection.All)
                .onActionStart({ e =>
                    GestureEventRecords.record("start", e)
                    this.fingerCount = this.fingerInfoCount(e)
                })
                .onActionUpdate({ e =>
                    GestureEventRecords.record("update", e)
                    this.offsetX = this.positionX + e.offsetX
                    this.offsetY = this.positionY + e.offsetY
                    this.fingerCount = this.fingerInfoCount(e)
                })
                .onActionEnd({ e =>
                    GestureEventRecords.record("end", e)
                    this.positionX = this.offsetX
                    this.positionY = this.offsetY
                    this.fingerCount = 0
                })
                .onActionCancel({ =>
                    this.fingerCount = 0
                }))
        }.width(100.percent).height(100.percent).id("arkts_finger_root")
    }
}
