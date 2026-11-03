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
import ohos_app_cangjie_entry.textinput_halfleading.*

/*
 * 公共驱动：launch 指定 View（编号 1~4）→ 点击 testButton → 等待被测组件挂载。
 */
func launchHalfLeadingView(viewIndex: Int64, suiteText: String, caseText: String, targetId: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_TextInput_halfLeading_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_TextInput_halfLeading_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_TextInput_halfLeading_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_TextInput_halfLeading_4(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id(targetId), 3000i32)
}

@Test
class TextInput_halfLeading_test {
    /* ═══════════════════════════════════════════════════
     * 接口3 TextInput.halfLeading — BC 基准值: true
     * ═══════════════════════════════════════════════════ */

    /*
     * @tc.number    : TestTextInput_halfLeading_001
     * @tc.name      : TestCase_1
     * @tc.desc      : BC 基准·全基准值 halfLeading(true)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        launchHalfLeadingView(1, "TextInput_halfLeading_test", "TestCase_1", "TextInput_comattr_id")
        let halfLeading = getInspectorAttr("TextInput_comattr_id", "halfLeading")
        @Expect(halfLeading, "true")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTextInput_halfLeading_002
     * @tc.name      : TestCase_2
     * @tc.desc      : BC·变化 value=false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        launchHalfLeadingView(2, "TextInput_halfLeading_test", "TestCase_2", "TextInput_comattr_id")
        let halfLeading = getInspectorAttr("TextInput_comattr_id", "halfLeading")
        @Expect(halfLeading, "false")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTextInput_halfLeading_003
     * @tc.name      : TestCase_3
     * @tc.desc      : BC·None Reset halfLeading(Option.None)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        launchHalfLeadingView(3, "TextInput_halfLeading_test", "TestCase_3", "TextInput_comattr_id")
        let halfLeading = getInspectorAttr("TextInput_comattr_id", "halfLeading")
        @Expect(halfLeading, "false")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTextInput_halfLeading_004
     * @tc.name      : TestCase_4
     * @tc.desc      : BC·默认值 不调用 halfLeading
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        launchHalfLeadingView(4, "TextInput_halfLeading_test", "TestCase_4", "TextInput_comattr_id")
        let halfLeading = getInspectorAttr("TextInput_comattr_id", "halfLeading")
        @Expect(halfLeading, "false")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }
}
