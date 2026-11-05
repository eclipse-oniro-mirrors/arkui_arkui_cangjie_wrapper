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
import ohos_app_cangjie_entry.textinput_ellipsismode.*
import kit.ArkUI.getInspectorByKey

/*
 * 断言辅助：inspector 取组件属性字段（$attrs）。
 * 共享函数：供 ellipsisMode/halfLeading/textIndent/textOverflow 四个测试文件使用。
 */
func getInspectorAttr(id: String, field: String): String {
    let inspector = getInspectorByKey(id)
    let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
    return attrs.get(field).getOrThrow().toString()
}

func hasInspectorAttr(id: String, field: String): Bool {
    let inspector = getInspectorByKey(id)
    let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
    return attrs.get(field).isSome()
}

/*
 * 公共驱动：launch 指定 View（编号 1~17）→ 点击 testButton → 等待被测组件挂载。
 */
func launchEllipsisModeView(viewIndex: Int64, suiteText: String, caseText: String, targetId: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000i32)
    launch{
        modtestSuiteText[0] = suiteText
        modtestCaseText[0] = caseText
        match (viewIndex) {
            case 1 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_1(Option<CustomView>.None)}
            case 2 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_2(Option<CustomView>.None)}
            case 3 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_3(Option<CustomView>.None)}
            case 4 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_4(Option<CustomView>.None)}
            case 5 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_5(Option<CustomView>.None)}
            case 6 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_6(Option<CustomView>.None)}
            case 7 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_7(Option<CustomView>.None)}
            case 8 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_8(Option<CustomView>.None)}
            case 9 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_9(Option<CustomView>.None)}
            case 10 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_10(Option<CustomView>.None)}
            case 11 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_11(Option<CustomView>.None)}
            case 12 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_12(Option<CustomView>.None)}
            case 13 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_13(Option<CustomView>.None)}
            case 14 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_14(Option<CustomView>.None)}
            case 15 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_15(Option<CustomView>.None)}
            case 16 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_16(Option<CustomView>.None)}
            case 17 => modtestView[0] = {_:CustomView => View_TextInput_ellipsisMode_17(Option<CustomView>.None)}
            case _ => ()
        }
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000i32).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id(targetId), 3000i32)
}

@Test
class TextInput_ellipsisMode_test {
    /* ═══════════════════════════════════════════════════
     * 接口2 TextInput.ellipsisMode — BC 基准值: End+maxLines(1)+overflow(Ellipsis)
     * ═══════════════════════════════════════════════════ */

    /*
     * @tc.number    : TestTextInput_ellipsisMode_001
     * @tc.name      : TestCase_1
     * @tc.desc      : BC 基准·全基准值 ellipsisMode(End)+maxLines(1)+overflow(Ellipsis)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_1 begins.")
        launchEllipsisModeView(1, "TextInput_ellipsisMode_test", "TestCase_1", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.END\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_1 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_002
     * @tc.name      : TestCase_2
     * @tc.desc      : BC·变化 mode=Start
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_2 begins.")
        launchEllipsisModeView(2, "TextInput_ellipsisMode_test", "TestCase_2", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.START\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_2 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_003
     * @tc.name      : TestCase_3
     * @tc.desc      : BC·变化 mode=Center
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_3 begins.")
        launchEllipsisModeView(3, "TextInput_ellipsisMode_test", "TestCase_3", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.CENTER\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_3 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_004
     * @tc.name      : TestCase_4
     * @tc.desc      : BC·变化 mode 边界 MultilineStart+maxLines(1)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_4 begins.")
        launchEllipsisModeView(4, "TextInput_ellipsisMode_test", "TestCase_4", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.MULTILINE_START\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_4 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_005
     * @tc.name      : TestCase_5
     * @tc.desc      : BC·变化 mode 边界 MultilineCenter+maxLines(1)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_5 begins.")
        launchEllipsisModeView(5, "TextInput_ellipsisMode_test", "TestCase_5", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.MULTILINE_CENTER\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_5 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_006
     * @tc.name      : TestCase_6
     * @tc.desc      : BC·None Reset ellipsisMode(Option.None)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_6 begins.")
        launchEllipsisModeView(6, "TextInput_ellipsisMode_test", "TestCase_6", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.END\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_6 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_007
     * @tc.name      : TestCase_7
     * @tc.desc      : BC·默认值 不调用 ellipsisMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_7 begins.")
        launchEllipsisModeView(7, "TextInput_ellipsisMode_test", "TestCase_7", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.END\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_7 ends.")
    }

    /* ═══════════════════════════════════════════════════
     * 编辑态 + maxLines(1)（条件2：Start/Center 生效；条件3：End/MultilineStart/MultilineCenter 正常生效）
     * ═══════════════════════════════════════════════════ */

