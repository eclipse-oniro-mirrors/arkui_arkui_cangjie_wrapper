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

/**
 * 接口测试：Radio.radioStyle
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

@Test
class Radio_styleTest {
    // 视图页内容超过一屏：视口外组件 findComponent 查不到（getInspectorByKey 走 native 全树不受限），
    private func findInView(id: String): Component {
        return TestDriver.driver.findComponent(On().id(id)).getOrThrow()
    }

    // 供存在性断言使用：滚动查找目标组件，查到返回 true（未找到不抛异常）
    private func existsInView(id: String): Bool {
        try {
            findInView(id)
            return true
        } catch (e: Exception) {
            return false
        }
    }

    // radioStyle 全量设置：三个颜色均可通过 inspector 读取
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleFull() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_001(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleFull")

        let inspector = getInspectorByKey("radio_style")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        let checkedBg = attrs.get("radioStyle").getOrThrow().toString()
        @Expect(checkedBg.contains("\"checkedBackgroundColor\":\"#FF007DFF\""), true)

        let uncheckedBorder = attrs.get("radioStyle").getOrThrow().toString()
        @Expect(uncheckedBorder.contains("\"uncheckedBorderColor\":\"#FF182431\""), true)

        let indicator = attrs.get("radioStyle").getOrThrow().toString()
        @Expect(indicator.contains("\"indicatorColor\":\"#FFFFFFFF\""), true)
    }

    // testRadioStylePartialHex：仅 checkedBackgroundColor=0xFF00FF00（其余缺省 None）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStylePartialHex() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_002(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStylePartialHex")

        let inspector2 = getInspectorByKey("radio_style")
        let jsonObject2 = JsonValue.fromStr(inspector2).asObject()
        let attrs2 = jsonObject2.get("$attrs").getOrThrow().asObject()
        let checkedBg2 = attrs2.get("radioStyle").getOrThrow().toString()
        @Expect(checkedBg2.contains("\"checkedBackgroundColor\":\"#FF00FF00\""), true)
    }

    // testRadioStylePartialResource：checkedBackgroundColor=@r(app.color.blue_23C452) -> #FF4ECF73
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStylePartialResource() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_003(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStylePartialResource")

        let inspector4 = getInspectorByKey("radio_style")
        let jsonObject4 = JsonValue.fromStr(inspector4).asObject()
        let attrs4 = jsonObject4.get("$attrs").getOrThrow().asObject()
        let checkedBg4 = attrs4.get("radioStyle").getOrThrow().toString()
        @Expect(checkedBg4.contains("\"checkedBackgroundColor\":\"#FF4ECF73\""), true)
    }

    // testRadioStyleAllNoneRestore：三参数全传 None 恢复默认，组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleAllNoneRestore() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_017(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleAllNoneRestore")

        @Expect(existsInView("radio_style"), true)
    }

    // mark 全量设置：mark 属性 JSON 序列化
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleNormalValueColorEnum() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_004(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleNormalValueColorEnum")

        let inspector5 = getInspectorByKey("radio_style")
        let jsonObject5 = JsonValue.fromStr(inspector5).asObject()
        let attrs5 = jsonObject5.get("$attrs").getOrThrow().asObject()
        let checkedBg5 = attrs5.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style checkedBackgroundColor: ${checkedBg5}")
        @Expect(checkedBg5.contains("\"checkedBackgroundColor\":\"#FF0000FF\""), true)
    }

    // testRadioStyleBoundaryValueZero：checkedBackgroundColor=Color(0x00000000)（alphaAdapt 补 FF -> 黑）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleBoundaryValueZero() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_005(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleBoundaryValueZero")

        let inspector6 = getInspectorByKey("radio_style")
        let jsonObject6 = JsonValue.fromStr(inspector6).asObject()
        let attrs6 = jsonObject6.get("$attrs").getOrThrow().asObject()
        let checkedBg6 = attrs6.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style checkedBackgroundColor: ${checkedBg6}")
        @Expect(checkedBg6.contains("\"checkedBackgroundColor\":\"#FF000000\""), true)
    }

    // testRadioStyleBoundaryValueWhite：checkedBackgroundColor=Color(0xFFFFFFFF)（全白）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleBoundaryValueWhite() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_006(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleBoundaryValueWhite")

        let inspectorG = getInspectorByKey("radio_style")
        let jsonObjectG = JsonValue.fromStr(inspectorG).asObject()
        let attrsG = jsonObjectG.get("$attrs").getOrThrow().asObject()
        let checkedBg7 = attrsG.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style checkedBackgroundColor: ${checkedBg7}")
        @Expect(checkedBg7.contains("\"checkedBackgroundColor\":\"#FFFFFFFF\""), true)
    }

    // mark 特殊值：NoSet 不调用 mark -> 默认样式（同全 None 默认序列化）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleUncheckedColorEnum() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_009(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleUncheckedColorEnum")

        let inspectorI = getInspectorByKey("radio_style")
        let jsonObjectI = JsonValue.fromStr(inspectorI).asObject()
        let attrsI = jsonObjectI.get("$attrs").getOrThrow().asObject()
        let unchecked9 = attrsI.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style uncheckedBorderColor: ${unchecked9}")
        @Expect(unchecked9.contains("\"uncheckedBorderColor\":\"#FF0000FF\""), true)
    }

    // mark 正常值范围：strokeColor 的 Color 枚举形态
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleUncheckedValue() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_007(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleUncheckedValue")

        let inspector = getInspectorByKey("radio_style")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let unchecked = attrs.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style uncheckedBorderColor: ${unchecked}")
        @Expect(unchecked.contains("\"uncheckedBorderColor\":\"#FF182431\""), true)
    }

    // radioStyle 独立枚举：uncheckedBorderColor 资源色形态
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleUncheckedResource() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_008(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleUncheckedResource")

        let inspector = getInspectorByKey("radio_style")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let unchecked = attrs.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style uncheckedBorderColor: ${unchecked}")
        @Expect(unchecked.contains("\"uncheckedBorderColor\":\"#FF4ECF73\""), true)
    }

    // testRadioStyleUncheckedBoundaryZero：uncheckedBorderColor 边界 0x00000000（alphaAdapt 补 FF）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleUncheckedBoundaryZero() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_010(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleUncheckedBoundaryZero")

        let inspectorL = getInspectorByKey("radio_style")
        let jsonObjectL = JsonValue.fromStr(inspectorL).asObject()
        let attrsL = jsonObjectL.get("$attrs").getOrThrow().asObject()
        let unchecked12 = attrsL.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style uncheckedBorderColor: ${unchecked12}")
        @Expect(unchecked12.contains("\"uncheckedBorderColor\":\"#FF000000\""), true)
    }

    // testRadioStyleUncheckedBoundaryWhite：uncheckedBorderColor 边界 0xFFFFFFFF
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleUncheckedBoundaryWhite() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_011(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleUncheckedBoundaryWhite")

        let inspectorM = getInspectorByKey("radio_style")
        let jsonObjectM = JsonValue.fromStr(inspectorM).asObject()
        let attrsM = jsonObjectM.get("$attrs").getOrThrow().asObject()
        let unchecked13 = attrsM.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style uncheckedBorderColor: ${unchecked13}")
        @Expect(unchecked13.contains("\"uncheckedBorderColor\":\"#FFFFFFFF\""), true)
    }

    // radioStyle 独立枚举：indicatorColor 数值形态
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleIndicatorValue() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_012(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleIndicatorValue")

        let inspector = getInspectorByKey("radio_style")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let indicator = attrs.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style indicatorColor: ${indicator}")
        @Expect(indicator.contains("\"indicatorColor\":\"#FF00FF00\""), true)
    }

    // radioStyle 独立枚举：indicatorColor 资源色形态
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleIndicatorResource() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_013(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleIndicatorResource")

        let inspector = getInspectorByKey("radio_style")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let indicator = attrs.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style indicatorColor: ${indicator}")
        @Expect(indicator.contains("\"indicatorColor\":\"#FF4ECF73\""), true)
    }

    // radioStyle 独立枚举：indicatorColor Color 枚举形态（Color.White）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleIndicatorColorEnum() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_014(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleIndicatorColorEnum")

        let inspector = getInspectorByKey("radio_style")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let indicator = attrs.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style indicatorColor: ${indicator}")
        @Expect(indicator.contains("\"indicatorColor\":\"#FFFFFFFF\""), true)
    }

    // testRadioStyleIndicatorBoundaryZero：indicatorColor 边界 0x00000000（alphaAdapt 补 FF）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleIndicatorBoundaryZero() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_015(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleIndicatorBoundaryZero")

        let inspectorQ = getInspectorByKey("radio_style")
        let jsonObjectQ = JsonValue.fromStr(inspectorQ).asObject()
        let attrsQ = jsonObjectQ.get("$attrs").getOrThrow().asObject()
        let indicator17 = attrsQ.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style indicatorColor: ${indicator17}")
        @Expect(indicator17.contains("\"indicatorColor\":\"#FF000000\""), true)
    }

    // testRadioStyleIndicatorBoundaryWhite：indicatorColor 边界 0xFFFFFFFF
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioStyleIndicatorBoundaryWhite() {
        enterRadioStyleView({_: CustomView => View_Radio_radioStyle_016(Option<CustomView>.None)}, "radio_style", "Radio_styleTest", "testRadioStyleIndicatorBoundaryWhite")

        let inspectorR = getInspectorByKey("radio_style")
        let jsonObjectR = JsonValue.fromStr(inspectorR).asObject()
        let attrsR = jsonObjectR.get("$attrs").getOrThrow().asObject()
        let indicator18 = attrsR.get("radioStyle").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_style indicatorColor: ${indicator18}")
        @Expect(indicator18.contains("\"indicatorColor\":\"#FFFFFFFF\""), true)
    }

    // mark 独立枚举：strokeColor 数值形态

    // Radio init 带 indicatorType Tick —— 组件创建成功且可查询
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioInitTick() {
        enterRadioStyleView({_: CustomView => View_Radio_init_001(Option<CustomView>.None)}, "radio_init_tick", "Radio_styleTest", "testRadioInitTick")

        let inspector = getInspectorByKey("radio_init_tick")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()

        // 组件创建成功验证：getInspectorByKey 查询到组件即创建成功
        // indicatorType 构造器参数是否在 inspector $attrs 中暴露——待真机验证
        // RadioPaintProperty.RadioIndicator (Int32) 经 SetRadioIndicator 存储
        // 如果 $attrs 中不存在该字段，getOrThrow() 会抛异常（用例失败即为结论）
        let indicatorType = attrs.get("indicatorType").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_init_tick indicatorType: ${indicatorType}")
        @Expect(indicatorType.contains("TICK"), true)
    }

    // Radio init 带 indicatorType Dot —— 组件创建成功且可查询
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioInitDot() {
        enterRadioStyleView({_: CustomView => View_Radio_init_001(Option<CustomView>.None)}, "radio_init_dot", "Radio_styleTest", "testRadioInitDot")

        let inspector = getInspectorByKey("radio_init_dot")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let indicatorType = attrs.get("indicatorType").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_init_dot indicatorType: ${indicatorType}")
        @Expect(indicatorType.contains("DOT"), true)
    }

    // Radio init 带 indicatorType Custom + indicatorBuilder —— 选中后构建器内容渲染验证
    // 已知行为：builder 内容节点在未选中时隐藏（SetBuilderState GONE），需点击选中后采样
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioInitCustomBuilder() {
        enterRadioStyleView({_: CustomView => View_Radio_init_001(Option<CustomView>.None)}, "radio_init_custom", "Radio_styleTest", "testRadioInitCustomBuilder")

        let inspector = getInspectorByKey("radio_init_custom")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let indicatorType = attrs.get("indicatorType").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_init_custom indicatorType: ${indicatorType}")
        @Expect(indicatorType.contains("CUSTOM"), true)

        findInView("radio_init_custom").click()
        sleepFor(1000.milliSecond)
        let builderContent = findInView("custom_indicator")
        let builderBounds = builderContent.getBounds()
        Hilog.info(1, "Cangjie-Test", "custom_indicator width: ${builderBounds.right - builderBounds.left}")
        @Expect(builderBounds.right > builderBounds.left, true)
    }

    // Radio init 带 indicatorType Dot + indicatorBuilder —— indicatorType 读回验证
    // 已知行为：indicatorBuilder 仅在 indicatorType=Custom 时生效，Dot 时渲染系统默认圆点图标
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioInitDotWithBuilder() {
        enterRadioStyleView({_: CustomView => View_Radio_init_001(Option<CustomView>.None)}, "radio_init_dot_builder", "Radio_styleTest", "testRadioInitDotWithBuilder")

        let inspector = getInspectorByKey("radio_init_dot_builder")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let indicatorType = attrs.get("indicatorType").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_init_dot_builder indicatorType: ${indicatorType}")
        @Expect(indicatorType.contains("DOT"), true)

        // 点击选中后 builder 内容仍不渲染：custom_indicator 不存在
        findInView("radio_init_dot_builder").click()
        sleepFor(1000.milliSecond)
        let exists = try {
            findInView("custom_indicator")
            true
        } catch (e: Exception) {
            false
        }
        Hilog.info(1, "Cangjie-Test", "DT-113 custom_indicator exists: ${exists}")
        @Expect(exists, false)
    }

    // Radio init 带 indicatorType Tick + indicatorBuilder —— indicatorType 读回验证
    // 已知行为：indicatorBuilder 仅在 indicatorType=Custom 时生效，Tick 时渲染系统默认勾选图标
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testRadioInitTickWithBuilder() {
        enterRadioStyleView({_: CustomView => View_Radio_init_001(Option<CustomView>.None)}, "radio_init_tick_builder", "Radio_styleTest", "testRadioInitTickWithBuilder")

        let inspector = getInspectorByKey("radio_init_tick_builder")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let indicatorType = attrs.get("indicatorType").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "radio_init_tick_builder indicatorType: ${indicatorType}")
        @Expect(indicatorType.contains("TICK"), true)

        // 点击选中后 builder 内容仍不渲染：custom_indicator 不存在
        findInView("radio_init_tick_builder").click()
        sleepFor(1000.milliSecond)
        let exists = try {
            findInView("custom_indicator")
            true
        } catch (e: Exception) {
            false
        }
        Hilog.info(1, "Cangjie-Test", "DT-114 custom_indicator exists: ${exists}")
        @Expect(exists, false)
    }
}

func enterRadioStyleView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
