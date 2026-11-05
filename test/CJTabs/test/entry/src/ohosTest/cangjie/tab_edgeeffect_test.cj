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
import ohos_app_cangjie_entry.tab_edgeeffect.*

/*
 * 从 inspector tree 中取 edgeEffect 属性值。
 * Tabs 节点的 edgeEffect 依赖子 Swiper 节点查找，getInspectorByKey 可能返回默认值，
 * 改用 getInspectorTree 遍历完整组件树，找到 Tabs 节点 → 子 Swiper 节点 → $attrs.effectMode。
 */
func getEdgeEffectAttribute(id: String): String {
    return getSwiperChildAttr(id, "effectMode")
}

/*
 * 公共驱动：launch 指定 View（编号 1~5）→ 点击 testButton → 等待 Tabs 组件就绪。
 */
func launchTabEdgeEffectView(viewIndex: Int64, suiteText: String, caseText: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_Tab_edgeEffect_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_Tab_edgeEffect_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_Tab_edgeEffect_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_Tab_edgeEffect_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_Tab_edgeEffect_5(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000i32)
}

@Test
class Tab_edgeEffect_test {
    /*
     * @tc.number    : TestTabs_edgeEffect_001
     * @tc.name      : TestCase_1
     * @tc.desc      : edgeEffect Fade normal value, assert "EdgeEffect.Fade"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        launchTabEdgeEffectView(1, "Tab_edgeEffect_test", "TestCase_1")
        let edgeEffect = getEdgeEffectAttribute("Tabs_comattr_id")
        @Expect(edgeEffect, "\"EdgeEffect.Fade\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTabs_edgeEffect_002
     * @tc.name      : TestCase_2
     * @tc.desc      : edgeEffect Spring explicit value, assert "EdgeEffect.Spring"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        launchTabEdgeEffectView(2, "Tab_edgeEffect_test", "TestCase_2")
        let edgeEffect = getEdgeEffectAttribute("Tabs_comattr_id")
        @Expect(edgeEffect, "\"EdgeEffect.Spring\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTabs_edgeEffect_003
     * @tc.name      : TestCase_3
     * @tc.desc      : edgeEffect default value, not call interface, assert "EdgeEffect.Spring"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        launchTabEdgeEffectView(3, "Tab_edgeEffect_test", "TestCase_3")
        let edgeEffect = getEdgeEffectAttribute("Tabs_comattr_id")
        @Expect(edgeEffect, "\"EdgeEffect.Spring\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTabs_edgeEffect_004
     * @tc.name      : TestCase_4
     * @tc.desc      : edgeEffect None boundary value, assert "EdgeEffect.None"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        launchTabEdgeEffectView(4, "Tab_edgeEffect_test", "TestCase_4")
        let edgeEffect = getEdgeEffectAttribute("Tabs_comattr_id")
        @Expect(edgeEffect, "\"EdgeEffect.None\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestTabs_edgeEffect_005
     * @tc.name      : TestCase_5
     * @tc.desc      : edgeEffect Fade -> Option.None defaults to Spring
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        launchTabEdgeEffectView(5, "Tab_edgeEffect_test", "TestCase_5")
        // phase=0 时 edgeEffect=Fade；点击后 phase=1 -> Option.None 默认 Spring
        let edgeEffect0 = getEdgeEffectAttribute("Tabs_comattr_id")
        @Expect(edgeEffect0, "\"EdgeEffect.Fade\"")
        // 触发 onClick 后重新读取
        TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 1000i32).getOrThrow().click()
        sleepFor(500.milliSecond)
        let edgeEffect1 = getEdgeEffectAttribute("Tabs_comattr_id")
        @Expect(edgeEffect1, "\"EdgeEffect.Spring\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }
}