    /*
     * @tc.number    : TestTextInput_ellipsisMode_008
     * @tc.name      : TestCase_8
     * @tc.desc      : BC·编辑态+maxLines(1)+Start
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_8 begins.")
        launchEllipsisModeView(8, "TextInput_ellipsisMode_test", "TestCase_8", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.START\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_8 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_009
     * @tc.name      : TestCase_9
     * @tc.desc      : BC·编辑态+maxLines(1)+Center
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_9(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_9 begins.")
        launchEllipsisModeView(9, "TextInput_ellipsisMode_test", "TestCase_9", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.CENTER\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_9 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_010
     * @tc.name      : TestCase_10
     * @tc.desc      : BC·编辑态+maxLines(1)+End
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_10(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_10 begins.")
        launchEllipsisModeView(10, "TextInput_ellipsisMode_test", "TestCase_10", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.END\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_10 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_011
     * @tc.name      : TestCase_11
     * @tc.desc      : BC·编辑态+maxLines(1)+MultilineStart
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_11(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_11 begins.")
        launchEllipsisModeView(11, "TextInput_ellipsisMode_test", "TestCase_11", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.MULTILINE_START\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_11 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_012
     * @tc.name      : TestCase_12
     * @tc.desc      : BC·编辑态+maxLines(1)+MultilineCenter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_12(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_12 begins.")
        launchEllipsisModeView(12, "TextInput_ellipsisMode_test", "TestCase_12", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.MULTILINE_CENTER\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_12 ends.")
    }

    /* ═══════════════════════════════════════════════════
     * 编辑态 + maxLines(2)（条件3：End/MultilineStart/MultilineCenter 生效；Start/Center 不生效，规格空白需实证）
     * ═══════════════════════════════════════════════════ */

    /*
     * @tc.number    : TestTextInput_ellipsisMode_013
     * @tc.name      : TestCase_13
     * @tc.desc      : BC·编辑态+maxLines(2)+End
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_13(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_13 begins.")
        launchEllipsisModeView(13, "TextInput_ellipsisMode_test", "TestCase_13", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.END\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_13 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_014
     * @tc.name      : TestCase_14
     * @tc.desc      : BC·编辑态+maxLines(2)+MultilineStart
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_14(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_14 begins.")
        launchEllipsisModeView(14, "TextInput_ellipsisMode_test", "TestCase_14", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.MULTILINE_START\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_14 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_015
     * @tc.name      : TestCase_15
     * @tc.desc      : BC·编辑态+maxLines(2)+MultilineCenter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_15(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_15 begins.")
        launchEllipsisModeView(15, "TextInput_ellipsisMode_test", "TestCase_15", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.MULTILINE_CENTER\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_15 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_016
     * @tc.name      : TestCase_16
     * @tc.desc      : BC·编辑态+maxLines(2)+Start 规格空白
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_16(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_16 begins.")
        launchEllipsisModeView(16, "TextInput_ellipsisMode_test", "TestCase_16", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.START\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_16 ends.")
    }

    /*
     * @tc.number    : TestTextInput_ellipsisMode_017
     * @tc.name      : TestCase_17
     * @tc.desc      : BC·编辑态+maxLines(2)+Center 规格空白
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func TestCase_17(): Unit {
        Hilog.info(0u32, "CangjieTest", "TestCase_17 begins.")
        launchEllipsisModeView(17, "TextInput_ellipsisMode_test", "TestCase_17", "TextInput_comattr_id")
        let mode = getInspectorAttr("TextInput_comattr_id", "ellipsisMode")
        @Expect(mode, "\"EllipsisMode.CENTER\"")
        Hilog.info(0u32, "CangjieTest", "TestCase_17 ends.")
    }
}
