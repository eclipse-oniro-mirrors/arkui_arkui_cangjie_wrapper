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
import ohos_app_cangjie_entry.tab_oncontentwillchange.*

/*
 * 事件计数复位：每个 @TestCase 前置调用。
 */
func resetOnContentWillChangeCounters(): Unit {
    onContentWillChangeCount = 0
    onContentWillChangeIndex = -1
    onContentWillChangeTargetIndex = -1
    onContentWillChangeReturn = true
}

/*
 * 公共驱动：launch 指定 View（1~5）→ 点击 testButton → 等待 Tabs 挂载。
 */
func launchTabOnContentWillChangeView(viewIndex: Int64, suiteText: String, caseText: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_Tab_onContentWillChange_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_Tab_onContentWillChange_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_Tab_onContentWillChange_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_Tab_onContentWillChange_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_Tab_onContentWillChange_5(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000i32)
}

@Test
class Tab_onContentWillChange_test {
    /*
     * @tc.number    : TestTabs_onContentWillChange_001
     * @tc.name      : TestCase_1
     * @tc.desc      : onContentWillChange returns true, switch completes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        resetOnContentWillChangeCounters()
        launchTabOnContentWillChangeView(1, "Tab_onContentWillChange_test", "TestCase_1")
        // 点击 tabBar "blue" 切换 0 → 1
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onContentWillChangeCount, 1)
        @Expect(onContentWillChangeIndex, 0)
        @Expect(onContentWillChangeTargetIndex, 1)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"1\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTabs_onContentWillChange_002
     * @tc.name      : TestCase_2
     * @tc.desc      : no onContentWillChange registered, switch completes (pass-through)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        resetOnContentWillChangeCounters()
        launchTabOnContentWillChangeView(2, "Tab_onContentWillChange_test", "TestCase_2")
        // 点击 tabBar "blue" 切换 0 → 1
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onContentWillChangeCount, 0)
        @Expect(onContentWillChangeIndex, -1)
        @Expect(onContentWillChangeTargetIndex, -1)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"1\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTabs_onContentWillChange_003
     * @tc.name      : TestCase_3
     * @tc.desc      : click currently selected tab, targetIndex==index, callback not fired
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        resetOnContentWillChangeCounters()
        launchTabOnContentWillChangeView(3, "Tab_onContentWillChange_test", "TestCase_3")
        // 点击当前已选中的第一个 tab（targetIndex==index==0）
        TestDriver.driver.waitForComponent(On().text("green"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onContentWillChangeCount, 0)
        @Expect(onContentWillChangeIndex, -1)
        @Expect(onContentWillChangeTargetIndex, -1)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"0\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTabs_onContentWillChange_004
     * @tc.name      : TestCase_4
     * @tc.desc      : onContentWillChange returns false, switch intercepted, index unchanged
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        resetOnContentWillChangeCounters()
        launchTabOnContentWillChangeView(4, "Tab_onContentWillChange_test", "TestCase_4")
        // onContentWillChange 返回 false，切换被拦截，index 保持 0
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onContentWillChangeCount, 1)
        @Expect(onContentWillChangeIndex, 0)
        @Expect(onContentWillChangeTargetIndex, 1)
        let tabIndex = getSwiperChildAttr("Tabs_comattr_id", "index")
        @Expect(tabIndex, "\"0\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestTabs_onContentWillChange_005
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
        resetOnContentWillChangeCounters()
        launchTabOnContentWillChangeView(5, "Tab_onContentWillChange_test", "TestCase_5")
        // phase=0：注册态触发一次，点击 tabBar "blue" 切换 0 → 1
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onContentWillChangeCount, 1)
        @Expect(onContentWillChangeIndex, 0)
        @Expect(onContentWillChangeTargetIndex, 1)
        // 触发 onClick 切换 phase=1：None 清除
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 1000i32).getOrThrow().click()
        sleepFor(500.milliSecond)
        resetOnContentWillChangeCounters()
        // 回到 index=0 后再次切换：计数不再增长
        TestDriver.driver.waitForComponent(On().text("blue"), 3000i32).getOrThrow().click()
        sleepFor(1.second)
        @Expect(onContentWillChangeCount, 0)
        @Expect(onContentWillChangeIndex, -1)
        @Expect(onContentWillChangeTargetIndex, -1)
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }
}