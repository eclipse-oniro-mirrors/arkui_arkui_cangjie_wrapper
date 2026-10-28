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

// Test view for Gesture_MultiComponents
package ohos_app_cangjie_entry.Gesture_AllComponents

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_Gesture_MultiComponents {
    @State
    var buttonStatus: String = "idle"
    @State
    var textStatus: String = "idle"
    @State
    var columnStatus: String = "idle"

    func build() {
        Column(space: 10) {
            Button("pan button").id("multi_button_area").width(200).height(80)
                .gesture(PanGesture()
                .onActionStart({ e =>
                    GestureEventRecords.record("button-start", e)
                    this.buttonStatus = "start" }))
            Text(this.buttonStatus).id("multi_button_status").fontSize(14)
            Text("pan text").id("multi_text_area").width(200).height(80).fontSize(18)
                .backgroundColor(0xEEEEEE)
                .gesture(PanGesture()
                .onActionStart({ e =>
                    GestureEventRecords.record("text-start", e)
                    this.textStatus = "start" }))
            Text(this.textStatus).id("multi_text_status").fontSize(14)
            Column() {
                Text("pan column").fontSize(18)
            }.id("multi_column_area").width(200).height(80).backgroundColor(0xDDDDDD)
            .gesture(PanGesture()
                .onActionStart({ e =>
                    GestureEventRecords.record("column-start", e)
                    this.columnStatus = "start" }))
            Text(this.columnStatus).id("multi_column_status").fontSize(14)
        }.width(300).height(500).id("multi_root")
    }
}
