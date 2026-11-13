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
 * 接口测试：List/Scroller 7.1 新增接口
 */
package ohos_app_cangjie_entry_test

import std.unittest.*
import std.unittest.testmacro.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.hilog.Hilog
import ohos.multimedia.image.createImageSource
import ohos.ui_test.*
import ohos_app_cangjie_entry.*
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText

@Test
class ListScrollerTest {
    private func findInView(id: String): Component {
        return TestDriver.driver.findComponent(On().id(id)).getOrThrow()
    }

    private func relTopOf(itemId: String): Int64 {
        // 单用例视图无外层滚动容器，item 直查；取相对 List 顶边的偏移做断言，
        // 消除绝对坐标受窗口位置影响的干扰
        let item = findInView(itemId)
        let lb = TestDriver.driver.findComponent(On().id("list_scroller_main")).getOrThrow().getBounds()
        let ib = item.getBounds()
        let rel = Int64(ib.top - lb.top)
        Hilog.info(1, "Cangjie-Test", "relTopOf ${itemId}: lb.top=${lb.top} ib.top=${ib.top} rel=${rel}")
        return rel
    }

    private func stiScrollToBottom() {
        let rc = findInView("list_scroller_main").getBounds()
        let centerX = (rc.left + rc.right) / 2
        var prevTop = Int32.Max
        for (_ in 0..5) {
            TestDriver.driver.swipe(Int32(centerX), Int32(rc.bottom - 30), Int32(centerX), Int32(rc.top + 30))
            sleepFor(800.milliSecond)
            let cur = findInView("g1i2").getBounds().top
            if (cur == prevTop) { break }
            prevTop = cur
        }
    }

