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
import ohos_app_cangjie_entry.span_lineheight.*
import kit.ArkUI.getInspectorTree

/*
 * 断言说明：
 * Span 为 Text 子组件，getInspectorByKey 不返回 $children，改用 getInspectorTree 获取完整组件树，
 * 递归查找 $attrs.id 等于 textId 的 Text 节点 → $children[0]（Span）→ $attrs.lineHeight 断言行高。
 * TestCase_008（不调用接口）默认值为 0.00px。
 */
func findTextNodeById(node: JsonObject, textId: String): ?JsonObject {
    let attrsOpt = node.get("$attrs")
    if (attrsOpt.isSome()) {
        let attrs = attrsOpt.getOrThrow().asObject()
        let idOpt = attrs.get("id")
        if (idOpt.isSome()) {
            if (idOpt.getOrThrow().toString() == "\"" + textId + "\"") {
                return node
            }
        }
    }
    let childrenOpt = node.get("$children")
    if (childrenOpt.isSome()) {
        let children = childrenOpt.getOrThrow().asArray()
        for (i in 0..children.size()) {
            let child = children.get(i).getOrThrow().asObject()
            let result = findTextNodeById(child, textId)
            if (result.isSome()) {
                return result
            }
        }
    }
    return Option<JsonObject>.None
}

func getSpanLineHeight(textId: String): String {
    let tree = getInspectorTree()
    let root = JsonValue.fromStr(tree).asObject()
    let textNode = findTextNodeById(root, textId).getOrThrow()
    let children = textNode.get("$children").getOrThrow().asArray()
    let spanAttrs = children.get(0).getOrThrow().asObject().get("$attrs").getOrThrow().asObject()
    return spanAttrs.get("lineHeight").getOrThrow().toString()
}

/*
 * 公共驱动：launch 指定 View（编号 1~8）→ 点击 testButton → 等待被测组件挂载。
 */
func launchSpanLineHeightView(viewIndex: Int64, suiteText: String, caseText: String, targetId: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_Span_lineHeight_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_Span_lineHeight_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_Span_lineHeight_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_Span_lineHeight_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_Span_lineHeight_5(Option<CustomView>.None)}
            case 6 => modtestView[0] = {_:CustomView => View_Span_lineHeight_6(Option<CustomView>.None)}
            case 7 => modtestView[0] = {_:CustomView => View_Span_lineHeight_7(Option<CustomView>.None)}
            case 8 => modtestView[0] = {_:CustomView => View_Span_lineHeight_8(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id(targetId), 3000i32)
}

@Test
class Span_lineHeight_test {
    /* ═══════════════════════════════════════════════════
     * 接口5 Span.lineHeight — BC 基准值: 30.fp
     * ═══════════════════════════════════════════════════ */

    /*
     * @tc.number    : TestSpan_lineHeight_001
     * @tc.name      : TestCase_1
     * @tc.desc      : BC 基准·全基准值 Span.lineHeight(30.fp)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        launchSpanLineHeightView(1, "Span_lineHeight_test", "TestCase_1", "Text_span_id")
        let lineHeight = getSpanLineHeight("Text_span_id")
        @Expect(lineHeight, "\"30.00fp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestSpan_lineHeight_002
     * @tc.name      : TestCase_2
     * @tc.desc      : BC·变化 value 边界 0.fp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        launchSpanLineHeightView(2, "Span_lineHeight_test", "TestCase_2", "Text_span_id")
        let lineHeight = getSpanLineHeight("Text_span_id")
        @Expect(lineHeight, "\"0.00fp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestSpan_lineHeight_003
     * @tc.name      : TestCase_3
     * @tc.desc      : BC·变化 value 边界 Float64.Max.fp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        launchSpanLineHeightView(3, "Span_lineHeight_test", "TestCase_3", "Text_span_id")
        let lineHeight = getSpanLineHeight("Text_span_id")
        // Float64.Max 序列化值（极大值透传不溢出崩溃）
        @Expect(lineHeight.contains("fp"), true)
        Hilog.info(0u32, "CangjieTest", "lineHeight=${lineHeight}")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestSpan_lineHeight_004
     * @tc.name      : TestCase_4
     * @tc.desc      : BC·变化 value 无效 Float64.Min.fp（wrapper 层钳制为 0）
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        launchSpanLineHeightView(4, "Span_lineHeight_test", "TestCase_4", "Text_span_id")
        // Float64.Min 在 wrapper 层钳制为 0（span.cj lineHeight 实现 if (v.value < 0.0) { v = 0.0.px }）
        let lineHeight = getSpanLineHeight("Text_span_id")
        @Expect(lineHeight, "\"0.00px\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestSpan_lineHeight_005
     * @tc.name      : TestCase_5
     * @tc.desc      : BC·变化 value 无效负值 (-10).fp（wrapper 层钳制为 0）
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        launchSpanLineHeightView(5, "Span_lineHeight_test", "TestCase_5", "Text_span_id")
        // 负值在 wrapper 层钳制为 0（span.cj lineHeight 实现 if (v.value < 0.0) { v = 0.0.px }）
        let lineHeight = getSpanLineHeight("Text_span_id")
        @Expect(lineHeight, "\"0.00px\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }

    /*
     * @tc.number    : TestSpan_lineHeight_006
     * @tc.name      : TestCase_6
     * @tc.desc      : BC·变化 value 百分比单位 50.percent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_6 begins.")
        launchSpanLineHeightView(6, "Span_lineHeight_test", "TestCase_6", "Text_span_id")
        let lineHeight = getSpanLineHeight("Text_span_id")
        @Expect(lineHeight, "\"50.00%\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_6 ends.")
    }

    /*
     * @tc.number    : TestSpan_lineHeight_007
     * @tc.name      : TestCase_7
     * @tc.desc      : BC·默认值 Option<Length>.None（特殊语义按 0.0.px 调用 SetLineHeight）
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_7 begins.")
        launchSpanLineHeightView(7, "Span_lineHeight_test", "TestCase_7", "Text_span_id")
        // None 分支：实现 value ?? 0.0.px，按 0 行高调用 SetLineHeight
        let lineHeight = getSpanLineHeight("Text_span_id")
        @Expect(lineHeight, "\"0.00px\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_7 ends.")
    }

    /*
     * @tc.number    : TestSpan_lineHeight_008
     * @tc.name      : TestCase_8
     * @tc.desc      : BC·默认值 不调用 lineHeight（默认值为 0.00px）
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_8 begins.")
        launchSpanLineHeightView(8, "Span_lineHeight_test", "TestCase_8", "Text_span_id")
        // 不调用接口：默认值为 0.00px
        let lineHeight = getSpanLineHeight("Text_span_id")
        @Expect(lineHeight, "\"0.00px\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_8 ends.")
    }
}
