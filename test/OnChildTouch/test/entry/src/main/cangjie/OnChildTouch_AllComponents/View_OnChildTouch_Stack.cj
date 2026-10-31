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
// Test view for OnChildTouch_Stack - onChildTouchTest test page
package ohos_app_cangjie_entry.OnChildTouch_AllComponents

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

@Component
public class View_OnChildTouch_Stack {
    func build() {
        Column {
            Stack {
                Text("test").fontSize(20.vp)
            }
                .id("Stack_comattr_id")
                .width(100.percent).height(100.percent)
                .onChildTouchTest({ touchInfo: Array<TouchTestInfo> =>
                    OnChildTouchCount.inc()
                    return TouchResult(TouchTestStrategy.Default)
                })
        }.width(100.percent).height(100.percent)
    }
}
