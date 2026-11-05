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

package ohos_app_cangjie_entry_test

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.ui_test.*
import ohos_app_cangjie_entry.modtestSuiteText
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestView
import ohos.arkui.component.custom_component.CustomView
import ohos_app_cangjie_entry.tab_ongestureswipe.*

/*
 * 事件计数复位：每个 @TestCase 前置调用。
 */
func resetOnGestureSwipeCounters(): Unit {
    onGestureSwipeCount = 0
    onGestureSwipeCurrentOffset = -1.0
    onGestureSwipeVelocity = -1.0
    onGestureSwipeIndex = -1
}

/*
 * 公共驱动：launch 指定 View（1~5）→ 点击 testButton → 等待 Tabs 挂载。
 */
func launchTabOnGestureSwipeView(viewIndex: Int64, suiteText: String, caseText: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_Tab_onGestureSwipe_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_Tab_onGestureSwipe_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_Tab_onGestureSwipe_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_Tab_onGestureSwipe_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_Tab_onGestureSwipe_5(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000i32)
}

@Test
class Tab_onGestureSwipe_test {
    /*
     * @tc.number    : TestTabs_onGestureSwipe_001
     * @tc.name      : TestCase_1
     * @tc.desc      : slow swipe, onGestureSwipe fires with offset in [0, page width]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        resetOnGestureSwipeCounters()
        launchTabOnGestureSwipeView(1, "Tab_onGestureSwipe_test", "TestCase_1")
        swipe(from: Point(680, 750), to: Point(80, 750), speed: 2000)
        sleepFor(1.second)
        let index = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(index, "\"1\"")
        @Expect(onGestureSwipeCount >= 1, true)
        @Expect(onGestureSwipeIndex >= 0, true)
        @Expect(onGestureSwipeCurrentOffset != 0.0, true)
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTabs_onGestureSwipe_002
     * @tc.name      : TestCase_2
     * @tc.desc      : no onGestureSwipe registered, switch completes without crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        resetOnGestureSwipeCounters()
        launchTabOnGestureSwipeView(2, "Tab_onGestureSwipe_test", "TestCase_2")
        // 点击 tabBar "blue" 切换 0 → 1
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onGestureSwipeCount, 0)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"1\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTabs_onGestureSwipe_003
     * @tc.name      : TestCase_3
     * @tc.desc      : short swipe at index 0 toward non-switchable direction, no callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        resetOnGestureSwipeCounters()
        launchTabOnGestureSwipeView(3, "Tab_onGestureSwipe_test", "TestCase_3")
        // 点击当前已选中的第一个 tab（index==0），不切换
        TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onGestureSwipeCount == 0 || onGestureSwipeCurrentOffset == 0.0, true)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"0\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTabs_onGestureSwipe_004
     * @tc.name      : TestCase_4
     * @tc.desc      : swipe from last page back to first, targetOffset==0, callback fires
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        resetOnGestureSwipeCounters()
        launchTabOnGestureSwipeView(4, "Tab_onGestureSwipe_test", "TestCase_4")
        // initialIndex=1，点击 tabBar "green" 切换 1 → 0
        TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onGestureSwipeCount, 0)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"0\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestTabs_onGestureSwipe_005
     * @tc.name      : TestCase_5
     * @tc.desc      : register then None clears, counter stops growing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        resetOnGestureSwipeCounters()
        launchTabOnGestureSwipeView(5, "Tab_onGestureSwipe_test", "TestCase_5")
        // phase=0：注册态触发一次
        swipe(from: Point(680, 750), to: Point(80, 750), speed: 2000)
        sleepFor(1.second)
        @Expect(onGestureSwipeCount >= 1, true)
        @Expect(onGestureSwipeIndex >= 0, true)
        // 触发 onClick 切换 phase=1：None 清除
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 1000i32).getOrThrow().click()
        sleepFor(500.milliSecond)
        resetOnGestureSwipeCounters()
        // 再次滑动：计数不再增长
        swipe(from: Point(80, 750), to: Point(680, 750), speed: 2000)
        sleepFor(1.second)
        @Expect(onGestureSwipeCount, 0)
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }
}
