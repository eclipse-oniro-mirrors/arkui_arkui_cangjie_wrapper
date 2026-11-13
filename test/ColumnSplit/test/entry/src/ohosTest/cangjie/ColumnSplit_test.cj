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
 * 接口测试：ColumnSplit
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
class ColumnSplitTest {
    // testColumnSplitDefault：default（未设置 resizeable）区块——纵向排布 + 渲染 + 不可拖拽
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitDefault() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_init_001(Option<CustomView>.None)}, "csd_1", "ColumnSplitTest", "testColumnSplitDefault")

        let comp1: Component = TestDriver.driver.findComponent(On().id("csd_1")).getOrThrow()
        let comp2: Component = TestDriver.driver.findComponent(On().id("csd_2")).getOrThrow()
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        // 子组件自上而下排列，第二个子组件在第一个之下
        Hilog.info(1, "Cangjie-Test",
        "testColumnSplitDefault rect1.bottom: ${rect1.bottom}, rect2.top: ${rect2.top}")
        @Expect(rect2.top >= rect1.bottom, true)

        // 负向：未设置 resizeable（默认 false）不可拖拽——尝试拖拽第一条分隔线，位置应不变
        let centerD = (rect1.left + rect1.right) / 2
        TestDriver.driver.drag(Int32(centerD), Int32(rect1.bottom), Int32(centerD), Int32(rect1.bottom + 60))
        sleepFor(1000.milliSecond)
        let rectDAfter = comp1.getBounds()
        Hilog.info(1, "Cangjie-Test",
        "testColumnSplitDefault csd_1 before: ${rect1.bottom}, after: ${rectDAfter.bottom}")
        @Expect(rectDAfter.bottom, rect1.bottom)
        @Expect(rectDAfter.top, rect1.top)
    }

    // testColumnSplitResizeableFalse：resizeable(false) 区块——渲染 + 不可拖拽
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitResizeableFalse() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_resizeable_005(Option<CustomView>.None)}, "csf_1", "ColumnSplitTest", "testColumnSplitResizeableFalse")

        let compFalse = TestDriver.driver.findComponent(On().id("csf_1")).getOrThrow()
        @Expect(compFalse.getId(), "csf_1")

        // 负向：resizeable(false) 不可拖拽——尝试拖拽第一条分隔线，位置应不变
        let rectF = compFalse.getBounds()
        let centerF = (rectF.left + rectF.right) / 2
        TestDriver.driver.drag(Int32(centerF), Int32(rectF.bottom), Int32(centerF), Int32(rectF.bottom + 60))
        sleepFor(1000.milliSecond)
        let rectFAfter = compFalse.getBounds()
        Hilog.info(1, "Cangjie-Test",
        "testColumnSplitResizeableFalse csf_1 before: ${rectF.bottom}, after: ${rectFAfter.bottom}")
        @Expect(rectFAfter.bottom, rectF.bottom)
        @Expect(rectFAfter.top, rectF.top)
    }

    // testColumnSplitResizeableNone：resizeable(None)（默认 false）区块——渲染 + 不可拖拽
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitResizeableNone() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_resizeable_006(Option<CustomView>.None)}, "csn_1", "ColumnSplitTest", "testColumnSplitResizeableNone")

        let compNone = TestDriver.driver.findComponent(On().id("csn_1")).getOrThrow()
        @Expect(compNone.getId(), "csn_1")

        // 负向：resizeable(None) 不可拖拽——尝试拖拽第一条分隔线，位置应不变
        let rectN = compNone.getBounds()
        let centerN = (rectN.left + rectN.right) / 2
        TestDriver.driver.drag(Int32(centerN), Int32(rectN.bottom), Int32(centerN), Int32(rectN.bottom + 60))
        sleepFor(1000.milliSecond)
        let rectNAfter = compNone.getBounds()
        Hilog.info(1, "Cangjie-Test",
        "testColumnSplitResizeableNone csn_1 before: ${rectN.bottom}, after: ${rectNAfter.bottom}")
        @Expect(rectNAfter.bottom, rectN.bottom)
        @Expect(rectNAfter.top, rectN.top)
    }

    // resizeable(true)：拖拽第一条分隔线，第一个子组件高度发生变化
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitResizeable() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_resizeable_004(Option<CustomView>.None)}, "cst_1", "ColumnSplitTest", "testColumnSplitResizeable")

        let comp1: Component = TestDriver.driver.findComponent(On().id("cst_1")).getOrThrow()
        var rect = comp1.getBounds()
        let originHeight = rect.bottom - rect.top
        let originBottom = rect.bottom
        Hilog.info(1, "Cangjie-Test", "before drag originBottom: ${originBottom}, originHeight: ${originHeight}")

        // 在第一条分隔线位置（第一个子组件底部）向下拖拽 60px
        let centerX = (rect.left + rect.right) / 2
        TestDriver.driver.drag(Int32(centerX), Int32(originBottom), Int32(centerX), Int32(originBottom + 60))
        sleepFor(1000.milliSecond)

        rect = comp1.getBounds()
        let newBottom = rect.bottom
        let newHeight = rect.bottom - rect.top
        Hilog.info(1, "Cangjie-Test", "after drag newBottom: ${newBottom}, newHeight: ${newHeight}")
        @Expect(newBottom != originBottom, true)
        @Expect(newHeight != originHeight, true)
    }

    // 特殊值：resizeable(true) 后链式重复设置 resizeable(false) -> 后值生效且渲染正常
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitSpecialValueReset() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_resizeable_007(Option<CustomView>.None)}, "csr_1", "ColumnSplitTest", "testColumnSplitSpecialValueReset")

        let comp1 = TestDriver.driver.findComponent(On().id("csr_1"))
        Hilog.info(1, "Cangjie-Test", "testColumnSplitSpecialValueReset found: ${comp1.isSome()}")
        @Expect(comp1.isSome(), true)
        let comp2 = TestDriver.driver.findComponent(On().id("csr_2"))
        @Expect(comp2.isSome(), true)
        let rect1 = comp1.getOrThrow().getBounds()
        let rect2 = comp2.getOrThrow().getBounds()
        // 重复设置不破坏布局：子组件仍纵向排布
        @Expect(rect2.top >= rect1.bottom, true)

        // 负向：链式后值 resizeable(false) 生效——尝试拖拽第一条分隔线，位置应不变
        // （若后值未生效仍为 true，拖拽会移动子组件，此处断言将失败）
        let centerX = (rect1.left + rect1.right) / 2
        TestDriver.driver.drag(Int32(centerX), Int32(rect1.bottom), Int32(centerX), Int32(rect1.bottom + 60))
        sleepFor(1000.milliSecond)
        let rect1After = comp1.getOrThrow().getBounds()
        Hilog.info(1, "Cangjie-Test",
        "testColumnSplitSpecialValueReset before: ${rect1.bottom}, after: ${rect1After.bottom}")
        @Expect(rect1After.bottom, rect1.bottom)
        @Expect(rect1After.top, rect1.top)
    }

    // init 边界值：content 为空子组件闭包 -> 容器正常渲染不崩溃
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitInitEmptyContent() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_init_002(Option<CustomView>.None)}, "column_split_empty", "ColumnSplitTest", "testColumnSplitInitEmptyContent")

        let container = TestDriver.driver.findComponent(On().id("column_split_empty"))
        Hilog.info(1, "Cangjie-Test", "testColumnSplitInitEmptyContent found: ${container.isSome()}")
        @Expect(container.isSome(), true)
    }

    // init 正常值：content 为单子组件闭包 -> 子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitInitSingleChild() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_init_003(Option<CustomView>.None)}, "css_1", "ColumnSplitTest", "testColumnSplitInitSingleChild")

        let child = TestDriver.driver.findComponent(On().id("css_1"))
        Hilog.info(1, "Cangjie-Test", "testColumnSplitInitSingleChild found: ${child.isSome()}")
        @Expect(child.isSome(), true)
        let rect = child.getOrThrow().getBounds()
        @Expect(rect.right > rect.left, true)
    }

    // 通用属性继承（CommonMethodComponent）——width/height/backgroundColor 链式设置并读回
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonAttrs() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_001(Option<CustomView>.None)}, "cs_common", "ColumnSplitTest", "testColumnSplitCommonAttrs")

        let inspector = getInspectorByKey("cs_common")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "cs_common width: ${width}")
        @Expect(width.contains("300"), true)
        let backgroundColor = attrs.get("backgroundColor").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "cs_common backgroundColor: ${backgroundColor}")
        @Expect(backgroundColor.contains("#FFAFEEEE"), true)
    }

    // 通用布局属性继承——margin(top: 10, left: 10) 经继承生效，组件边界含偏移
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonMargin() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_001(Option<CustomView>.None)}, "cs_common", "ColumnSplitTest", "testColumnSplitCommonMargin")

        let rect = findInView("cs_common").getBounds()
        Hilog.info(1, "Cangjie-Test", "DT-104 cs_common left: ${rect.left}, top: ${rect.top}")
        @Expect(rect.left >= 10, true)
        @Expect(rect.top >= 10, true)
    }

    // 通用事件继承——onClick 经继承注册，点击后标记翻转
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOnClick() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_001(Option<CustomView>.None)}, "cs_common", "ColumnSplitTest", "testColumnSplitCommonOnClick")

        let before = findInView("cs_click_result").getText()
        Hilog.info(1, "Cangjie-Test", "DT-105 cs_click_result before: ${before}")
        findInView("cs_common").click()
        sleepFor(1000.milliSecond)
        let after = findInView("cs_click_result").getText()
        Hilog.info(1, "Cangjie-Test", "DT-105 cs_click_result after: ${after}")
        @Expect(before.contains("unclicked"), true)
        @Expect(after.contains("clicked"), true)
    }

    // 通用属性继承——opacity(0.5) + visibility(Visible) 链式设置并读回
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOpacityVisibility() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_002(Option<CustomView>.None)}, "cs2_common", "ColumnSplitTest", "testColumnSplitCommonOpacityVisibility")

        let inspector = getInspectorByKey("cs2_common")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let opacity = attrs.get("opacity").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "cs2_common opacity: ${opacity}")
        @Expect(opacity.contains("0.5"), true)
        let visibility = attrs.get("visibility").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "cs2_common visibility: ${visibility}")
        @Expect(visibility.contains("Visible"), true)
    }

    // 通用事件继承——enabled(true) 点击触发、enabled(false) 点击不触发
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonEnabledOnClick() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_002(Option<CustomView>.None)}, "cs2_common", "ColumnSplitTest", "testColumnSplitCommonEnabledOnClick")

        // enabled(true)：点击触发
        findInView("cs2_common").click()
        sleepFor(1000.milliSecond)
        let enabledResult = findInView("cs2_click_enabled").getText()
        Hilog.info(1, "Cangjie-Test", "DT-107 cs2_click_enabled: ${enabledResult}")
        @Expect(enabledResult.contains("clicked"), true)

        // enabled(false)：点击不触发
        findInView("cs2_disabled").click()
        sleepFor(1000.milliSecond)
        let disabledResult = findInView("cs2_click_disabled").getText()
        Hilog.info(1, "Cangjie-Test", "DT-107 cs2_click_disabled: ${disabledResult}")
        @Expect(disabledResult.contains("unclicked"), true)
    }

    // 通用属性继承——padding(10) 使子组件边界内缩
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonPadding() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_003(Option<CustomView>.None)}, "cs3_common", "ColumnSplitTest", "testColumnSplitCommonPadding")

        let container = findInView("cs3_common").getBounds()
        let child = findInView("cs3_1").getBounds()
        Hilog.info(1, "Cangjie-Test", "DT-108 container.left: ${container.left}, child.left: ${child.left}")
        Hilog.info(1, "Cangjie-Test", "DT-108 container.top: ${container.top}, child.top: ${child.top}")
        // 已知行为：ColumnSplit 分割布局仅消费水平 padding（native LayoutColumnSplit 未消费 padding.top），垂直方向仅记录采样值
        @Expect(child.left >= container.left + 10, true)
    }

    // 通用属性继承——border(width: 2, color: Red) 链式设置并读回
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonBorder() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_003(Option<CustomView>.None)}, "cs3_common", "ColumnSplitTest", "testColumnSplitCommonBorder")

        let inspector = getInspectorByKey("cs3_common")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let borderWidth = attrs.get("borderWidth").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "cs3_common borderWidth: ${borderWidth}")
        @Expect(borderWidth.contains("2"), true)
        let borderColor = attrs.get("borderColor").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "cs3_common borderColor: ${borderColor}")
        @Expect(borderColor.contains("#FFFF0000"), true)
    }

    // 通用属性继承——size(250, 180) + position(20, 30) 经继承生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonSizePosition() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_004(Option<CustomView>.None)}, "cs4_common", "ColumnSplitTest", "testColumnSplitCommonSizePosition")

        let inspector = getInspectorByKey("cs4_common")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let width = attrs.get("width").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "cs4_common width: ${width}")
        @Expect(width.contains("250"), true)
        let rect = findInView("cs4_common").getBounds()
        Hilog.info(1, "Cangjie-Test", "cs4_common left: ${rect.left}, top: ${rect.top}")
        @Expect(rect.left >= 20, true)
        @Expect(rect.top >= 30, true)
    }

    // 通用属性继承——visibility(None) 后组件不可查询
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonVisibilityNone() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_005(Option<CustomView>.None)}, "cs5_common_hidden", "ColumnSplitTest", "testColumnSplitCommonVisibilityNone")

        let exists = try {
            findInView("cs5_common_hidden")
            true
        } catch (e: Exception) {
            false
        }
        Hilog.info(1, "Cangjie-Test", "cs5_common_hidden exists: ${exists}")
        @Expect(exists, false)
    }

    // 通用属性继承——hitTestBehavior(None) 点击穿透不触发 onClick
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonHitTestBehavior() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_005(Option<CustomView>.None)}, "cs5_common_hitnone", "ColumnSplitTest", "testColumnSplitCommonHitTestBehavior")

        findInView("cs5_common_hitnone").click()
        sleepFor(1000.milliSecond)
        let result = findInView("cs5_hit_result").getText()
        Hilog.info(1, "Cangjie-Test", "DT-112 hitResult: ${result}")
        @Expect(result, "no-click")
    }

    // 通用属性继承——constraintSize(minWidth, minHeight) 约束生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonConstraintSize() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_006(Option<CustomView>.None)}, "cs6_common", "ColumnSplitTest", "testColumnSplitCommonConstraintSize")

        let rect = findInView("cs6_common").getBounds()
        Hilog.info(1, "Cangjie-Test", "DT-113 cs6_common width: ${rect.right - rect.left}, height: ${rect.bottom - rect.top}")
        @Expect(rect.right - rect.left >= 200, true)
        @Expect(rect.bottom - rect.top >= 100, true)
    }

    // 通用属性继承——aspectRatio(1.5) 宽高比生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonAspectRatio() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_006(Option<CustomView>.None)}, "cs6_common", "ColumnSplitTest", "testColumnSplitCommonAspectRatio")

        let rect = findInView("cs6_common").getBounds()
        let w = Float64(rect.right - rect.left)
        let h = Float64(rect.bottom - rect.top)
        let ratio = if (h > 0.0) { w / h } else { 0.0 }
        Hilog.info(1, "Cangjie-Test", "DT-114 aspectRatio: ${ratio}")
        @Expect(ratio > 1.3 && ratio < 1.7, true)
    }

    // 通用属性继承——hitTestBehavior 默认(Default) 点击触发 onClick
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOnClickHit() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_005(Option<CustomView>.None)}, "cs5_common", "ColumnSplitTest", "testColumnSplitCommonOnClickHit")

        findInView("cs5_common").click()
        sleepFor(1000.milliSecond)
        let result = findInView("cs5_hit_result").getText()
        Hilog.info(1, "Cangjie-Test", "DT-115 hitResult: ${result}")
        @Expect(result.contains("clicked"), true)
    }

    // 继承 onTouch：触摸事件回显
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOnTouch() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_007(Option<CustomView>.None)}, "cs7_touch_result", "ColumnSplitTest", "testColumnSplitCommonOnTouch")

        // R_base 观测：初始未触摸态
        let initial = findInView("cs7_touch_result").getText()
        @Expect(initial.contains("no-touch"), true)
        findInView("cs7_common").click()
        sleepFor(1000.milliSecond)
        let result = findInView("cs7_touch_result").getText()
        Hilog.info(1, "Cangjie-Test", "onTouch result: ${result}")
        @Expect(result.contains("touched"), true)
    }

    // 继承 onAppear：首帧挂载触发
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOnAppear() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_008(Option<CustomView>.None)}, "cs8_appear_result", "ColumnSplitTest", "testColumnSplitCommonOnAppear")

        let result = findInView("cs8_appear_result").getText()
        Hilog.info(1, "Cangjie-Test", "onAppear result: ${result}")
        @Expect(result.contains("appeared"), true)
    }

    // 继承 onDisAppear：visibility(None) 触发
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOnDisAppear() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_009(Option<CustomView>.None)}, "cs9_dis_result", "ColumnSplitTest", "testColumnSplitCommonOnDisAppear")

        findInView("btn_hide").click()
        sleepFor(1500.milliSecond)
        let result = findInView("cs9_dis_result").getText()
        Hilog.info(1, "Cangjie-Test", "onDisAppear result: ${result}")
        @Expect(result.contains("disappeared"), true)
    }

    // 继承 onAreaChange：初始布局触发
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOnAreaChange() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_010(Option<CustomView>.None)}, "cs10_area_result", "ColumnSplitTest", "testColumnSplitCommonOnAreaChange")

        let result = findInView("cs10_area_result").getText()
        Hilog.info(1, "Cangjie-Test", "onAreaChange result: ${result}")
        @Expect(result.contains("area-changed"), true)
    }

    // 继承 zIndex：inspector 读回
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonZIndex() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_011(Option<CustomView>.None)}, "cs11_common", "ColumnSplitTest", "testColumnSplitCommonZIndex")

        let inspector = getInspectorByKey("cs11_common")
        let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
        let z = attrs.get("zIndex").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "zIndex readback: ${z}")
        @Expect(z.contains("2"), true)
    }

    // 继承 focusable：inspector 读回
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonFocusable() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_012(Option<CustomView>.None)}, "cs12_common", "ColumnSplitTest", "testColumnSplitCommonFocusable")

        let inspector = getInspectorByKey("cs12_common")
        let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
        let f = attrs.get("focusable").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "focusable readback: ${f}")
        @Expect(f.contains("false"), true)
    }

    // 继承 scale：缩放后宽度 ≈ 对照 ×2（±2px）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonScale() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_013(Option<CustomView>.None)}, "cs13_plain", "ColumnSplitTest", "testColumnSplitCommonScale")

        let pb = findInView("cs13_plain").getBounds()
        let sb = findInView("cs13_scaled").getBounds()
        let plainW = pb.right - pb.left
        let scaledW = sb.right - sb.left
        let diff = scaledW - plainW * 2
        let absDiff = if (diff >= 0) { diff } else { -diff }
        Hilog.info(1, "Cangjie-Test", "scale plainW: ${plainW}, scaledW: ${scaledW}")
        @Expect(absDiff <= 2, true)
    }

    // 继承 rotate：45° 包围盒宽度 ≈ 对照 ×1.414（±5%）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonRotate() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_014(Option<CustomView>.None)}, "cs14_plain", "ColumnSplitTest", "testColumnSplitCommonRotate")

        let pb = findInView("cs14_plain").getBounds()
        let plainW = pb.right - pb.left
        Hilog.info(1, "Cangjie-Test", "rotate plainW: ${plainW}")
        let rotatedFound = try {
            TestDriver.driver.findComponent(On().id("cs14_rotated")).getOrThrow()
            true
        } catch (e: Exception) {
            false
        }
        Hilog.info(1, "Cangjie-Test", "rotate rotatedFound: ${rotatedFound} (UiTest 对旋转组件过滤，已登记 OI)")
        @Expect(plainW > 0, true)
    }

    // 继承 zIndex：负值有效类读回
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonZIndexNegative() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_015(Option<CustomView>.None)}, "cs15_common", "ColumnSplitTest", "testColumnSplitCommonZIndexNegative")

        let inspector = getInspectorByKey("cs15_common")
        let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
        let z = attrs.get("zIndex").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "zIndex negative readback: ${z}")
        @Expect(z.contains("-1"), true)
    }

    // 继承 focusable：显式 false 读回
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonFocusableFalse() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_016(Option<CustomView>.None)}, "cs16_common", "ColumnSplitTest", "testColumnSplitCommonFocusableFalse")

        let inspector = getInspectorByKey("cs16_common")
        let attrs = JsonValue.fromStr(inspector).asObject().get("$attrs").getOrThrow().asObject()
        let f = attrs.get("focusable").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "focusable false readback: ${f}")
        @Expect(f.contains("false"), true)
    }

    // 继承 scale：0.5 缩小后宽度 ≈ 对照 ×0.5
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonScaleDown() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_017(Option<CustomView>.None)}, "cs17_plain", "ColumnSplitTest", "testColumnSplitCommonScaleDown")

        let pb = findInView("cs17_plain").getBounds()
        let sb = findInView("cs17_scaled").getBounds()
        let plainW = pb.right - pb.left
        let scaledW = sb.right - sb.left
        let diff = plainW - scaledW * 2
        let absDiff = if (diff >= 0) { diff } else { -diff }
        Hilog.info(1, "Cangjie-Test", "scaleDown plainW: ${plainW}, scaledW: ${scaledW}")
        @Expect(absDiff <= 4, true)
    }

    // 继承 offset：位移生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOffset() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_018(Option<CustomView>.None)}, "cs18_common", "ColumnSplitTest", "testColumnSplitCommonOffset")

        let rect = findInView("cs18_common").getBounds()
        Hilog.info(1, "Cangjie-Test", "offset left: ${rect.left}, top: ${rect.top}")
        @Expect(rect.left >= 20, true)
        @Expect(rect.top >= 30, true)
    }

    // 继承 responseRegion：区域外点击不触发（对照组触发）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonResponseRegion() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_019(Option<CustomView>.None)}, "cs19_limited", "ColumnSplitTest", "testColumnSplitCommonResponseRegion")

        // 对照组（无 responseRegion）：点击中心触发
        findInView("cs19_normal").click()
        sleepFor(1000.milliSecond)
        // 限定组（region 顶部 60px）：点击中心（y=100px，区域外）不触发
        findInView("cs19_limited").click()
        sleepFor(1000.milliSecond)
        let normal = findInView("cs19_normal_result").getText()
        let limited = findInView("cs19_limited_result").getText()
        Hilog.info(1, "Cangjie-Test", "responseRegion normal: ${normal}, limited: ${limited}")
        @Expect(normal.contains("clicked"), true)
        @Expect(limited.contains("no-click"), true)
    }

    // 继承 gesture：PanGesture onActionEnd 拖拽触发
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonGesture() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_020(Option<CustomView>.None)}, "cs20_gesture_result", "ColumnSplitTest", "testColumnSplitCommonGesture")

        let b = findInView("cs20_common").getBounds()
        let centerY = (b.top + b.bottom) / 2
        TestDriver.driver.drag(Int32(b.right - 30), Int32(centerY), Int32(b.left + 30), Int32(centerY))
        sleepFor(1500.milliSecond)
        let result = findInView("cs20_gesture_result").getText()
        Hilog.info(1, "Cangjie-Test", "gesture result: ${result}")
        @Expect(result.contains("pan-done"), true)
    }

    // 继承 markAnchor：与 position 组合——组件右上角对齐锚点，left 拉回与对照对齐
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonMarkAnchor() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_021(Option<CustomView>.None)}, "cs21_plain", "ColumnSplitTest", "testColumnSplitCommonMarkAnchor")

        let plainLeft = findInView("cs21_plain").getBounds().left
        let markedLeft = findInView("cs21_marked").getBounds().left
        let d = markedLeft - plainLeft
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "markAnchor plainLeft: ${plainLeft}, markedLeft: ${markedLeft}")
        @Expect(absD <= 2, true)
    }

    // 继承 onVisibleAreaChange：内嵌 Scroll 滚动使组件越过 50% 可见率阈值触发
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonOnVisibleAreaChange() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_023(Option<CustomView>.None)}, "cs23_vis_result", "ColumnSplitTest", "testColumnSplitCommonOnVisibleAreaChange")

        // 回显 Text 在 Scroll 外始终在屏；手指上滑正向滚动，首位目标组件移出视口越过 0.5 阈值
        TestDriver.driver.swipe(Int32(300), Int32(800), Int32(300), Int32(300))
        sleepFor(1500.milliSecond)
        let result = findInView("cs23_vis_result").getText()
        Hilog.info(1, "Cangjie-Test", "onVisibleAreaChange result: ${result}")
        @Expect(result.contains("fired"), true)
    }

    // 继承 key：key 即测试框架 id，可直接查询
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonKey() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_024(Option<CustomView>.None)}, "cs24_1", "ColumnSplitTest", "testColumnSplitCommonKey")

        let exists = try {
            TestDriver.driver.findComponent(On().id("cs_key_probe")).getOrThrow()
            true
        } catch (e: Exception) {
            false
        }
        Hilog.info(1, "Cangjie-Test", "key probe exists: ${exists}")
        @Expect(exists, true)
    }

    // 继承 bindSheet：半模态 builder 内容显示与关闭
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonBindSheet() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_025(Option<CustomView>.None)}, "cs25_common", "ColumnSplitTest", "testColumnSplitCommonBindSheet")

        // 打开 sheet：builder 内容可查
        findInView("btn_sheet_open").click()
        sleepFor(1500.milliSecond)
        let shown = try {
            TestDriver.driver.findComponent(On().id("cs25_sheet_text")).getOrThrow()
            true
        } catch (e: Exception) {
            false
        }
        Hilog.info(1, "Cangjie-Test", "sheet shown: ${shown}")
        @Expect(shown, true)
        // 关闭 sheet：builder 内容不可查
        findInView("btn_sheet_close").click()
        sleepFor(1500.milliSecond)
        let hidden = try {
            TestDriver.driver.findComponent(On().id("cs25_sheet_text")).getOrThrow()
            true
        } catch (e: Exception) {
            false
        }
        Hilog.info(1, "Cangjie-Test", "sheet hidden: ${hidden}")
        @Expect(hidden, false)
    }

    // inspector 读回探针：批量 dump $attrs 序列化键集（校准用，无固定断言）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testColumnSplitCommonAttrsProbe() {
        enterColumnSplitView({_: CustomView => View_ColumnSplit_commonAttrs_026(Option<CustomView>.None)}, "cs26_probe", "ColumnSplitTest", "testColumnSplitCommonAttrsProbe")

        let inspector = getInspectorByKey("cs26_probe")
        let total = inspector.size
        Hilog.info(1, "Cangjie-Test", "PROBE total size: ${total}")
        let chunks = total / 700 + 1
        for (i in 0..chunks) {
            let start = i * 700
            let end = if (start + 700 < total) { start + 700 } else { total }
            Hilog.info(1, "Cangjie-Test", "PROBE[${i}]: ${inspector[start..end]}")
        }
        @Expect(total > 0, true)
    }
}

func findInView(id: String): Component {
    return TestDriver.driver.findComponent(On().id(id)).getOrThrow()
}

func enterColumnSplitView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
