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
import ohos_app_cangjie_entry.tab_onanimationstart.*

/*
 * 事件计数复位：每个 @TestCase 前置调用。
 */
func resetOnAnimationStartCounters(): Unit {
    onAnimationStartCount = 0
    onAnimationStartIndex = -1
    onAnimationStartTargetIndex = -1
    onAnimationStartTargetOffset = 0.0
    onAnimationStartCurrentOffset = 0.0
    onAnimationStartVelocity = -1.0
}

/*
 * 公共驱动：launch 指定 View（1~5）→ 点击 testButton → 等待 Tabs 挂载。
 */
func launchTabOnAnimationStartView(viewIndex: Int64, suiteText: String, caseText: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_Tab_onAnimationStart_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_Tab_onAnimationStart_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_Tab_onAnimationStart_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_Tab_onAnimationStart_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_Tab_onAnimationStart_5(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000i32)
}

@Test
class Tab_onAnimationStart_test {
    /*
     * @tc.number    : TestTabs_onAnimationStart_001
     * @tc.name      : TestCase_1
     * @tc.desc      : swipe from index 0 to 1, onAnimationStart fires once with correct args
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        resetOnAnimationStartCounters()
        launchTabOnAnimationStartView(1, "Tab_onAnimationStart_test", "TestCase_1")
        // 点击 tabBar "blue" 切换 0 → 1
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onAnimationStartCount, 1)
        @Expect(onAnimationStartIndex, 0)
        @Expect(onAnimationStartTargetIndex, 1)
        @Expect(onAnimationStartTargetOffset >= 0.0, true)
        @Expect(onAnimationStartCurrentOffset >= 0.0, true)
        @Expect(onAnimationStartVelocity >= 0.0, true)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"1\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTabs_onAnimationStart_002
     * @tc.name      : TestCase_2
     * @tc.desc      : swipe without registered onAnimationStart, switch completes, no crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        resetOnAnimationStartCounters()
        launchTabOnAnimationStartView(2, "Tab_onAnimationStart_test", "TestCase_2")
        // 点击 tabBar "blue" 切换 0 → 1
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"1\"")
        @Expect(onAnimationStartCount, 0)
        @Expect(onAnimationStartIndex, -1)
        @Expect(onAnimationStartTargetIndex, -1)
        @Expect(onAnimationStartTargetOffset, 0.0)
        @Expect(onAnimationStartCurrentOffset, 0.0)
        @Expect(onAnimationStartVelocity, -1.0)
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTabs_onAnimationStart_003
     * @tc.name      : TestCase_3
     * @tc.desc      : swipe at last page toward end, no target, callback not fired
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        resetOnAnimationStartCounters()
        launchTabOnAnimationStartView(3, "Tab_onAnimationStart_test", "TestCase_3")
        // initialIndex=2 末页，点击当前 tab "orange" 不切换
        TestDriver.driver.waitForComponent(On().text("orange"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onAnimationStartCount, 0)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"2\"")
        @Expect(onAnimationStartTargetIndex, -1)
        @Expect(onAnimationStartTargetOffset, 0.0)
        @Expect(onAnimationStartCurrentOffset, 0.0)
        @Expect(onAnimationStartVelocity, -1.0)
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTabs_onAnimationStart_004
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
        resetOnAnimationStartCounters()
        launchTabOnAnimationStartView(4, "Tab_onAnimationStart_test", "TestCase_4")
        // initialIndex=1，点击 tabBar "green" 切换 1 → 0
        TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onAnimationStartCount, 1)
        @Expect(onAnimationStartIndex, 1)
        @Expect(onAnimationStartTargetIndex, 0)
        @Expect(onAnimationStartTargetOffset <= 0.0, true)
        @Expect(onAnimationStartCurrentOffset <= 0.0, true)
        @Expect(onAnimationStartVelocity >= 0.0, true)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"0\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestTabs_onAnimationStart_005
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
        resetOnAnimationStartCounters()
        launchTabOnAnimationStartView(5, "Tab_onAnimationStart_test", "TestCase_5")
        // phase=0：注册态触发一次
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onAnimationStartCount, 1)
        @Expect(onAnimationStartIndex, 0)
        @Expect(onAnimationStartTargetIndex, 1)
        @Expect(onAnimationStartTargetOffset >= 0.0, true)
        @Expect(onAnimationStartCurrentOffset >= 0.0, true)
        @Expect(onAnimationStartVelocity >= 0.0, true)
        // 触发 onClick 切换 phase=1：None 清除
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 1000i32).getOrThrow().click()
        sleepFor(500.milliSecond)
        resetOnAnimationStartCounters()
        // 再次切换：计数不再增长（None 分支已注册空闭包）
        TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().text("green"), 2000i32)
        @Expect(onAnimationStartCount, 0)
        @Expect(onAnimationStartIndex, -1)
        @Expect(onAnimationStartTargetIndex, -1)
        @Expect(onAnimationStartTargetOffset, 0.0)
        @Expect(onAnimationStartCurrentOffset, 0.0)
        @Expect(onAnimationStartVelocity, -1.0)
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }
}