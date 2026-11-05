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

package ohos_app_cangjie_entry.tab_oncontentwillchange

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/*
 * 事件回调存档全局变量（测试侧读取断言）
 */
public var onContentWillChangeCount: Int32 = 0
public var onContentWillChangeLastIndex: Int32 = -1
public var onContentWillChangeReturn: Bool = true

/**
 * View_Tab_onContentWillChange_1: onContentWillChange returns true (TestTabs_onContentWillChange_001)
 */
@Component
public class View_Tab_onContentWillChange_1 {
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
        .onContentWillChange({
            index: Int32, targetIndex: Int32 =>
            onContentWillChangeCount += 1
            onContentWillChangeLastIndex = targetIndex
            true
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onContentWillChange_2: onContentWillChange not registered (TestTabs_onContentWillChange_002)
 */
@Component
public class View_Tab_onContentWillChange_2 {
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
 * View_Tab_onContentWillChange_3: onContentWillChange click currently selected tab (TestTabs_onContentWillChange_003)
 */
@Component
public class View_Tab_onContentWillChange_3 {
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
        .onContentWillChange({
            index: Int32, targetIndex: Int32 =>
            onContentWillChangeCount += 1
            onContentWillChangeLastIndex = targetIndex
            true
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onContentWillChange_4: onContentWillChange returns false (TestTabs_onContentWillChange_004)
 */
@Component
public class View_Tab_onContentWillChange_4 {
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
        .onContentWillChange({
            index: Int32, targetIndex: Int32 =>
            onContentWillChangeCount += 1
            onContentWillChangeLastIndex = targetIndex
            false
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onContentWillChange_5: onContentWillChange cleared via None (TestTabs_onContentWillChange_005)
 */
@Component
public class View_Tab_onContentWillChange_5 {
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
        .onContentWillChange(
            if (this.phase == 0) {
                { index: Int32, targetIndex: Int32 =>
                    onContentWillChangeCount += 1
                    onContentWillChangeLastIndex = targetIndex
                    true
                }
            } else {
                Option<(Int32, Int32) -> Bool>.None
            }
        )
        .onClick({ e => this.phase = 1 })
        .width(360)
        .height(296)
    }
}
