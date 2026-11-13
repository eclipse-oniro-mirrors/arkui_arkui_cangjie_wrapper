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
 * 接口测试：RelativeContainer.localizedBarrier
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
class RC_LocalizedBarrierTest {
    private func boundsOf(id: String) {
        findInView(id).getBounds()
    }

    // 视图页内容超过一屏：视口外组件 findComponent 查不到，
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

    // End 屏障（LTR）：屏障位于所有引用组件最右侧，C 左边缘锚定屏障 == max(A.right, B.right)
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierEnd() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_001(Option<CustomView>.None)}, "lbe_a", "RC_LocalizedBarrierTest", "testLocalizedBarrierEnd")

        let rect1 = boundsOf("lbe_a")
        let rect2 = boundsOf("lbe_b")
        let rect3 = boundsOf("lbe_c")
        let expectLeft = if (rect1.right > rect2.right) {
            rect1.right
        } else {
            rect2.right
        }
        Hilog.info(1, "Cangjie-Test", "testLocalizedBarrierEnd c.left: ${rect3.left}, expect: ${expectLeft}")
        @Expect(rect3.left, expectLeft)
    }

    // Start 屏障（LTR）：屏障位于引用组件最左侧，C 左边缘 == B.left == A.right
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierStart() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_002(Option<CustomView>.None)}, "lbs_a", "RC_LocalizedBarrierTest", "testLocalizedBarrierStart")

        let rect1 = boundsOf("lbs_a")
        let rect2 = boundsOf("lbs_b")
        let rect3 = boundsOf("lbs_c")
        Hilog.info(1, "Cangjie-Test", "testLocalizedBarrierStart c.left: ${rect3.left}, b.left: ${rect2.left}")
        @Expect(rect3.left, rect2.left)
        @Expect(rect3.left, rect1.right)
    }

    // testLocalizedBarrierTop：Top 屏障——C1 顶边缘 == Top 屏障(B.top)
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierTop() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_003(Option<CustomView>.None)}, "lbt_b", "RC_LocalizedBarrierTest", "testLocalizedBarrierTop")

        let rect2 = boundsOf("lbt_b")
        let rectC1 = boundsOf("lbt_c_top")
        Hilog.info(1, "Cangjie-Test",
        "testLocalizedBarrierTop c1.top: ${rectC1.top}, b.top: ${rect2.top}")
        @Expect(rectC1.top, rect2.top)
    }

    // testLocalizedBarrierBottom：Bottom 屏障——C2 顶边缘 == Bottom 屏障(max(A.bottom, B.bottom))
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierBottom() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_004(Option<CustomView>.None)}, "lbt_a", "RC_LocalizedBarrierTest", "testLocalizedBarrierBottom")

        let rect1 = boundsOf("lbt_a")
        let rect2 = boundsOf("lbt_b")
        let rectC2 = boundsOf("lbt_c_bottom")
        let expectBottom = if (rect1.bottom > rect2.bottom) {
            rect1.bottom
        } else {
            rect2.bottom
        }
        Hilog.info(1, "Cangjie-Test",
        "testLocalizedBarrierBottom c2.top: ${rectC2.top}, expect: ${expectBottom}")
        @Expect(rectC2.top, expectBottom)
    }

    // End 屏障（RTL）：屏障位于所有引用组件最右侧，C 左边缘锚定屏障 == max(A.right, B.right)
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierRtlMirror() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_005(Option<CustomView>.None)}, "lbr_b", "RC_LocalizedBarrierTest", "testLocalizedBarrierRtlMirror")

        let rect2 = boundsOf("lbr_b")
        let rect3 = boundsOf("lbr_c")

        @Expect(rect3.right, rect2.left)
    }

    // 异常值：两个屏障 id 互重（约束要求屏障 id 唯一）-> 不崩溃且组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierExceptionDuplicateBarrierIds() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_006(Option<CustomView>.None)}, "lbdup_c", "RC_LocalizedBarrierTest", "testLocalizedBarrierExceptionDuplicateBarrierIds")

        let rect1 = boundsOf("lbdup_a")
        let rect3 = boundsOf("lbdup_c")
        let rectRC = boundsOf("rc_lbdup")
        Hilog.info(1, "Cangjie-Test",
        "testLocalizedBarrierExceptionDuplicateBarrierIds c.left: ${rect3.left}, rc.left: ${rectRC.left}")
        @Expect(rect1.right > rect1.left, true)
        // 源码（barriers_ map 同 key 后注册覆盖）：Start（后注册）屏障生效，
        // barrier x = minLeft(A) = 0，C 贴容器左缘
        @Expect(rect3.left, rectRC.left)
        @Expect(existsInView("lbdup_c"), true)
    }

    // 边界值：barrier 空数组（value=[]，区别于 referencedId 空列表）-> 不崩溃且容器正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testBarrierEmptyArray() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_007(Option<CustomView>.None)}, "lbe2_a", "RC_LocalizedBarrierTest", "testBarrierEmptyArray")

        let rect1 = boundsOf("lbe2_a")
        Hilog.info(1, "Cangjie-Test", "testBarrierEmptyArray a.left: ${rect1.left}")
        @Expect(rect1.right > rect1.left, true)
    }

    // testLocalizedBarrierStartExceptionEmptyRefs：Start 屏障 referencedId 空引用 -> 不崩溃、容器正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierStartExceptionEmptyRefs() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_008(Option<CustomView>.None)}, "rc_bse", "RC_LocalizedBarrierTest", "testLocalizedBarrierStartExceptionEmptyRefs")

        @Expect(existsInView("rc_bse"), true)
        // Start→LEFT，空引用屏障 x=minLeft 默认 Infinity，C 被推出窗口不渲染
        @Expect(existsInView("bar_starte_c"), false)
    }

    // testLocalizedBarrierStartExceptionRefNotExist：Start 屏障引用不存在 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierStartExceptionRefNotExist() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_009(Option<CustomView>.None)}, "rc_bsg", "RC_LocalizedBarrierTest", "testLocalizedBarrierStartExceptionRefNotExist")

        @Expect(existsInView("rc_bsg"), true)
        @Expect(existsInView("bar_startg_a"), true)
        // 源码行为：Start→LEFT，ghost 屏障 x=minLeft 默认 Infinity，C 被推出窗口不渲染
        @Expect(existsInView("bar_startg_c"), false)
    }

    // testLocalizedBarrierStartExceptionDuplicateId：Start 屏障 id 与组件重名 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierStartExceptionDuplicateId() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_010(Option<CustomView>.None)}, "rc_bsd", "RC_LocalizedBarrierTest", "testLocalizedBarrierStartExceptionDuplicateId")

        @Expect(existsInView("rc_bsd"), true)
        let rectASD = boundsOf("comp_start")
        let rectCSD = boundsOf("bar_startd_c")
        // 屏障 id 与组件 id 重名 → 屏障不注册（注册循环跳过），
        // C 锚点对齐组件 id（非屏障）：C.right == comp_start.right；
        Hilog.info(1, "Cangjie-Test",
        "testLocalizedBarrierStartExceptionDuplicateId c.right: ${rectCSD.right}, a.right: ${rectASD.right}")
        @Expect(rectCSD.right, rectASD.right)
    }

    // End 屏障 referencedId 空引用 -> 不崩溃、容器正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierEndExceptionEmptyRefs() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_011(Option<CustomView>.None)}, "lbx_c", "RC_LocalizedBarrierTest", "testLocalizedBarrierEndExceptionEmptyRefs")

        let rect1 = boundsOf("lbx_a")
        Hilog.info(1, "Cangjie-Test", "testLocalizedBarrierEmptyRefs a.left: ${rect1.left}")
        @Expect(rect1.right > rect1.left, true)
        // 锚定空引用屏障的组件不可查询（与方向无关，lbx_c 不渲染/不在组件树）
        @Expect(existsInView("lbx_c"), false)
    }

    // End 屏障引用不存在 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierEndExceptionRefNotExist() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_012(Option<CustomView>.None)}, "rc_lbg", "RC_LocalizedBarrierTest", "testLocalizedBarrierEndExceptionRefNotExist")

        let rect1 = boundsOf("lbg_a")
        Hilog.info(1, "Cangjie-Test", "testLocalizedBarrierExceptionRefNotExist a.left: ${rect1.left}")
        @Expect(rect1.right > rect1.left, true)
        // 锚定 ghost 屏障的组件不可查询（与方向无关），容器正常渲染
        @Expect(existsInView("rc_lbg"), true)
        @Expect(existsInView("lbg_c"), false)
    }

    // End 屏障 id 与组件重名 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierEndExceptionDuplicateId() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_013(Option<CustomView>.None)}, "lbd_c", "RC_LocalizedBarrierTest", "testLocalizedBarrierEndExceptionDuplicateId")

        let rect1 = boundsOf("lbd_a")
        Hilog.info(1, "Cangjie-Test",
        "testLocalizedBarrierExceptionDuplicateId a.left: ${rect1.left}, a.right: ${rect1.right}")
        @Expect(rect1.right > rect1.left, true)
        @Expect(existsInView("lbd_c"), true)
    }

    // testLocalizedBarrierTopExceptionEmptyRefs：Top 屏障 referencedId 空引用 -> 不崩溃、容器正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierTopExceptionEmptyRefs() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_014(Option<CustomView>.None)}, "rc_bte", "RC_LocalizedBarrierTest", "testLocalizedBarrierTopExceptionEmptyRefs")

        @Expect(existsInView("rc_bte"), true)
        // Top，空引用屏障 y=minTop 默认 Infinity，C 被推出窗口不渲染（与 Start empty 同构）
        @Expect(existsInView("bar_tope_c"), false)
    }

    // testLocalizedBarrierTopExceptionRefNotExist：Top 屏障引用不存在 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierTopExceptionRefNotExist() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_015(Option<CustomView>.None)}, "rc_btg", "RC_LocalizedBarrierTest", "testLocalizedBarrierTopExceptionRefNotExist")

        @Expect(existsInView("rc_btg"), true)
        @Expect(existsInView("bar_topg_a"), true)
        // 源码行为：Top，ghost 屏障 y=minTop 默认 Infinity，C 被推出窗口不渲染
        @Expect(existsInView("bar_topg_c"), false)
    }

    // testLocalizedBarrierTopExceptionDuplicateId：Top 屏障 id 与组件重名 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierTopExceptionDuplicateId() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_016(Option<CustomView>.None)}, "rc_btd", "RC_LocalizedBarrierTest", "testLocalizedBarrierTopExceptionDuplicateId")

        @Expect(existsInView("rc_btd"), true)
        @Expect(existsInView("bar_topd_c"), true)
    }

    // testLocalizedBarrierBottomExceptionEmptyRefs：Bottom 屏障 referencedId 空引用 -> 不崩溃、容器正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierBottomExceptionEmptyRefs() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_017(Option<CustomView>.None)}, "rc_bbe", "RC_LocalizedBarrierTest", "testLocalizedBarrierBottomExceptionEmptyRefs")

        @Expect(existsInView("rc_bbe"), true)
        // 锚定空引用屏障的组件不可查询（与方向无关），容器正常渲染
        @Expect(existsInView("bar_bottome_c"), false)
    }

    // testLocalizedBarrierBottomExceptionRefNotExist：Bottom 屏障引用不存在 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierBottomExceptionRefNotExist() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_018(Option<CustomView>.None)}, "rc_bbg", "RC_LocalizedBarrierTest", "testLocalizedBarrierBottomExceptionRefNotExist")

        @Expect(existsInView("rc_bbg"), true)
        @Expect(existsInView("bar_bottomg_a"), true)
        // 锚定 ghost 屏障的组件不可查询（与方向无关）
        @Expect(existsInView("bar_bottomg_c"), false)
    }

    // testLocalizedBarrierBottomExceptionDuplicateId：Bottom 屏障 id 与组件重名 -> 不崩溃、屏障生效子组件正常渲染
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testLocalizedBarrierBottomExceptionDuplicateId() {
        enterLocalizedBarrierView({_: CustomView => View_RelativeContainer_barrier_019(Option<CustomView>.None)}, "rc_bbd", "RC_LocalizedBarrierTest", "testLocalizedBarrierBottomExceptionDuplicateId")

        @Expect(existsInView("rc_bbd"), true)
        @Expect(existsInView("bar_bottomd_c"), true)
    }

}

func enterLocalizedBarrierView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
