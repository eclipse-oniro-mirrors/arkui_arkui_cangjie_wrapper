/*
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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

/**
 * Scroll.scrollable(ScrollDirection.None) 参数写入并读回
 */
@Component
public class View_Scroll_scrollable_001 {
    func build() {
        Column(space: 10) {
            Text("scrollable None").fontSize(14)
            Scroll() {
                Column() {
                    Text("d").width(100.percent).height(300.px).backgroundColor(0x668866).id("sd_i0")
                    Text("d").width(100.percent).height(300.px).backgroundColor(0x00ff00)
                }
            }.width(200.px).height(100.px).scrollable(ScrollDirection.None).id("scroll_dir")
        }.margin(top: 10, left: 10)
    }
}
