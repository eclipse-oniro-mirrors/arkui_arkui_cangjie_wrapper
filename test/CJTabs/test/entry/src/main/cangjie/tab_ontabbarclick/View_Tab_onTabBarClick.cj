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

package ohos_app_cangjie_entry.tab_ontabbarclick

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/*
 * 事件回调存档全局变量（测试侧读取断言）
 */
public var onTabBarClickCount: Int32 = 0
public var onTabBarClickLastIndex: Int32 = -1

/**
 * View_Tab_onTabBarClick_1: onTabBarClick registered (TestTabs_onTabBarClick_001)
 */
@Component
public class View_Tab_onTabBarClick_1 {
    func build() {
        Tabs() {
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
            }.tabBar("green")
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
            }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .onTabBarClick({
            index: Int32 =>
            onTabBarClickCount += 1
            onTabBarClickLastIndex = index
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onTabBarClick_2: onTabBarClick not registered (TestTabs_onTabBarClick_002)
 */
@Component
public class View_Tab_onTabBarClick_2 {
    func build() {
        Tabs() {
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
            }.tabBar("green")
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
            }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onTabBarClick_3: onTabBarClick click currently selected tab (TestTabs_onTabBarClick_003)
 */
@Component
public class View_Tab_onTabBarClick_3 {
    func build() {
        Tabs() {
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
            }.tabBar("green")
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
            }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .onTabBarClick({
            index: Int32 =>
            onTabBarClickCount += 1
            onTabBarClickLastIndex = index
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onTabBarClick_4: onTabBarClick cleared via None (TestTabs_onTabBarClick_004)
 */
@Component
public class View_Tab_onTabBarClick_4 {
    @State
    var phase: Int32 = 0

    func build() {
        Tabs() {
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
            }.tabBar("green")
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
            }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .onTabBarClick(
            if (this.phase == 0) {
                { index: Int32 =>
                    onTabBarClickCount += 1
                    onTabBarClickLastIndex = index
                }
            } else {
                Option<(Int32) -> Unit>.None
            }
        )
        .onClick({ e => this.phase = 1 })
        .width(360)
        .height(296)
    }
}