    // ===== ListScroller.getItemRectInGroup =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupValid() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_001(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupValid")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x:"), true)
        @Expect(result.contains("code:"), false)
        @Expect(result.contains("rect.width: 0.0, rect.height: 0.0"), false)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupNegativeIndexInGroup() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_002(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupNegativeIndexInGroup")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupIndexInGroupOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_003(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupIndexInGroupOutOfRange")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupNegativeIndex() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_004(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupNegativeIndex")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupBothNegative() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_005(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupBothNegative")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupNegativeAndOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_006(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupNegativeAndOutOfRange")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupIndexOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_007(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupIndexOutOfRange")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupOutOfRangeAndNegative() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_008(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupOutOfRangeAndNegative")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupBothOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_009(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupBothOutOfRange")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupUnbound() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_010(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupUnbound")

        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("code: 100004, meesage: BusinessException: errorcode: 100004, message: Controller not bound to a component.;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupIndexOffscreen() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_011(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupIndexOffscreen")

        // index 侧不可见验证
        // 内层滚动到底后视口为 [205,505]px，g0i0（0~80）完全在视口外 → 返回零尺寸
        //（几何约束：内容 505px/视口 300px，最大滚动 205 < 组0尾 250，组0 仅剩 g0i2 45px 残边，无法完全滚出）
        stiScrollToBottom()
        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupIndexInGroupOffscreen() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_012(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupIndexInGroupOffscreen")

        // index 可见、indexInGroup 不可见
        // 初始内层 scroll=0（视口 [0,300]px）：g1i0 底部 45px 残边可见（组可见），g1i2（445~525）完全在视口外 → 返回零尺寸
        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x: 0.0, rect.y: 0.0, rect.width: 0.0, rect.height: 0.0"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupIndexInGroupValid2() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_013(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupIndexInGroupValid2")

        // indexInGroup 有效非 0 值：g0i2（组内末项）初始完全可见 → 返回非零矩形
        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result: ${result}")
        @Expect(result.contains("rect.x:"), true)
        @Expect(result.contains("rect.width: 0.0, rect.height: 0.0"), false)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupPartiallyVisible() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_014(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupPartiallyVisible")

        // 残边可见项自身查询：内层滚动到底后 g0i2 仅剩 45px 残边
        // 按"可见"定义判定（真机校准点：先记录实际值，再收紧断言）
        stiScrollToBottom()
        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result (calibration): ${result}")
        @Expect(result.contains("rect.x:"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetItemRectInGroupIndexBaselinePartiallyVisible() {
        enterListScrollerView({_: CustomView => View_ListScroller_getItemRectInGroup_015(Option<CustomView>.None)}, "btn_gir", "ListScrollerTest", "testListScrollerGetItemRectInGroupIndexBaselinePartiallyVisible")

        // 严格 BC R_index,1：index=1、indexInGroup=0（基值）——g1i0 初始底部 45px 残边可见
        // 按"可见"定义判定（真机校准点：先记录实际值，再收紧断言）
        findInView("btn_gir").click()
        sleepFor(800.milliSecond)
        let result = findInView("gir_result").getText()
        Hilog.info(1, "Cangjie-Test", "gir_result (calibration): ${result}")
        @Expect(result.contains("rect.x:"), true)
    }

    // ===== ListScroller.getVisibleListContentInfo =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoValid() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_001(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoValid")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: 0, info.itemGroupArea: 1, info.itemIndexInGroup: 0"), true) // (10,10)vp 落在 g0i0 内 → 命中组内子项 area=InListItemArea(1)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoNegativeY() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_002(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoNegativeY")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoLargeY() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_003(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoLargeY")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoNegativeX() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_004(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoNegativeX")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoBothNegative() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_005(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoBothNegative")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoNegativeXLargeY() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_006(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoNegativeXLargeY")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoLargeX() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_007(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoLargeX")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoLargeXNegativeY() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_008(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoLargeXNegativeY")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoBothLarge() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_009(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoBothLarge")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: -1, info.itemGroupArea: -1, info.itemIndexInGroup: -1"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoUnbound() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_010(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoUnbound")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("code: 100004, meesage: BusinessException: errorcode: 100004, message: Controller not bound to a component.;"), true)
    }

    // ===== ListScroller.scrollToItemInGroup =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupValid() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_001(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupValid")

        // 行为验证：(0,0) 有效——收敛到底后调用，回滚到顶部（g0i0 顶边对齐容器顶，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let d = relTopOf("g0i0")
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g0i0 top delta: ${d}")
        @Expect(absD <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupNegativeIndexInGroup() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_002(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupNegativeIndexInGroup")

        // 行为验证：(0,-1) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupIndexInGroupOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_003(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupIndexInGroupOutOfRange")

        // 行为验证：(0,9) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupNegativeIndex() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_004(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupNegativeIndex")

        // 行为验证：(-1,0) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupBothNegative() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_005(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupBothNegative")

        // 行为验证：(-1,-1) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupNegativeAndOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_006(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupNegativeAndOutOfRange")

        // 行为验证：(-1,9) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupIndexOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_007(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupIndexOutOfRange")

        // 行为验证：(99,0) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupOutOfRangeAndNegative() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_008(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupOutOfRangeAndNegative")

        // 行为验证：(99,-1) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupBothOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_009(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupBothOutOfRange")

        // 行为验证：(99,9) 非法——不执行滚动，位置保持不变
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothNoneAlignNone() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_010(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothNoneAlignNone")

        // 行为验证：smooth=None，align=None——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        let before = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        // Start 对齐目标（组1顶 240+15d px）超过最大滚动（180+25d px）被截断：底部即截断落点
        // → g1i0 位置保持不变；g1i2（末项）顶边=容器顶+220（300-80，与 space 的 vp 密度换算无关）
        //（g1i0 截断落点=60-10d 依赖 space 密度换算，不可做常量断言；List space 传 FFI 为 LENGTH_VP，list.cj:522）
        let after = relTopOf("g1i0")
        let d = after - before
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 3, true)
        let d2 = relTopOf("g1i2") - 220
        let absD2 = if (d2 >= 0) { d2 } else { -d2 }
        Hilog.info(1, "Cangjie-Test", "g1i2 maxScroll delta: ${d2}")
        @Expect(absD2 <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothFalseAlignNone() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_015(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothFalseAlignNone")

        // 行为验证：smooth=false，align=None——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        let before = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - before
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 3, true)
        let d2 = relTopOf("g1i2") - 220
        let absD2 = if (d2 >= 0) { d2 } else { -d2 }
        Hilog.info(1, "Cangjie-Test", "g1i2 maxScroll delta: ${d2}")
        @Expect(absD2 <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothTrueAlignNone() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_020(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothTrueAlignNone")

        // 行为验证：smooth=true，align=None——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        let before = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - before
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 3, true)
        let d2 = relTopOf("g1i2") - 220
        let absD2 = if (d2 >= 0) { d2 } else { -d2 }
        Hilog.info(1, "Cangjie-Test", "g1i2 maxScroll delta: ${d2}")
        @Expect(absD2 <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothTrueAlignAuto() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_024(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothTrueAlignAuto")

        // 行为验证：smooth=true，align=Auto——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let rel = relTopOf("g1i0")
        // Auto：落点规格宽松——仅断言目标子项滚动进入 List 可视范围（相对 List 顶边）
        @Expect(rel >= -8, true)
        @Expect(rel <= 292, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupUnbound() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_025(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupUnbound")

        // 行为验证：未绑定实例——抛 BusinessException(100004)，无滚动
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let result = findInView("sti_result").getText()
        Hilog.info(1, "Cangjie-Test", "sti_result: ${result}")
        @Expect(result.contains("code: 100004, meesage: BusinessException: errorcode: 100004, message: Controller not bound to a component.;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothNoneAlignStart() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_011(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothNoneAlignStart")

        // 行为验证：smooth=None，align=Start——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        let before = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - before
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 3, true)
        let d2 = relTopOf("g1i2") - 220
        let absD2 = if (d2 >= 0) { d2 } else { -d2 }
        Hilog.info(1, "Cangjie-Test", "g1i2 maxScroll delta: ${d2}")
        @Expect(absD2 <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothNoneAlignCenter() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_012(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothNoneAlignCenter")

        // 行为验证：smooth=None，align=Center——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let d = relTopOf("g1i0") - 110
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothNoneAlignEnd() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_013(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothNoneAlignEnd")

        // 行为验证：smooth=None，align=End——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let d = relTopOf("g1i0") - 220
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothNoneAlignAuto() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_014(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothNoneAlignAuto")

        // 行为验证：smooth=None，align=Auto——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let rel = relTopOf("g1i0")
        // Auto：落点规格宽松——仅断言目标子项滚动进入 List 可视范围（相对 List 顶边）
        @Expect(rel >= -8, true)
        @Expect(rel <= 292, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothFalseAlignStart() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_016(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothFalseAlignStart")

        // 行为验证：smooth=false，align=Start——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        let before = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - before
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 3, true)
        let d2 = relTopOf("g1i2") - 220
        let absD2 = if (d2 >= 0) { d2 } else { -d2 }
        Hilog.info(1, "Cangjie-Test", "g1i2 maxScroll delta: ${d2}")
        @Expect(absD2 <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothFalseAlignCenter() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_017(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothFalseAlignCenter")

        // 行为验证：smooth=false，align=Center——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let d = relTopOf("g1i0") - 110
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothFalseAlignEnd() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_018(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothFalseAlignEnd")

        // 行为验证：smooth=false，align=End——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let d = relTopOf("g1i0") - 220
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothFalseAlignAuto() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_019(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothFalseAlignAuto")

        // 行为验证：smooth=false，align=Auto——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let rel = relTopOf("g1i0")
        // Auto：落点规格宽松——仅断言目标子项滚动进入 List 可视范围（相对 List 顶边）
        @Expect(rel >= -8, true)
        @Expect(rel <= 292, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothTrueAlignStart() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_021(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothTrueAlignStart")

        // 行为验证：smooth=true，align=Start——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        let before = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - before
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 3, true)
        let d2 = relTopOf("g1i2") - 220
        let absD2 = if (d2 >= 0) { d2 } else { -d2 }
        Hilog.info(1, "Cangjie-Test", "g1i2 maxScroll delta: ${d2}")
        @Expect(absD2 <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothTrueAlignCenter() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_022(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothTrueAlignCenter")

        // 行为验证：smooth=true，align=Center——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let d = relTopOf("g1i0") - 110
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupSmoothTrueAlignEnd() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_023(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupSmoothTrueAlignEnd")

        // 行为验证：smooth=true，align=End——收敛到底后调用，g1i0 按 align 落点（最大滚动 205：Start→50/Center→110/End→220，容差 8px）
        stiScrollToBottom()
        findInView("btn_sti").click()
        sleepFor(2500.milliSecond)
        let d = relTopOf("g1i0") - 220
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "g1i0 align delta: ${d}")
        @Expect(absD <= 8, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupIndexBaselineIndexInGroupNegative() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_028(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupIndexBaselineIndexInGroupNegative")

        // 严格 BC R_indexInGroup,-1：index 保持基值 1，仅 indexInGroup=-1（无效不滚动）
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerScrollToItemInGroupIndexBaselineIndexInGroupOutOfRange() {
        enterListScrollerView({_: CustomView => View_ListScroller_scrollToItemInGroup_029(Option<CustomView>.None)}, "btn_sti", "ListScrollerTest", "testListScrollerScrollToItemInGroupIndexBaselineIndexInGroupOutOfRange")

        // 严格 BC R_indexInGroup,9：index 保持基值 1，仅 indexInGroup=9（无效不滚动）
        stiScrollToBottom()
        let base = relTopOf("g1i0")
        findInView("btn_sti").click()
        sleepFor(1500.milliSecond)
        let after = relTopOf("g1i0")
        let d = after - base
        let absD = if (d >= 0) { d } else { -d }
        Hilog.info(1, "Cangjie-Test", "invalid scroll delta: ${absD}")
        @Expect(absD <= 3, true)
        @Expect(findInView("sti_result").getText().contains("ok;"), true)
    }

    // ===== ListScroller.closeAllSwipeActions =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerCloseAllSwipeActionsWithCallback() {
        enterListScrollerView({_: CustomView => View_ListScroller_closeAllSwipeActions_001(Option<CustomView>.None)}, "csa_item", "ListScrollerTest", "testListScrollerCloseAllSwipeActionsWithCallback")

        // 行为验证：真实收拢链路——左滑展开侧滑项 → closeAllSwipeActions(onFinish) 收拢动画 → 回调触发 + 侧滑项归位
        // 先显式滚动到 csa_item 可见，再立即 fresh 采样，保证 swipe 坐标与采样处于同一外层滚动状态
        let _ = findInView("csa_item")
        let before = TestDriver.driver.findComponent(On().id("csa_item")).getOrThrow().getBounds()
        let centerY = (before.top + before.bottom) / 2
        // 左滑展开 end 侧滑动作（内容左移，露出 DEL 区域）——用 drag（无惯性）确保手势被识别为受控拖拽而非快速滑动
        TestDriver.driver.drag(Int32(before.right - 20), Int32(centerY), Int32(before.left + 20), Int32(centerY))
        sleepFor(800.milliSecond)
        let expanded = findInView("csa_item").getBounds()
        Hilog.info(1, "Cangjie-Test", "csa item expand: ${before.left} -> ${expanded.left}")

        // 收拢全部侧滑项（真实收拢动画路径），onFinish 在收拢完成后异步触发
        findInView("btn_csa").click()
        sleepFor(1000.milliSecond)
        let cb = findInView("csa_cb_result").getText()
        Hilog.info(1, "Cangjie-Test", "csa_cb_result: ${cb}")
        @Expect(cb.contains("cb-fired"), true)

        let collapsed = findInView("csa_item").getBounds()
        Hilog.info(1, "Cangjie-Test", "csa item collapse: ${expanded.left} -> ${collapsed.left}")
        @Expect(collapsed.left, before.left)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerCloseAllSwipeActionsWithoutCallback() {
        enterListScrollerView({_: CustomView => View_ListScroller_closeAllSwipeActions_002(Option<CustomView>.None)}, "btn_csa", "ListScrollerTest", "testListScrollerCloseAllSwipeActionsWithoutCallback")

        findInView("btn_csa").click()
        sleepFor(800.milliSecond)
        let result = findInView("csa_result").getText()
        Hilog.info(1, "Cangjie-Test", "csa_result: ${result}")
        @Expect(result.contains("called;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerCloseAllSwipeActionsUnbound() {
        enterListScrollerView({_: CustomView => View_ListScroller_closeAllSwipeActions_003(Option<CustomView>.None)}, "btn_csa", "ListScrollerTest", "testListScrollerCloseAllSwipeActionsUnbound")

        findInView("btn_csa").click()
        sleepFor(800.milliSecond)
        let result = findInView("csa_result").getText()
        Hilog.info(1, "Cangjie-Test", "csa_result: ${result}")
        @Expect(result.contains("code: 100004, meesage: BusinessException: errorcode: 100004, message: Controller not bound to a component.;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerCloseAllSwipeActionsNoExpandedItem() {
        enterListScrollerView({_: CustomView => View_ListScroller_closeAllSwipeActions_004(Option<CustomView>.None)}, "btn_csa", "ListScrollerTest", "testListScrollerCloseAllSwipeActionsNoExpandedItem")

        findInView("btn_csa").click()
        sleepFor(800.milliSecond)
        let result = findInView("csa_result").getText()
        Hilog.info(1, "Cangjie-Test", "csa_result: ${result}")
        @Expect(result.contains("called;"), true)
        // 无展开项时 onFinish 不触发（与文档"收拢完成时触发"语义一致，详见矩阵）
        // csaCbResult 保持空串——空 Text 零尺寸不进可查询树，无法做负向 getText 断言
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoGap() {
        // 属性层验证：坐标在组内子项间空隙（space 15vp，y∈[50,65]vp）
        // → GetGroupItemIndex 先写组号再判 ProcessArea(-1) 返回 false，index 泄漏为组号(0)、area=-1、itemIndexInGroup=-1
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_011(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoGap")

        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: 0, info.itemGroupArea: -1, info.itemIndexInGroup: -1;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoHeaderArea() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_012(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoHeaderArea")
        // 属性层验证：坐标在组 header 带(y∈[0,20]vp)→area=InHeaderArea(2)，indexInGroup=-1
        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: 0, info.itemGroupArea: 2, info.itemIndexInGroup: -1;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoFooterArea() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_013(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoFooterArea")
        // 属性层验证：坐标在组 footer 带(y∈[95,115]vp)→area=InFooterArea(3)，indexInGroup=-1
        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: 0, info.itemGroupArea: 3, info.itemIndexInGroup: -1;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoEmptyGroup() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_014(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoEmptyGroup")
        // 属性层验证：空组(无子项/header/footer) + padding(15vp) 撑起非零矩形
        // → y=130vp 落在空组矩形内 → area=None(0)、index=组号(1)、itemIndexInGroup=-1
        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: 1, info.itemGroupArea: 0, info.itemIndexInGroup: -1;"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListScrollerGetVisibleListContentInfoLooseItem() {
        enterListScrollerView({_: CustomView => View_ListScroller_getVisibleListContentInfo_015(Option<CustomView>.None)}, "btn_gvi", "ListScrollerTest", "testListScrollerGetVisibleListContentInfoLooseItem")
        // 属性层验证：坐标命中散置 ListItem（不在组内）→index=扁平号(2)，area=-1(None)，inGroup=-1(None)
        findInView("btn_gvi").click()
        sleepFor(800.milliSecond)
        let result = findInView("gvi_result").getText()
        Hilog.info(1, "Cangjie-Test", "gvi_result: ${result}")
        @Expect(result.contains("info.index: 2, info.itemGroupArea: -1, info.itemIndexInGroup: -1;"), true)
    }
}

func enterListScrollerView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
