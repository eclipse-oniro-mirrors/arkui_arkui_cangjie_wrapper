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

package ohos_app_cangjie_entry.tab_divider

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/**
 * View_Tab_divider_1: divider 全参数断言 (TestTabs_divider_001)
 */
@Component
public class View_Tab_divider_1 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: 1.vp, color: Color.Red, startMargin: 2.vp, endMargin: 3.vp)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_2: divider 全零边界 (TestTabs_divider_002)
 */
@Component
public class View_Tab_divider_2 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: 0.vp, color: Color(0, 0, 0, alpha: 0.0), startMargin: 0.vp, endMargin: 0.vp)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_3: divider value None Reset (TestTabs_divider_003)
 */
@Component
public class View_Tab_divider_3 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: Option<Length>.None)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_4: divider 接口不调用 (TestTabs_divider_004)
 */
@Component
public class View_Tab_divider_4 {
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
 * View_Tab_divider_5: DividerStyle 四参数全部 None 走构造器默认值 (TestTabs_divider_005)
 */
@Component
public class View_Tab_divider_5 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: Option<Length>.None, color: Option<ResourceColor>.None,
            startMargin: Option<Length>.None, endMargin: Option<Length>.None)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_6: Length 三参数上界 Float64.Max (TestTabs_divider_006)
 */
@Component
public class View_Tab_divider_6 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: Float64.Max.vp, color: Color.Red,
            startMargin: Float64.Max.vp, endMargin: Float64.Max.vp)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_7: Length 三参数负值无效 (TestTabs_divider_007)
 */
@Component
public class View_Tab_divider_7 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: (-1.0).vp, color: Color.Red,
            startMargin: (-1.0).vp, endMargin: (-1.0).vp)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_8: Length 三参数 percent 无效 (TestTabs_divider_008)
 * 注：divider 的 Length 参数不支持 percent，传入后 NG 层按非法值处理
 */
@Component
public class View_Tab_divider_8 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: 50.percent, color: Color.Red,
            startMargin: 50.percent, endMargin: 50.percent)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_9: color+startMargin+endMargin 三非必填参数全部省略走默认值 (TestTabs_divider_009)
 * strokeWidth 必填显式传 1.vp；color/startMargin/endMargin 不传走默认值
 */
@Component
public class View_Tab_divider_9 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: 1.vp)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_10: color UInt32 字面量上界 0xFFFFFFFF (TestTabs_divider_010)
 */
@Component
public class View_Tab_divider_10 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: 1.vp, color: 0xFFFFFFFF,
            startMargin: 2.vp, endMargin: 3.vp)
        .width(360).height(296)
    }
}

/**
 * View_Tab_divider_11: color UInt32 字面量 alpha=0 触发 alphaAdapt 0x00FFFFFF (TestTabs_divider_011)
 */
@Component
public class View_Tab_divider_11 {
    func build() {
        Tabs() {
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87) }.tabBar("green")
            TabContent() { Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF) }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .divider(strokeWidth: 1.vp, color: Color(0xFF, 0xFF, 0xFF, alpha: 0.0),
            startMargin: 2.vp, endMargin: 3.vp)
        .width(360).height(296)
    }
}