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
// Test view for HitTest_Path2D - hitTestBehavior test page
package ohos_app_cangjie_entry.HitTest_AllComponents

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.component.rich_editor.*
import ohos.arkui.component.canvas.*
import ohos.arkui.component.custom_component.CustomView
import ohos.arkui.state_macro_manage.*
import ohos.web.webview.*
import std.time.*
import kit.ArkUI.*

@Component
public class View_HitTest_Path2D {
    let context: CanvasRenderingContext2D = CanvasRenderingContext2D(RenderingContextSettings(antialias: true))
    func build() {
        Column {
            Canvas(this.context)
                .onReady({ =>
                    let p = Path2D()
                    p.arc(50.0, 50.0, 40.0, 0.0, 6.28, counterclockwise: true)
                    this.context.fillRect(0.0, 0.0, 100.0, 100.0)
                })
                .id("Path2D_comattr_id")
                .hitTestBehavior(HitTestMode.Block)
        }.width(100.percent).height(100.percent)
    }
}
