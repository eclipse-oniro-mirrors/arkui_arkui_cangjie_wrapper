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
import ohos_app_cangjie_entry.tab_divider.*
import kit.ArkUI.getInspectorByKey
import std.convert.*

/*
 * 断言辅助：从 inspector JSON 串中取 divider 子字段。
 * getInspectorByKey 返回组件 $attrs JSON 串，divider 为 JSON 对象文本。
 */
func getDividerField(id: String, field: String): String {
    let inspector = getInspectorByKey(id)
    let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
    let divider = attrs.get("divider").getOrThrow().asObject()
    return divider.get(field).getOrThrow().toString()
}

/*
 * 公共驱动：launch 指定 View（编号 1~18）→ 点击 testButton → 等待 Tabs 组件就绪。
 */
func launchTabDividerView(viewIndex: Int64, suiteText: String, caseText: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_Tab_divider_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_Tab_divider_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_Tab_divider_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_Tab_divider_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_Tab_divider_5(Option<CustomView>.None)}
            case 6 => modtestView[0] = {_:CustomView => View_Tab_divider_6(Option<CustomView>.None)}
            case 7 => modtestView[0] = {_:CustomView => View_Tab_divider_7(Option<CustomView>.None)}
            case 8 => modtestView[0] = {_:CustomView => View_Tab_divider_8(Option<CustomView>.None)}
            case 9 => modtestView[0] = {_:CustomView => View_Tab_divider_9(Option<CustomView>.None)}
            case 10 => modtestView[0] = {_:CustomView => View_Tab_divider_10(Option<CustomView>.None)}
            case 11 => modtestView[0] = {_:CustomView => View_Tab_divider_11(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id("Tabs_comattr_id"), 3000i32)
}

@Test
class Tab_divider_test {
    /*
     * @tc.number    : TestTabs_divider_001
     * @tc.name      : TestCase_1
     * @tc.desc      : divider all four params assert inspector fields
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        launchTabDividerView(1, "Tab_divider_test", "TestCase_1")
        @Expect(getDividerField("Tabs_comattr_id", "strokeWidth"), "\"1.00vp\"")
        @Expect(getDividerField("Tabs_comattr_id", "startMargin"), "\"2.00vp\"")
        @Expect(getDividerField("Tabs_comattr_id", "endMargin"), "\"3.00vp\"")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#FFFF0000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_002
     * @tc.name      : TestCase_2
     * @tc.desc      : divider all-zero boundary strokeWidth/color/margins
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        launchTabDividerView(2, "Tab_divider_test", "TestCase_2")
        @Expect(getDividerField("Tabs_comattr_id", "strokeWidth"), "\"0.00vp\"")
        @Expect(getDividerField("Tabs_comattr_id", "startMargin"), "\"0.00vp\"")
        @Expect(getDividerField("Tabs_comattr_id", "endMargin"), "\"0.00vp\"")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#00000000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_003
     * @tc.name      : TestCase_3
     * @tc.desc      : divider Option.None resets, fields fallback to defaults
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        launchTabDividerView(3, "Tab_divider_test", "TestCase_3")
        // divider() 全参数 None，走 SetDividerV2，各字段 Reset/主题色，divider.isNull=false
        @Expect(getDividerField("Tabs_comattr_id", "strokeWidth"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "startMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "endMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#33000000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_004
     * @tc.name      : TestCase_4
     * @tc.desc      : divider interface not invoked, fields fallback to defaults
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        launchTabDividerView(4, "Tab_divider_test", "TestCase_4")
        let inspector = getInspectorByKey("Tabs_comattr_id")
        let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
        @Expect(attrs.get("divider").getOrThrow().toString(), "{}")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_005
     * @tc.name      : TestCase_5
     * @tc.desc      : divider DividerStyle all-None via ctor defaults
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        launchTabDividerView(5, "Tab_divider_test", "TestCase_5")
        // 四参数全部显式 None，走 SetDividerV2，各字段 Reset/主题色，divider.isNull=false
        @Expect(getDividerField("Tabs_comattr_id", "strokeWidth"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "startMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "endMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#33000000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_006
     * @tc.name      : TestCase_6
     * @tc.desc      : divider Length upper bound Float64.Max, all fields parse ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_6 begins.")
        launchTabDividerView(6, "Tab_divider_test", "TestCase_6")
        @Expect(Float64.parse(getDividerField("Tabs_comattr_id", "strokeWidth").replace("vp", "").replace("\"", "")), Float64.Max)
        @Expect(Float64.parse(getDividerField("Tabs_comattr_id", "startMargin").replace("vp", "").replace("\"", "")), Float64.Max)
        @Expect(Float64.parse(getDividerField("Tabs_comattr_id", "endMargin").replace("vp", "").replace("\"", "")), Float64.Max)
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#FFFF0000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_6 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_007
     * @tc.name      : TestCase_7
     * @tc.desc      : divider negative Length fallback to 0, no crash
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_7 begins.")
        launchTabDividerView(7, "Tab_divider_test", "TestCase_7")
        @Expect(getDividerField("Tabs_comattr_id", "strokeWidth"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "startMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "endMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#FFFF0000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_7 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_008
     * @tc.name      : TestCase_8
     * @tc.desc      : divider percent Length not supported, NG fallback parse ok
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_8 begins.")
        launchTabDividerView(8, "Tab_divider_test", "TestCase_8")
        // percent 不在 Length 支持单位内，不抛异常，走 Reset 路径回退默认值 0.00px
        @Expect(getDividerField("Tabs_comattr_id", "strokeWidth"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "startMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "endMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#FFFF0000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_8 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_009
     * @tc.name      : TestCase_9
     * @tc.desc      : divider startMargin/endMargin omitted via ctor defaults 0.vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_9(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_9 begins.")
        launchTabDividerView(9, "Tab_divider_test", "TestCase_9")
        @Expect(getDividerField("Tabs_comattr_id", "strokeWidth"), "\"1.00vp\"")
        @Expect(getDividerField("Tabs_comattr_id", "startMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "endMargin"), "\"0.00px\"")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#33000000\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_9 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_010
     * @tc.name      : TestCase_10
     * @tc.desc      : divider color UInt32 0xFFFFFFFF upper bound
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_10(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_10 begins.")
        launchTabDividerView(10, "Tab_divider_test", "TestCase_10")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#FFFFFFFF\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_10 ends.")
    }

    /*
     * @tc.number    : TestTabs_divider_011
     * @tc.name      : TestCase_11
     * @tc.desc      : divider color UInt32 0x00FFFFFF alpha=0 alphaAdapt
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_11(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_11 begins.")
        launchTabDividerView(11, "Tab_divider_test", "TestCase_11")
        @Expect(getDividerField("Tabs_comattr_id", "color"), "\"#00FFFFFF\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_11 ends.")
    }
}