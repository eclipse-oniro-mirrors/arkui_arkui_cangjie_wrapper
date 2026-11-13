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
import std.unittest.testmacro.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.hilog.Hilog
import ohos.ui_test.*
import ohos_app_cangjie_entry.*
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText
import kit.PerformanceAnalysisKit.Hilog

func enterCheckboxGroupMarkView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
    TestDriver.driver.waitForComponent(On().id("testButton"), 3000)
    launch {
        modtestSuiteText[0] = suiteName
        modtestCaseText[0] = caseName
        modtestView[0] = view
    }
    TestDriver.driver.waitForComponent(On().id("testButton"), 1000).getOrThrow().click()
    TestDriver.driver.waitForComponent(On().id(comattrId), 3000)
    sleepFor(800.milliSecond)
}

@Test
class CheckboxGroup_markTest {
    private func findInView(id: String): Component {
        return TestDriver.driver.findComponent(On().id(id)).getOrThrow()
    }

    private func existsInView(id: String): Bool {
        try {
            findInView(id)
            return true
        } catch (e: Exception) {
            return false
        }
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSpecialValueNoSet() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_001(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSpecialValueNoSet")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            // 未调用 mark 的默认序列化 = strokeColor #FFFFFFFF / size 0.00vp / strokeWidth 2.00vp
            @Expect(mark.contains("\"strokeColor\":\"#FFFFFFFF\""), true)
            @Expect(mark.contains("\"size\":\"0.00vp\""), true)
            @Expect(mark.contains("\"strokeWidth\":\"2.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testCheckboxGroupMarkFull() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_002(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testCheckboxGroupMarkFull")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains(
                "{\"strokeColor\":\"#FF112233\",\"size\":\"20.00vp\",\"strokeWidth\":\"5.00vp\"}"),
                true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeColorValue() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_003(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeColorValue")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeColor\":\"#FF112233\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeColorResource() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_004(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeColorResource")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeColor\":\"#FF4ECF73\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeColorColorEnum() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_005(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeColorColorEnum")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeColor\":\"#FF0000FF\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeColorBoundaryZero() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_006(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeColorBoundaryZero")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeColor\":\"#FF000000\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeColorBoundaryWhite() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_007(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeColorBoundaryWhite")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeColor\":\"#FFFFFFFF\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizeValueVp() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_008(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizeValueVp")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"size\":\"20.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizePxUnit() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_009(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizePxUnit")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"size\":\"20.00px\""),
                true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizeFpUnit() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_010(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizeFpUnit")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"size\":\"20.00fp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizeLpxUnit() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_011(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizeLpxUnit")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"size\":\"20.00lpx\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizeNegative() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_012(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizeNegative")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"size\":\"-1.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizePercent() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_013(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizePercent")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"size\":\"-1.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizeZero() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_014(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizeZero")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"size\":\"0.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeWidthValueVp() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_015(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeWidthValueVp")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeWidth\":\"5.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeWidthPxUnit() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_016(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeWidthPxUnit")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeWidth\":\"5.00px\""),
                true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeWidthFpUnit() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_017(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeWidthFpUnit")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeWidth\":\"2.00fp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeWidthLpxUnit() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_018(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeWidthLpxUnit")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeWidth\":\"2.00lpx\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeWidthNegative() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_019(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeWidthNegative")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeWidth\":\"2.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeWidthPercent() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_020(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeWidthPercent")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeWidth\":\"2.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkStrokeWidthZero() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_021(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkStrokeWidthZero")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            @Expect(mark.contains("\"strokeWidth\":\"0.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testCheckboxGroupMarkAllNoneRestore() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_022(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testCheckboxGroupMarkAllNoneRestore")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark: ${mark}")
            // mark(None,None,None) 显式调用路径，size 未传由 wrapper 转为 -1vp
            // （CHECK_BOX_GROUP_MARK_SIZE_INVALID_VALUE 哨兵），与 NoCall 的兜底 0.00vp 区分：
            // strokeColor=#FFFFFFFF、size=-1.00vp、strokeWidth=2.00vp
            @Expect(mark.contains("\"strokeColor\":\"#FFFFFFFF\""), true)
            @Expect(mark.contains("\"size\":\"-1.00vp\""), true)
            @Expect(mark.contains("\"strokeWidth\":\"2.00vp\""), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testMarkSizeUnsetCheck() {
        enterCheckboxGroupMarkView({_: CustomView => View_CheckboxGroup_mark_023(Option<CustomView>.None)}, "cg_mark", "CheckboxGroup_markTest", "testMarkSizeUnsetCheck")

            let inspector = getInspectorByKey("cg_mark")
            let jsonObject = JsonValue.fromStr(inspector).asObject()
            let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
            let mark = attrs.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark before check: ${mark}")
            @Expect(mark.contains("\"strokeColor\":\"#FF112233\""), true)

            // 勾选（size 未设置：勾选标记大小应与复选框宽度一致，绘制尺寸无法自动化断言）
            findInView("mark_check").click()
            sleepFor(500.milliSecond)

            let inspectorAfter = getInspectorByKey("cg_mark")
            let jsonObjectAfter = JsonValue.fromStr(inspectorAfter).asObject()
            let attrsAfter = jsonObjectAfter.get("$attrs").getOrThrow().asObject()
            let markAfter = attrsAfter.get("mark").getOrThrow().toString()
            Hilog.info(1, "Cangjie-Test", "cg_mark mark after check: ${markAfter}")
            @Expect(markAfter.contains("\"strokeColor\":\"#FF112233\""), true)
            @Expect(existsInView("cg_mark"), true)
    }
}
