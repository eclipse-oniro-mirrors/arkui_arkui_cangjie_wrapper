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

package ohos_app_cangjie_entry.tab_edgeeffect

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/**
 * View_Tab_edgeEffect_1: edgeEffect Fade 正常值 (TestTabs_edgeEffect_001)
 */
@Component
public class View_Tab_edgeEffect_1 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .edgeEffect(EdgeEffect.Fade)
        .width(360).height(296)
    }
}

/**
 * View_Tab_edgeEffect_2: edgeEffect Spring 显式设置 (TestTabs_edgeEffect_002)
 */
@Component
public class View_Tab_edgeEffect_2 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .edgeEffect(EdgeEffect.Spring)
        .width(360).height(296)
    }
}

/**
 * View_Tab_edgeEffect_3: edgeEffect 默认值不调用接口 (TestTabs_edgeEffect_003)
 */
@Component
public class View_Tab_edgeEffect_3 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .width(360).height(296)
    }
}

/**
 * View_Tab_edgeEffect_4: edgeEffect None 边界值 (TestTabs_edgeEffect_004)
 */
@Component
public class View_Tab_edgeEffect_4 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .edgeEffect(EdgeEffect.None)
        .width(360).height(296)
    }
}

/**
 * View_Tab_edgeEffect_5: edgeEffect Fade → None Reset 回退链路 (TestTabs_edgeEffect_005)
 */
@Component
public class View_Tab_edgeEffect_5 {
    @State
    var phase: Int32 = 0

    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .edgeEffect(
            if (this.phase == 0) {
                EdgeEffect.Fade
            } else {
                Option<EdgeEffect>.None
            }
        )
        .onClick({ e => this.phase = 1 })
        .width(360).height(296)
    }
}
