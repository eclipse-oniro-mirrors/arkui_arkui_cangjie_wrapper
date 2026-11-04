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

// Test view for Gesture_Arkts_PanExample1 - translated from ArkTS
// ts-basic-gestures-pangesture.md#示例 (PanGestureExample):
// - panOption(direction: Left | Right) → fixed named-param translation PanGesture(direction:
//   PanDirection.Left | PanDirection.Right) (PanGestureOptions is not provided by Cangjie);
// - offset display + translate follow + positionX/Y saved on end, per the example;
// - the "修改PanGesture触发条件" Button (panOption.setDirection/setFingers dynamic mutation)
//   is not translated (PanGestureOptions not provided).
package ohos_app_cangjie_entry.Gesture_comattr_gesture_arkts

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_Gesture_Arkts_PanExample1 {
    @State
    var offsetX: Float64 = 0.0
    @State
    var offsetY: Float64 = 0.0
    @State
    var positionX: Float64 = 0.0
    @State
    var positionY: Float64 = 0.0
    @State
    var status: String = "idle"

    func build() {
        Column() {
            Column() {
                Text("PanGesture offset:\nX: ${this.offsetX}\nY: ${this.offsetY}").fontSize(20).id("arkts_pan_offset")
            }
            .height(200)
            .width(300)
            .padding(20)
            .borderWidth(3)
            .margin(50)
            .translate(x: this.offsetX, y: this.offsetY)
            .id("arkts_pan_area")
            .gesture(PanGesture(direction: PanDirection.Left | PanDirection.Right)
                .onActionStart({ e =>
                    GestureEventRecords.record("start", e)
                    this.status = "pan start" })
                .onActionUpdate({ e =>
                    this.offsetX = this.positionX + e.offsetX
                    this.offsetY = this.positionY + e.offsetY
                })
                .onActionEnd({ e =>
                    GestureEventRecords.record("end", e)
                    this.positionX = this.offsetX
                    this.positionY = this.offsetY
                    this.status = "pan end"
                }))
            Text(this.status).id("arkts_pan_status").fontSize(16)
        }.width(100.percent).height(100.percent).id("arkts_pan_root")
    }
}
