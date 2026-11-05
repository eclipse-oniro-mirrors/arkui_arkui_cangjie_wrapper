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
import ohos_app_cangjie_entry.textinput_textindent.*

/*
 * 公共驱动：launch 指定 View（编号 1~8）→ 点击 testButton → 等待被测组件挂载。
 */
func launchTextIndentView(viewIndex: Int64, suiteText: String, caseText: String, targetId: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_5(Option<CustomView>.None)}
            case 6 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_6(Option<CustomView>.None)}
            case 7 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_7(Option<CustomView>.None)}
            case 8 => modtestView[0] = {_:CustomView => View_TextInput_textIndent_8(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id(targetId), 3000i32)
}

@Test
class TextInput_textIndent_test {
    /* ═══════════════════════════════════════════════════
     * 接口4 TextInput.textIndent — BC 基准值: 10.vp
     * textIndent 在 inspector $attrs 通道，属性值断言 textIndent
     * ═══════════════════════════════════════════════════ */

    /*
     * @tc.number    : TestTextInput_textIndent_001
     * @tc.name      : TestCase_1
     * @tc.desc      : BC 基准·全基准值 textIndent(10.vp)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        launchTextIndentView(1, "TextInput_textIndent_test", "TestCase_1", "TextInput_comattr_id")
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        @Expect(textIndent, "\"10.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTextInput_textIndent_002
     * @tc.name      : TestCase_2
     * @tc.desc      : BC·变化 value 边界 0.vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        launchTextIndentView(2, "TextInput_textIndent_test", "TestCase_2", "TextInput_comattr_id")
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        @Expect(textIndent, "\"0.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTextInput_textIndent_003
     * @tc.name      : TestCase_3
     * @tc.desc      : BC·变化 value 边界 Float64.Max.vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        launchTextIndentView(3, "TextInput_textIndent_test", "TestCase_3", "TextInput_comattr_id")
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        // Float64.Max 序列化值（V2 通道透传不钳制）
        @Expect(textIndent.contains("vp"), true)
        Hilog.info(0u32, "CangjieTest", "textIndent=${textIndent}")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTextInput_textIndent_004
     * @tc.name      : TestCase_4
     * @tc.desc      : BC·变化 value 无效 Float64.Min.vp（V2 通道透传不钳制）
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        launchTextIndentView(4, "TextInput_textIndent_test", "TestCase_4", "TextInput_comattr_id")
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        // Float64.Min 序列化值（V2 通道透传负值不钳制、布局层按 0 处理仅影响渲染）
        @Expect(textIndent.contains("vp"), true)
        Hilog.info(0u32, "CangjieTest", "textIndent=${textIndent}")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestTextInput_textIndent_005
     * @tc.name      : TestCase_5
     * @tc.desc      : BC·变化 value 无效负值 (-5).vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        launchTextIndentView(5, "TextInput_textIndent_test", "TestCase_5", "TextInput_comattr_id")
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        @Expect(textIndent, "\"-5.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }

    /*
     * @tc.number    : TestTextInput_textIndent_006
     * @tc.name      : TestCase_6
     * @tc.desc      : BC·变化 value 百分比 50.percent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_6 begins.")
        launchTextIndentView(6, "TextInput_textIndent_test", "TestCase_6", "TextInput_comattr_id")
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        @Expect(textIndent, "\"50.00%\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_6 ends.")
    }

    /*
     * @tc.number    : TestTextInput_textIndent_007
     * @tc.name      : TestCase_7
     * @tc.desc      : BC·默认值 Option<Length>.None（None 走 ResetTextIndent 恢复默认 0）
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_7 begins.")
        launchTextIndentView(7, "TextInput_textIndent_test", "TestCase_7", "TextInput_comattr_id")
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        @Expect(textIndent, "\"0.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_7 ends.")
    }

    /*
     * @tc.number    : TestTextInput_textIndent_008
     * @tc.name      : TestCase_8
     * @tc.desc      : BC·默认值 不调用 textIndent（系统默认 0，inspector 不输出 textIndent 字段）
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_8 begins.")
        launchTextIndentView(8, "TextInput_textIndent_test", "TestCase_8", "TextInput_comattr_id")
        // 不调用接口：系统默认 0，inspector 输出 textIndent 字段
        let textIndent = getInspectorAttr("TextInput_comattr_id", "textIndent")
        @Expect(textIndent, "\"0.00vp\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_8 ends.")
    }
}
