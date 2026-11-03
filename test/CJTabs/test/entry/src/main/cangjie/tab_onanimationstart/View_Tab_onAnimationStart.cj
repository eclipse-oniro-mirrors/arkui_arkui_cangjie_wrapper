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

package ohos_app_cangjie_entry.tab_onanimationstart

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/*
 * 事件回调存档全局变量（测试侧读取断言）
 */
public var onAnimationStartCount: Int32 = 0
public var onAnimationStartIndex: Int32 = -1
public var onAnimationStartTargetIndex: Int32 = -1
public var onAnimationStartTargetOffset: Float32 = -1.0

/**
 * View_Tab_onAnimationStart_1: onAnimationStart registered, swipe 0 → 1 (TestTabs_onAnimationStart_001)
 */
@Component
public class View_Tab_onAnimationStart_1 {
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
        .animationDuration(300.0)
        .onAnimationStart({
            index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
            onAnimationStartCount += 1
            onAnimationStartIndex = index
            onAnimationStartTargetIndex = targetIndex
            onAnimationStartTargetOffset = event.targetOffset
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onAnimationStart_2: onAnimationStart not registered (TestTabs_onAnimationStart_002)
 */
@Component
public class View_Tab_onAnimationStart_2 {
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
        .animationDuration(300.0)
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onAnimationStart_3: onAnimationStart last-page boundary (TestTabs_onAnimationStart_003)
 * 3 个 tab，初始 index=2（末页），向末尾方向滑（无可切换目标）
 */
@Component
public class View_Tab_onAnimationStart_3 {
    func build() {
        Tabs(index: 2) {
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
            }.tabBar("green")
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
            }.tabBar("blue")
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0xFFA500)
            }.tabBar("orange")
        }
        .id("Tabs_comattr_id")
        .animationDuration(300.0)
        .onAnimationStart({
            index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
            onAnimationStartCount += 1
            onAnimationStartIndex = index
            onAnimationStartTargetIndex = targetIndex
            onAnimationStartTargetOffset = event.targetOffset
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onAnimationStart_4: onAnimationStart targetOffset==0 boundary (TestTabs_onAnimationStart_004)
 * 初始 index=1（末页 blue），向 index=0 方向滑，targetOffset=0
 */
@Component
public class View_Tab_onAnimationStart_4 {
    func build() {
        Tabs(index: 1) {
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x00CB87)
            }.tabBar("green")
            TabContent() {
                Column().width(100.percent).height(100.percent).backgroundColor(0x007DFF)
            }.tabBar("blue")
        }
        .id("Tabs_comattr_id")
        .animationDuration(300.0)
        .onAnimationStart({
            index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
            onAnimationStartCount += 1
            onAnimationStartIndex = index
            onAnimationStartTargetIndex = targetIndex
            onAnimationStartTargetOffset = event.targetOffset
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onAnimationStart_5: onAnimationStart cleared via None (TestTabs_onAnimationStart_005)
 * phase=0：注册；phase=1：None 清除
 */
@Component
public class View_Tab_onAnimationStart_5 {
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
        .animationDuration(300.0)
        .onAnimationStart(
            if (this.phase == 0) {
                { index: Int32, targetIndex: Int32, event: TabsAnimationEvent =>
                    onAnimationStartCount += 1
                    onAnimationStartIndex = index
                    onAnimationStartTargetIndex = targetIndex
                    onAnimationStartTargetOffset = event.targetOffset
                }
            } else {
                Option<(Int32, Int32, TabsAnimationEvent) -> Unit>.None
            }
        )
        .onClick({ e => this.phase = 1 })
        .width(360)
        .height(296)
    }
}
