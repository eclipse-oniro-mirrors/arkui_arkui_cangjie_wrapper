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
// Test view for Hover_Path2D - hoverEffect test page
package ohos_app_cangjie_entry.Hover_AllComponents

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.component.path_2d.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos.resource.__GenerateResource__
import ohos.web.webview.*

@Component
public class View_Hover_Path2D {
    let context: CanvasRenderingContext2D = CanvasRenderingContext2D(RenderingContextSettings(antialias: true))
    func build() {
        Column {
            Canvas(this.context)
                .onReady({ =>
                    let p = Path2D()
                    p.arc(50.0, 50.0, 40.0, 0.0, 6.28, counterclockwise: true)
                    this.context.fillRect(0.0, 0.0, 100.0, 100.0)
                }).id("Path2D_comattr_id")
        }.width(100.percent).height(100.percent)
    }
}
