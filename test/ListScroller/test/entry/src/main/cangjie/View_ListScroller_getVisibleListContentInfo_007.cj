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
/**
 * 新增接口测试页：ListScroller
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
internal import ohos.business_exception.BusinessException

@Component
public class View_ListScroller_getVisibleListContentInfo_007 {
    var ls: ListScroller = ListScroller()
    @State
    var gviResult: String = ""

    func areaValue(a: ?ListItemGroupArea): Int32 {
        if (let Some(v) <- a) {
            if (v == ListItemGroupArea.InListItemArea) { return 1 }
            if (v == ListItemGroupArea.InHeaderArea) { return 2 }
            if (v == ListItemGroupArea.InFooterArea) { return 3 }
            return 0
        }
        return -1
    }

    func runGviScenario() {
        var out = ""
        try {
            let info = this.ls.getVisibleListContentInfo(9999.0, 200.0)
            out = "info.index: ${info.index}, info.itemGroupArea: ${areaValue(info.itemGroupArea)}, info.itemIndexInGroup: ${info.itemIndexInGroup ?? -1};"
        } catch (e: BusinessException) {
            out = "code: ${e.code}, meesage: ${e};"
        }
        this.gviResult = out
    }

    // 布局（vp）：GroupA[0,115]{header 0-20, item0 20-50, 空隙 50-65, item1 65-95, footer 95-115}
    //            GroupB(空) [115,145]、散置 ListItem [145,175]
    func build() {
        Column(space: 8) {
            List(space: 5, scroller: this.ls) {
                ListItemGroup(space: 5) {
                    ListItem() { Text("g0i0").width(100.percent).height(80.px).backgroundColor(0xF5DEB3).id("g0i0") }
                    ListItem() { Text("g0i1").width(100.percent).height(80.px).backgroundColor(0xD2B48C) }
                    ListItem() { Text("g0i2").width(100.percent).height(80.px).backgroundColor(0xF5DEB3) }
                }
                ListItemGroup(space: 5) {
                    ListItem() { Text("g1i0").width(100.percent).height(80.px).backgroundColor(0xD2B48C).id("g1i0") }
                    ListItem() { Text("g1i1").width(100.percent).height(80.px).backgroundColor(0xF5DEB3) }
                    ListItem() { Text("g1i2").width(100.percent).height(80.px).backgroundColor(0xD2B48C).id("g1i2") }
                }
            }.width(300.px).height(300.px).backgroundColor(0xAFEEEE).id("list_scroller_main")

            Text(this.gviResult).id("gvi_result").fontSize(9)
            Button("getVisibleListContentInfo(9999.0, 200.0)").fontSize(10).id("btn_gvi").onClick({ evt => this.runGviScenario() })
        }.width(100.percent)
    }

}
