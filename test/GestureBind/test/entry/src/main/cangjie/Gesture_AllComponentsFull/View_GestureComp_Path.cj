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
// Test view for GestureComp_Path - gesture binding test page
package ohos_app_cangjie_entry.Gesture_AllComponentsFull

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos_app_cangjie_entry.GestureEventRecords

@Component
public class View_GestureComp_Path {
    @State
    var status: String = "idle"

    func build() {
        Column {
            Path(commands: "M0 0 L100 100")
                .id("Path_gesture_area")
                .width(100.vp).height(100.vp)
                .gesture(PanGesture().onActionStart({ e =>
                    GestureEventRecords.record("start", e)
                    this.status = "start" }))
            Text(this.status).id("Path_gesture_status")
        }.width(100.percent).height(100.percent)
    }
}
