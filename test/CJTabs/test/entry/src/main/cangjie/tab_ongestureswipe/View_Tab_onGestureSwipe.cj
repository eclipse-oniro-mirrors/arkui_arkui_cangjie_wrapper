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

package ohos_app_cangjie_entry.tab_ongestureswipe

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/*
 * 事件回调存档全局变量（测试侧读取断言）
 */
public var onGestureSwipeCount: Int32 = 0
public var onGestureSwipeCurrentOffset: Float32 = -1.0
public var onGestureSwipeVelocity: Float32 = -1.0
public var onGestureSwipeIndex: Int32 = -1

/**
 * View_Tab_onGestureSwipe_1: onGestureSwipe slow swipe (TestTabs_onGestureSwipe_001)
 */
@Component
public class View_Tab_onGestureSwipe_1 {
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
        .onGestureSwipe({
            index: Int32, event: TabsAnimationEvent =>
            onGestureSwipeCount += 1
            onGestureSwipeIndex = index
            onGestureSwipeCurrentOffset = event.currentOffset
            onGestureSwipeVelocity = event.velocity
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onGestureSwipe_2: onGestureSwipe not registered (TestTabs_onGestureSwipe_002)
 */
@Component
public class View_Tab_onGestureSwipe_2 {
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
 * View_Tab_onGestureSwipe_3: onGestureSwipe short swipe non-switchable direction (TestTabs_onGestureSwipe_003)
 */
@Component
public class View_Tab_onGestureSwipe_3 {
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
        .onGestureSwipe({
            index: Int32, event: TabsAnimationEvent =>
            onGestureSwipeCount += 1
            onGestureSwipeIndex = index
            onGestureSwipeCurrentOffset = event.currentOffset
            onGestureSwipeVelocity = event.velocity
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onGestureSwipe_4: onGestureSwipe targetOffset==0 boundary (TestTabs_onGestureSwipe_004)
 * initialIndex=1（末页），向 index=0 方向短滑，targetOffset=0
 */
@Component
public class View_Tab_onGestureSwipe_4 {
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
        .onGestureSwipe({
            index: Int32, event: TabsAnimationEvent =>
            onGestureSwipeCount += 1
            onGestureSwipeIndex = index
            onGestureSwipeCurrentOffset = event.currentOffset
            onGestureSwipeVelocity = event.velocity
        })
        .width(360)
        .height(296)
    }
}

/**
 * View_Tab_onGestureSwipe_5: onGestureSwipe cleared via None (TestTabs_onGestureSwipe_005)
 */
@Component
public class View_Tab_onGestureSwipe_5 {
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
        .onGestureSwipe(
            if (this.phase == 0) {
                { index: Int32, event: TabsAnimationEvent =>
                    onGestureSwipeCount += 1
                    onGestureSwipeIndex = index
                    onGestureSwipeCurrentOffset = event.currentOffset
                    onGestureSwipeVelocity = event.velocity
                }
            } else {
                Option<(Int32, TabsAnimationEvent) -> Unit>.None
            }
        )
        .onClick({ e => this.phase = 1 })
        .width(360)
        .height(296)
    }
}
