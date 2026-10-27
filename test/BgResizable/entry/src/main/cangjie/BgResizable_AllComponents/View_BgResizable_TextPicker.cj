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
// Test view for BgResizable_TextPicker - backgroundImageResizable test page
package ohos_app_cangjie_entry.BgResizable_AllComponents

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*
import ohos.resource.__GenerateResource__

@Component
public class View_BgResizable_TextPicker {
    func build() {
        Column {
            TextPicker(range: ["1", "2", "3"])
                .id("TextPicker_comattr_id")
                .backgroundImage(@r(app.media.startIcon))
                .backgroundImageSize(width: 200, height: 200)
                .backgroundImageResizable(ResizableOptions(slice: EdgeWidths(top: 10.vp, right: 10.vp, bottom: 10.vp, left: 10.vp)))
        }.width(100.percent).height(100.percent)
    }
}
