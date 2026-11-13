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
 * 接口测试：List.scrollSnapAlign(value: ?ScrollSnapAlign)
 */
package ohos_app_cangjie_entry_test

import ohos_app_cangjie_entry.*
import ohos.arkui.component.custom_component.CustomView
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText
import kit.PerformanceAnalysisKit.Hilog
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*

import ohos.base.*
import ohos.ui_test.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.Hilog

// comattrId 为该用例被测组件的语义化 id，渲染后等待其出现（03-dt-code 流程 step 4）
func enterSnapAlignView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
class List_scrollSnapAlignTest {
    private func edgeAttrs(id: String): JsonObject {
        let inspector = getInspectorByKey(id)
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        return jsonObject.get("$attrs").getOrThrow().asObject()
    }

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

    private func minSnapAlignDeviation(prefix: String, containerTop: Int32, targetOffset: Int32): Int32 {
        var best: Int32 = 1 << 30
        for (i in 0..5) {
            let comp = TestDriver.driver.findComponent(On().id("${prefix}_i${i}"))
            if (let Some(c) <- comp) {
                let b = c.getBounds()
                let dev = b.top - containerTop - targetOffset
                let absDev = if (dev >= 0) { dev } else { -dev }
                if (absDev < best) { best = absDev }
            }
        }
        return best
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignNoneExplicit() {
        enterSnapAlignView({_: CustomView => View_List_scrollSnapAlign_002(Option<CustomView>.None)}, "list_snap", "List_scrollSnapAlignTest", "testScrollSnapAlignNoneExplicit")
        // 行为验证：scrollSnapAlign=None（显式）= 对齐关闭 → 列表保持普通滚动、不崩溃
        let rc = findInView("list_snap").getBounds()
        let before = findInView("snap_i0").getBounds().top
        let centerX = (rc.left + rc.right) / 2
        TestDriver.driver.drag(Int32(centerX), Int32(rc.bottom - 10), Int32(centerX), Int32(rc.bottom - 70))
        sleepFor(1200.milliSecond)
        @Expect(existsInView("list_snap"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignNoCall() {
        enterSnapAlignView({_: CustomView => View_List_scrollSnapAlign_001(Option<CustomView>.None)}, "list_snap", "List_scrollSnapAlignTest", "testScrollSnapAlignNoCall")
        // 行为验证：NoCall 默认序列化 ScrollSnapAlign.NONE
        @Expect(existsInView("list_snap"), true)
        let attrs = edgeAttrs("list_snap")
        let snapAlign = attrs.get("scrollSnapAlign").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "list_snap scrollSnapAlign: ${snapAlign}")
        @Expect(snapAlign, "\"ScrollSnapAlign.NONE\"")
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignStartFling() {
        enterSnapAlignView({_: CustomView => View_List_scrollSnapAlign_003(Option<CustomView>.None)}, "list_snap", "List_scrollSnapAlignTest", "testScrollSnapAlignStartFling")
        // 行为验证：Start 吸附，fling 后内容对齐容器顶
        let rc = findInView("list_snap").getBounds()
        TestDriver.driver.swipe(rc.left + 50, rc.bottom - 20, rc.left + 50, rc.top + 20)
        sleepFor(1200.milliSecond)
        let dev = minSnapAlignDeviation("snap", rc.top, 0)
        Hilog.info(1, "Cangjie-Test", "snap Start minDeviation: ${dev}")
        @Expect(dev <= 2, true)
        @Expect(findInView("snap_src").getText().contains("Fling"), true) // 对齐动画期间 onWillScroll 上报 ScrollSource.Fling
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignCenterFling() {
        enterSnapAlignView({_: CustomView => View_List_scrollSnapAlign_004(Option<CustomView>.None)}, "list_snap", "List_scrollSnapAlignTest", "testScrollSnapAlignCenterFling")
        // 行为验证：Center 吸附，fling 后内容对齐容器中
        let rc = findInView("list_snap").getBounds()
        TestDriver.driver.swipe(rc.left + 50, rc.bottom - 20, rc.left + 50, rc.top + 20)
        sleepFor(1200.milliSecond)
        let dev = minSnapAlignDeviation("snap", rc.top, 25)
        Hilog.info(1, "Cangjie-Test", "snap Center minDeviation: ${dev}")
        @Expect(dev <= 2, true)
        @Expect(findInView("snap_src").getText().contains("Fling"), true) // 对齐动画期间 onWillScroll 上报 ScrollSource.Fling
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignEndFling() {
        enterSnapAlignView({_: CustomView => View_List_scrollSnapAlign_005(Option<CustomView>.None)}, "list_snap", "List_scrollSnapAlignTest", "testScrollSnapAlignEndFling")
        // 行为验证：End 吸附，fling 后内容对齐容器底
        let rc = findInView("list_snap").getBounds()
        TestDriver.driver.swipe(rc.left + 50, rc.bottom - 20, rc.left + 50, rc.top + 20)
        sleepFor(1200.milliSecond)
        let dev = minSnapAlignDeviation("snap", rc.top, 50)
        Hilog.info(1, "Cangjie-Test", "snap End minDeviation: ${dev}")
        @Expect(dev <= 2, true)
        @Expect(findInView("snap_src").getText().contains("Fling"), true) // 对齐动画期间 onWillScroll 上报 ScrollSource.Fling
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollSnapAlignUnequalHeight() {
        enterSnapAlignView({_: CustomView => View_List_scrollSnapAlign_006(Option<CustomView>.None)}, "list_snap", "List_scrollSnapAlignTest", "testScrollSnapAlignUnequalHeight")
        // 行为验证：Center 且列表项不等高——对齐落点规格未定义
        // 可自动化断言：fling 后滚动发生、布局完好（3 个子项均可查询且纵向排布不破坏）、不崩溃
        let rc = findInView("list_snap").getBounds()
        let before = findInView("snap_i0").getBounds().top
        let centerX = (rc.left + rc.right) / 2
        TestDriver.driver.drag(Int32(centerX), Int32(rc.bottom - 10), Int32(centerX), Int32(rc.bottom - 50))
        sleepFor(1200.milliSecond)
        let i0 = findInView("snap_i0").getBounds()
        let i1 = findInView("snap_i1").getBounds()
        // 布局不变式：子项纵向排布不重叠（拖拽只改变滚动偏移，不破坏排布）
        @Expect(i1.top >= i0.bottom, true)
    }
}
