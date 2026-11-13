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
public class View_ListScroller_getVisibleListContentInfo_015 {
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

    func runGviStructScenario() {
        var out = ""
        try {
            let info = this.ls.getVisibleListContentInfo(50.0, 160.0)
            out = "info.index: ${info.index}, info.itemGroupArea: ${areaValue(info.itemGroupArea)}, info.itemIndexInGroup: ${info.itemIndexInGroup ?? -1};"
        } catch (e: BusinessException) {
            out = "code: ${e.code}, meesage: ${e};"
        }
        this.gviResult = out
    }

    @Builder
    func StructHeader() {
        Text("header").width(100.percent).height(20.vp).backgroundColor(0x4169E1)
    }

    @Builder
    func StructFooter() {
        Text("footer").width(100.percent).height(20.vp).backgroundColor(0x4682B4)
    }

    // getVisibleListContentInfo 结构场景：单 List 全 vp 几何，探测坐标与密度无关
    // 布局（vp）：GroupA[0,115]{header 0-20, item0 20-50, 空隙 50-65, item1 65-95, footer 95-115}
    //            GroupB(空) [115,145]、散置 ListItem [145,175]

    func build() {
        Column(space: 8) {
            List(scroller: this.ls) {
                ListItemGroup(space: 15.vp, header: bind(this.StructHeader, this), footer: bind(this.StructFooter, this)) {
                    ListItem() { Text("item0").width(100.percent).height(30.vp).backgroundColor(0xF5DEB3) }
                    ListItem() { Text("item1").width(100.percent).height(30.vp).backgroundColor(0xD2B48C) }
                }.width(100.vp).height(115.vp)
                ListItemGroup() { }.width(100.vp).height(30.vp).padding(15.vp)
                ListItem() { Text("loose").width(100.percent).height(30.vp).backgroundColor(0x9ACD32) }
            }.width(100.vp).height(180.vp).backgroundColor(0xAFEEEE).id("list_gvi_struct")

            Text(this.gviResult).id("gvi_result").fontSize(9)
            Button("getVisibleListContentInfo(50.0, 160.0)").fontSize(10).id("btn_gvi").onClick({ evt => this.runGviStructScenario() })

        }.width(100.percent)
    }

}
