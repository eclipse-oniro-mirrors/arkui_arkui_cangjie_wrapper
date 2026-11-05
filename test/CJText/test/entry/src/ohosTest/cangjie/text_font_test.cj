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
import std.collection.*
import ohos.base.*
import kit.ArkData.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.app.ability.ability_delegator_registry.*
import kit.AbilityKit.{Ability, AbilityStage, Want, LaunchParam, LaunchReason}
import ohos.ui_test.*
import ohos_app_cangjie_entry.modtestSuiteText
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestView
import ohos.arkui.component.custom_component.CustomView
import ohos_app_cangjie_entry.text_font.*
import kit.ArkUI.getInspectorByKey

/*
 * 断言辅助：通过 Screen.getTheOnlyUiComponentWhoseIdEqualsTo 获取 Text 组件属性字段。
 * Text 组件 inspector 不 dump fontSize，size 项无法经 inspector 断言（豁免，见矩阵）。
 * 对于 Float64.Max.fp 等字号过大导致组件不可见的场景，回退到 getInspectorByKey 方式。
 */
func getInspectorAttr(id: String, field: String): String {
    let inspector = getInspectorByKey(id)
    let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
    return attrs.get(field).getOrThrow().toString()
}

@Test
class Text_font_test {
    /*
     * @tc.number    : TestText_font_001
     * @tc.name      : TestCase_1
     * @tc.desc      : BC 基准用例·全基准值 font(16.fp, Normal, "HarmonyOS Sans", Normal)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_1"
            modtestView[0] = {_:CustomView => View_Text_font_1(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        TestDriver.driver.waitForComponent(On().id("Text_base_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_base_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_base_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_base_id")["fontStyle"], "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestText_font_002
     * @tc.name      : TestCase_2
     * @tc.desc      : BC·变化 size 有效边界 0.fp / 1.fp / Float64.Max，其余基准
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_2"
            modtestView[0] = {_:CustomView => View_Text_font_2(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // size 0.fp：下边界 0 放行透传，0 字号由 NG 层处理（size 走行为验证豁免）
        TestDriver.driver.waitForComponent(On().id("Text_0fp_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_0fp_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_0fp_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_0fp_id")["fontStyle"], "\"FontStyle.Normal\"")
        // size 1.fp：最小正字号
        TestDriver.driver.waitForComponent(On().id("Text_1fp_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_1fp_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_1fp_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_1fp_id")["fontStyle"], "\"FontStyle.Normal\"")
        // size Float64.Max：有效上界放行透传（字号过大组件不可见，使用 inspector 断言）
        @Expect(getInspectorAttr("Text_max_id", "fontWeight"), "\"FontWeight.Normal\"")
        @Expect(getInspectorAttr("Text_max_id", "fontFamily"), "\"HarmonyOS Sans\"")
        @Expect(getInspectorAttr("Text_max_id", "fontStyle"), "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestText_font_003
     * @tc.name      : TestCase_3
     * @tc.desc      : BC·变化 size 无效值 -5.fp / 50.percent，其余基准
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_3"
            modtestView[0] = {_:CustomView => View_Text_font_3(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // size -5.fp：负值跳过不生效
        TestDriver.driver.waitForComponent(On().id("Text_neg_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_neg_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_neg_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_neg_id")["fontStyle"], "\"FontStyle.Normal\"")
        // size 50.percent：百分比跳过不生效
        TestDriver.driver.waitForComponent(On().id("Text_pct_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_pct_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_pct_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_pct_id")["fontStyle"], "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestText_font_004
     * @tc.name      : TestCase_4
     * @tc.desc      : BC·变化 weight W900 / W400，其余基准
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_4"
            modtestView[0] = {_:CustomView => View_Text_font_4(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // weight W900：上界
        TestDriver.driver.waitForComponent(On().id("Text_w900_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_w900_id")["fontWeight"], "\"900\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_w900_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_w900_id")["fontStyle"], "\"FontStyle.Normal\"")
        // weight W400：中间值
        TestDriver.driver.waitForComponent(On().id("Text_w400_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_w400_id")["fontWeight"], "\"400\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_w400_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_w400_id")["fontStyle"], "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestText_font_005
     * @tc.name      : TestCase_5
     * @tc.desc      : BC·变化 family 有效值 "Arial" / "Arial,HarmonyOS Sans"，其余基准
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_5"
            modtestView[0] = {_:CustomView => View_Text_font_5(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // family "Arial"：单字体
        TestDriver.driver.waitForComponent(On().id("Text_arial_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_arial_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_arial_id")["fontFamily"], "\"Arial\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_arial_id")["fontStyle"], "\"FontStyle.Normal\"")
        // family "Arial,HarmonyOS Sans"：多字体逗号分隔
        TestDriver.driver.waitForComponent(On().id("Text_multi_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_multi_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_multi_id")["fontFamily"], "\"Arial,HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_multi_id")["fontStyle"], "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }

    /*
     * @tc.number    : TestText_font_006
     * @tc.name      : TestCase_6
     * @tc.desc      : BC·变化 family 无效空串 ""，其余基准
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_6 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_6"
            modtestView[0] = {_:CustomView => View_Text_font_6(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // family ""：空串跳过保持默认
        TestDriver.driver.waitForComponent(On().id("Text_empty_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_empty_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_empty_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_empty_id")["fontStyle"], "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_6 ends.")
    }

    /*
     * @tc.number    : TestText_font_007
     * @tc.name      : TestCase_7
     * @tc.desc      : BC·变化 family 超过100个字符的字符串，其余基准
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_7 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_7"
            modtestView[0] = {_:CustomView => View_Text_font_7(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // style Italic：斜体
        TestDriver.driver.waitForComponent(On().id("Text_long_id"), 3000i32)
        var family: String = "\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                         "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb" +
                         "ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" +
                         "ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd" +
                         "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\""
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_long_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_long_id")["fontFamily"], family)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_long_id")["fontStyle"], "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_7 ends.")
    }

    /*
     * @tc.number    : TestText_font_008
     * @tc.name      : TestCase_8
     * @tc.desc      : BC·变化 style FontStyle.Italic，其余基准
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_8 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_8"
            modtestView[0] = {_:CustomView => View_Text_font_8(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // style Italic：斜体
        TestDriver.driver.waitForComponent(On().id("Text_italic_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_italic_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_italic_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_italic_id")["fontStyle"], "\"FontStyle.Italic\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_8 ends.")
    }

    /*
     * @tc.number    : TestText_font_009
     * @tc.name      : TestCase_9
     * @tc.desc      : BC·默认值专项 font() 不传参 / 不调用 font()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_9(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_9 begins.")
        TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
        launch{
            modtestSuiteText[0] = "Text_font_test"
            modtestCaseText[0] = "TestCase_9"
            modtestView[0] = {_:CustomView => View_Text_font_9(Option<CustomView>.None)}
        }
        TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
        // font() 不传参：等同全部 None，先 ResetFont 后无 Set
        TestDriver.driver.waitForComponent(On().id("Text_nofont_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_nofont_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_nofont_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_nofont_id")["fontStyle"], "\"FontStyle.Normal\"")
        // 不调用 font 接口：无 ResetFont 无 Set
        TestDriver.driver.waitForComponent(On().id("Text_nocall_id"), 3000i32)
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_nocall_id")["fontWeight"], "\"FontWeight.Normal\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_nocall_id")["fontFamily"], "\"HarmonyOS Sans\"")
        @Expect(Screen.getTheOnlyUiComponentWhoseIdEqualsTo("Text_nocall_id")["fontStyle"], "\"FontStyle.Normal\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_9 ends.")
    }
}