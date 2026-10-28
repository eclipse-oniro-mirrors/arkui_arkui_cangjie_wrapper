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
// Test view for OnChildTouch_Path2D - onChildTouchTest test page.
// Path2D is a canvas path-data class (RemoteDataLite), not a component with CommonMethod
// attributes; following the HitTest AllComponents convention, the callback is registered
// on the hosting Canvas while Path2D is exercised inside onReady.
package ohos_app_cangjie_entry.OnChildTouch_AllComponents

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.component.canvas.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

@Component
public class View_OnChildTouch_Path2D {
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
                .width(200.vp).height(100.vp)
                .onChildTouchTest({ touchInfo: Array<TouchTestInfo> =>
                    OnChildTouchCount.inc()
                    return TouchResult(TouchTestStrategy.Default)
                })
        }.width(100.percent).height(100.percent)
    }
}
