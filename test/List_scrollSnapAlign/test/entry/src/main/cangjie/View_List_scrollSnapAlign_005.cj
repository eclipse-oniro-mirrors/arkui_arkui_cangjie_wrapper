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
 * List.scrollSnapAlign End 吸附
 */
@Component
public class View_List_scrollSnapAlign_005 {
@State
    var snap005Src: String = ""
    func build() {
        Column(space: 10) {
            List() {
                ListItem() { Text("s0").width(100.percent).height(100.px).backgroundColor(0xF5DEB3).id("snap_i0") }
                ListItem() { Text("s1").width(100.percent).height(100.px).backgroundColor(0xF5DEB3).id("snap_i1") }
                ListItem() { Text("s2").width(100.percent).height(100.px).backgroundColor(0xF5DEB3).id("snap_i2") }
                ListItem() { Text("s3").width(100.percent).height(100.px).backgroundColor(0xF5DEB3).id("snap_i3") }
                ListItem() { Text("s4").width(100.percent).height(100.px).backgroundColor(0xF5DEB3).id("snap_i4") }
            }.width(200.px).height(150.px).cachedCount(3).border(width: 2.px, color: Color.Red).backgroundColor(0xD3D3D3).scrollSnapAlign(ScrollSnapAlign.End)
            .onWillScroll({ x: Float64, st: ScrollState, src: ScrollSource => if (src == ScrollSource.Fling) { this.snap005Src = "Fling" } })
            .id("list_snap")
            Text("snap005 onWillScroll src:").fontSize(12)
            Text("${this.snap005Src}").id("snap_src")
        }.margin(top: 10, left: 10)
    }
}
