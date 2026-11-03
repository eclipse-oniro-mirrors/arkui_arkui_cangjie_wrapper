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
import ohos_app_cangjie_entry.tab_ontabbarclick.*

/*
 * 事件计数复位：每个 @TestCase 前置调用。
 */
func resetOnTabBarClickCounters(): Unit {
    onTabBarClickCount = 0
    onTabBarClickLastIndex = -1
}

/*
 * 公共驱动：launch 指定 View（1~4）→ 点击 testButton → 等待 Tabs 挂载。
 */
func launchTabOnTabBarClickView(viewIndex: Int64, suiteText: String, caseText: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_Tab_onTabBarClick_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_Tab_onTabBarClick_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_Tab_onTabBarClick_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_Tab_onTabBarClick_4(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000i32)
}

@Test
class Tab_onTabBarClick_test {
    /*
     * @tc.number    : TestTabs_onTabBarClick_001
     * @tc.name      : TestCase_1
     * @tc.desc      : click second tab label, callback fires once with index 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        resetOnTabBarClickCounters()
        launchTabOnTabBarClickView(1, "Tab_onTabBarClick_test", "TestCase_1")
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onTabBarClickCount, 1)
        @Expect(onTabBarClickLastIndex, 1)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"1\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTabs_onTabBarClick_002
     * @tc.name      : TestCase_2
     * @tc.desc      : no onTabBarClick registered, click first tab, no crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        resetOnTabBarClickCounters()
        launchTabOnTabBarClickView(2, "Tab_onTabBarClick_test", "TestCase_2")
        TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onTabBarClickCount, 0)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"0\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTabs_onTabBarClick_003
     * @tc.name      : TestCase_3
     * @tc.desc      : click currently selected tab, callback fires, index unchanged
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        resetOnTabBarClickCounters()
        launchTabOnTabBarClickView(3, "Tab_onTabBarClick_test", "TestCase_3")
        // 点击当前已选中的第一个 tab（index==0），回调触发但不切换
        let tab = TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow()
        tab.click()
        sleepFor(1.second)
        @Expect(onTabBarClickCount, 1)
        @Expect(onTabBarClickLastIndex, 0)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"0\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTabs_onTabBarClick_004
     * @tc.name      : TestCase_4
     * @tc.desc      : register then None clears, counter stops growing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        resetOnTabBarClickCounters()
        launchTabOnTabBarClickView(4, "Tab_onTabBarClick_test", "TestCase_4")
        // phase=0：注册态触发一次
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onTabBarClickCount, 1)
        // 触发 onClick 切换 phase=1：None 清除
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 1000i32).getOrThrow().click()
        sleepFor(500.milliSecond)
        resetOnTabBarClickCounters()
        // 再次点击 tab：计数不再增长
        TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onTabBarClickCount, 0)
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }
}
