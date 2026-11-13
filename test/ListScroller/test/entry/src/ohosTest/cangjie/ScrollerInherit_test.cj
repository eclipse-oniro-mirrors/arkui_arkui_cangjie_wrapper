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
 * Scroller open 继承
 */
package ohos_app_cangjie_entry_test

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.Hilog
import ohos.ui_test.*
import ohos_app_cangjie_entry.*
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText
internal import ohos.business_exception.BusinessException

@Test
class ScrollerInheritTest {
    private func findInView(id: String): Component {
        return TestDriver.driver.findComponent(On().id(id)).getOrThrow()
    }

    private func enterListScrollerView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritance() {
        // 继承关系验证：ListScroller 实例化并可赋值给基类 Scroller
        let s: Scroller = ListScroller()
        Hilog.info(1, "Cangjie-Test", "ListScroller instantiated and assigned to Scroller")
        @Expect((s is Scroller), true)
    }

    // ListScroller 绑定 List，调用继承方法 scrollTo —— 内容滚动
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollToOnList() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_001(Option<CustomView>.None)}, "inherit_scroll_001", "ScrollerInheritTest", "testListScrollerInheritedScrollToOnList")

        // 采样 inherit_bottom（初始 top=100；scrollTo(0, 200) 超出最大滚动 100（=3×100-200）被截断，
        // bottom 顶边移到 0，整体上移 100vp）
        let before = findInView("inherit_bottom").getBounds().top
        findInView("btn_inherit_001").click()
        sleepFor(1000.milliSecond)
        let after = findInView("inherit_bottom").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-151 inherit_bottom before: ${before}, after: ${after}")
        @Expect(after < before, true)
    }

    // ListScroller 组合调用继承方法 scrollEdge/scrollBy/scrollPage —— 每步位置按预期变化且不崩溃
    // 布局：6×100=600，视口 400，最大滚动 200；item 顶边依次 0/100/200/300/400/500
    // 采样约束：UiTest 只能查询在屏组件，每步前后采样同一 item 且两态均在视口内
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedCombined() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_002(Option<CustomView>.None)}, "btn_edge_bottom", "ScrollerInheritTest", "testListScrollerInheritedCombined")

        // 基准：getBounds 为屏幕绝对坐标，采样 inherit2_bottom（初始 rel=200，视口内）
        let top0 = findInView("inherit2_bottom").getBounds().top

        // 步骤1：scrollEdge(Bottom)（offset 0→200）—— bottom 从 rel 200 上移到 rel 0
        findInView("btn_edge_bottom").click()
        sleepFor(1500.milliSecond)
        let bottomTop = findInView("inherit2_bottom").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-152 edge-bottom bottomTop: ${bottomTop}, top0: ${top0}")
        @Expect(bottomTop < top0, true)

        // 步骤2：scrollEdge(Top)（offset 200→0）—— bottom 从 rel 0 下移回 rel 200
        let bottomBefore = findInView("inherit2_bottom").getBounds().top
        findInView("btn_edge_top").click()
        sleepFor(1500.milliSecond)
        let bottomAfter = findInView("inherit2_bottom").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-152 edge-top bottomBefore: ${bottomBefore}, bottomAfter: ${bottomAfter}")
        @Expect(bottomAfter > bottomBefore, true)

        // 步骤3：scrollBy(0, 100)（offset 0→100）—— mid 从 rel 100 上移到 rel 0
        let midBefore = findInView("inherit2_mid").getBounds().top
        findInView("btn_by").click()
        sleepFor(1500.milliSecond)
        let midAfter = findInView("inherit2_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-152 by midBefore: ${midBefore}, midAfter: ${midAfter}")
        @Expect(midAfter < midBefore, true)

        // 步骤4：scrollPage(true)（页距 400 超最大滚动 200，钳制 offset 100→200）—— item4 从 rel 200 上移到 rel 100
        let item4Before = findInView("inherit2_item4").getBounds().top
        findInView("btn_page").click()
        sleepFor(1500.milliSecond)
        let item4After = findInView("inherit2_item4").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-152 page item4Before: ${item4Before}, item4After: ${item4After}")
        @Expect(item4After < item4Before, true)
    }

    // 框架子类 ListScroller 调用从 Scroller 继承的 scrollTo —— List 滚动生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollTo() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_003(Option<CustomView>.None)}, "btn_inherit_003", "ScrollerInheritTest", "testListScrollerInheritedScrollTo")

        // 采样 inherit3_item2（初始 top=160；scrollTo(0, 400) 超出最大滚动 180（=6×80-300）被截断，
        // item2 顶边移到 160-180=-20，仍在视口内）
        let before = findInView("inherit3_item2").getBounds().top
        findInView("btn_inherit_003").click()
        sleepFor(1000.milliSecond)
        let after = findInView("inherit3_item2").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-153 inherit3_item2 before: ${before}, after: ${after}")
        @Expect(after < before, true)
    }

    // ListScroller 调用继承的 scrollTo + ScrollAnimationOptions —— 动画滚动生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollToAnim() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_004(Option<CustomView>.None)}, "btn_anim", "ScrollerInheritTest", "testListScrollerInheritedScrollToAnim")

        // 采样 inherit4_mid（初始 top=100；scrollTo(0, 200) 动画 500ms 后超出最大滚动 100（=3×100-200）
        // 被截断，mid 顶边移到 0）
        let before = findInView("inherit4_mid").getBounds().top
        findInView("btn_anim").click()
        sleepFor(1500.milliSecond)
        let after = findInView("inherit4_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-154 inherit4_mid before: ${before}, after: ${after}")
        @Expect(after < before, true)
    }

    // ListScroller 调用继承的 fling —— 文档语义：正速度向顶部滚动，负速度向底部滚动
    // 布局：3×100=300，视口 200，最大滚动 100
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedFling() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_004(Option<CustomView>.None)}, "btn_fling_neg", "ScrollerInheritTest", "testListScrollerInheritedFling")

        // fling(-3000)：向底部惯性滚动，offset 0→100（截断），mid 从 100 上移到 0
        let before = findInView("inherit4_mid").getBounds().top
        findInView("btn_fling_neg").click()
        sleepFor(2000.milliSecond)
        let afterNeg = findInView("inherit4_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-155 fling-neg before: ${before}, after: ${afterNeg}")
        @Expect(afterNeg < before, true)

        // fling(1000)：向顶部惯性滚动，offset 自底部回落，mid 下移
        findInView("btn_fling_pos").click()
        sleepFor(2000.milliSecond)
        let afterPos = findInView("inherit4_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-155 fling-pos after: ${afterPos}")
        @Expect(afterPos > afterNeg, true)
    }

    // ListScroller 调用继承的 scrollEdge + ScrollEdgeOptions(velocity) / scrollBy(50)
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollEdgeOptions() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_004(Option<CustomView>.None)}, "btn_edge_opt", "ScrollerInheritTest", "testListScrollerInheritedScrollEdgeOptions")

        // 基准：getBounds 为屏幕绝对坐标，断言一律使用与 List 容器边界的差值
        let listTop = findInView("inherit_scroll_004").getBounds().top

        // scrollEdge(Top)+velocity：初始已在顶部，位置不变，mid 顶边 100 在 List 顶边之下
        findInView("btn_edge_opt").click()
        sleepFor(1000.milliSecond)
        let topAfterEdge = findInView("inherit4_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-156 edge-opt midTop: ${topAfterEdge}, listTop: ${listTop}")
        @Expect(topAfterEdge > listTop, true)

        // scrollBy(0, 50)：offset 0→50，mid 从 100 上移到 50
        findInView("btn_by_px").click()
        sleepFor(1000.milliSecond)
        let topAfterBy = findInView("inherit4_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "DT-156 by-px midTop: ${topAfterBy}")
        @Expect(topAfterBy < topAfterEdge, true)
    }

    // ListScroller 滚动到底后调用继承的 isAtEnd() —— 断言 true
    // 滚动与查询分按钮：同步查询会在 scrollEdge 完成前读到 false
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedIsAtEnd() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_004(Option<CustomView>.None)}, "btn_bottom", "ScrollerInheritTest", "testListScrollerInheritedIsAtEnd")

        // 先 scrollEdge(Bottom) 到底（offset=100=最大滚动），等待稳定后单独查询 isAtEnd()
        findInView("btn_bottom").click()
        sleepFor(1500.milliSecond)
        findInView("btn_isend").click()
        sleepFor(1000.milliSecond)
        let result = findInView("isAtEnd_result").getText()
        Hilog.info(1, "Cangjie-Test", "DT-157 isAtEnd_result: ${result}")
        @Expect(result.contains("isAtEnd:true"), true)
    }

    // ListScroller 调用继承的 isAtEnd()：初态未到底 —— 断言 false
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedIsAtEndNotEnd() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_004(Option<CustomView>.None)}, "btn_isend", "ScrollerInheritTest", "testListScrollerInheritedIsAtEndNotEnd")

        // 初态（offset=0，未到底）直接查询
        findInView("btn_isend").click()
        sleepFor(1000.milliSecond)
        let result = findInView("isAtEnd_result").getText()
        Hilog.info(1, "Cangjie-Test", "isAtEnd not-end result: ${result}")
        @Expect(result.contains("isAtEnd:false"), true)
    }

    // ListScroller 调用继承的 scrollBy：累计位移受最大滚动量钳制（边界）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollByClamp() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_002(Option<CustomView>.None)}, "btn_edge_bottom", "ScrollerInheritTest", "testListScrollerInheritedScrollByClamp")

        // 先 scrollEdge(Bottom) 到底（offset=200=最大滚动），item6 rel=300 在视口内
        findInView("btn_edge_bottom").click()
        sleepFor(1500.milliSecond)
        let before = findInView("inherit2_item6").getBounds().top
        // 再 scrollBy(0, 100)：目标 300 超最大滚动 200 被钳制——位置不变
        findInView("btn_by").click()
        sleepFor(1500.milliSecond)
        let after = findInView("inherit2_item6").getBounds().top
        Hilog.info(1, "Cangjie-Test", "scrollByClamp before: ${before}, after: ${after}")
        @Expect(after == before, true)
    }

    // ListScroller 调用继承的 scrollPage：翻页目标超最大滚动量被钳制（边界）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollPageClamp() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_002(Option<CustomView>.None)}, "btn_page", "ScrollerInheritTest", "testListScrollerInheritedScrollPageClamp")

        // 第一次翻页：页距 400 > 最大滚动 200，钳制到底（offset 0→200），item4 rel=100
        findInView("btn_page").click()
        sleepFor(1500.milliSecond)
        let first = findInView("inherit2_item4").getBounds().top
        // 第二次翻页：已到底，位置不变
        findInView("btn_page").click()
        sleepFor(1500.milliSecond)
        let second = findInView("inherit2_item4").getBounds().top
        Hilog.info(1, "Cangjie-Test", "scrollPageClamp first: ${first}, second: ${second}")
        @Expect(second == first, true)
    }

    // ListScroller 调用继承的 fling：velocity=0 不生效且不产生滚动动画（边界）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedFlingZero() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_004(Option<CustomView>.None)}, "btn_fling_zero", "ScrollerInheritTest", "testListScrollerInheritedFlingZero")

        let before = findInView("inherit4_mid").getBounds().top
        findInView("btn_fling_zero").click()
        sleepFor(2000.milliSecond)
        let after = findInView("inherit4_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "flingZero before: ${before}, after: ${after}")
        @Expect(after == before, true)
    }

    // ListScroller 调用继承的 currentOffset：初态 0、scrollBy(0, 50) 后 50
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedCurrentOffset() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_004(Option<CustomView>.None)}, "btn_cur_offset", "ScrollerInheritTest", "testListScrollerInheritedCurrentOffset")

        // 初态查询：yOffset = 0
        findInView("btn_cur_offset").click()
        sleepFor(500.milliSecond)
        let r0 = findInView("cur_offset_result").getText()
        Hilog.info(1, "Cangjie-Test", "curOffset initial: ${r0}")
        @Expect(r0.contains("yOffset: 0"), true)

        // scrollBy(0, 50) 后查询：yOffset = 50
        findInView("btn_by_px").click()
        sleepFor(1500.milliSecond)
        findInView("btn_cur_offset").click()
        sleepFor(500.milliSecond)
        let r1 = findInView("cur_offset_result").getText()
        Hilog.info(1, "Cangjie-Test", "curOffset after by: ${r1}")
        @Expect(r1.contains("yOffset: 50"), true)
    }

    // ListScroller 调用继承的 scrollToIndex：index 定位滚动生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollToIndex() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_005(Option<CustomView>.None)}, "btn_s2i", "ScrollerInheritTest", "testListScrollerInheritedScrollToIndex")

        // scrollToIndex(2)：item2（顶边 200）Start 对齐到视口顶（offset 200=最大滚动），rel 200→0
        let before = findInView("inherit5_item2").getBounds().top
        findInView("btn_s2i").click()
        sleepFor(1500.milliSecond)
        let after = findInView("inherit5_item2").getBounds().top
        Hilog.info(1, "Cangjie-Test", "scrollToIndex before: ${before}, after: ${after}")
        @Expect(after < before, true)
    }

    // ListScroller 调用继承的 getItemRect：扁平索引返回非零矩形
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedGetItemRect() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_006(Option<CustomView>.None)}, "btn_gir", "ScrollerInheritTest", "testListScrollerInheritedGetItemRect")

        // getItemRect(1)：g0i1 初始完全可见 → 返回非零矩形
        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "getItemRect result: ${result}")
        @Expect(result.contains("rect.x:"), true)
        @Expect(result.contains("rect.width: 0.0, rect.height: 0.0"), false)
    }

    // ListScroller 调用继承的 getItemIndex：坐标命中扁平索引
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedGetItemIndex() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_007(Option<CustomView>.None)}, "btn_idx", "ScrollerInheritTest", "testListScrollerInheritedGetItemIndex")

        // getItemIndex(10, 10)：命中 g0i0 → 扁平索引 0
        findInView("btn_idx").click()
        sleepFor(800.milliSecond)
        let result = findInView("idx_result").getText()
        Hilog.info(1, "Cangjie-Test", "getItemIndex result: ${result}")
        @Expect(result.contains("index: 0"), true)
    }

    // ListScroller 调用继承的 scrollTo（animation: ?Bool 三参重载）：动画滚动生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerInheritedScrollToAnimationBool() {
        enterListScrollerView({_: CustomView => View_ListScroller_inherit_008(Option<CustomView>.None)}, "btn_anim_bool", "ScrollerInheritTest", "testListScrollerInheritedScrollToAnimationBool")

        // scrollTo(0, 100, animation: true)：未超最大滚动 100，精确落点，bottom rel 100→0
        let before = findInView("inherit8_mid").getBounds().top
        findInView("btn_anim_bool").click()
        sleepFor(1500.milliSecond)
        let after = findInView("inherit8_mid").getBounds().top
        Hilog.info(1, "Cangjie-Test", "scrollToBool before: ${before}, after: ${after}")
        @Expect(after < before, true)
    }
}
