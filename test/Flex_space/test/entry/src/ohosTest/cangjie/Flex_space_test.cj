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
 * 接口测试：Flex.space
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
class Flex_spaceTest {
    // 视图页内容超过一屏：视口外组件 findComponent 查不到，
    private func findInView(id: String): Component {
        return TestDriver.driver.findComponent(On().id(id)).getOrThrow()
    }

    // 主轴间距：mainSpacing=50vp 与子组件宽度相同，间距(px) == 子组件宽度(px)，规避屏幕密度
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceMainSpacing() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_004(Option<CustomView>.None)}, "fsm_1", "Flex_spaceTest", "testFlexSpaceMainSpacing")

        let comp1: Component = findInView("fsm_1")
        let comp2: Component = findInView("fsm_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.left - rect1.right
        let childWidth = rect1.right - rect1.left
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceMainSpacing gap: ${gap}, childWidth: ${childWidth}")
        // ±2px 取整容差：bounds 为整数，50vp 在 density 3.25 下为 162.5px，逐边取整引入 ±1 误差
        @Expect(gap >= childWidth - 2 && gap <= childWidth + 2, true)
    }

    // testFlexSpaceDefaultNone：space=None，间距为 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceDefaultNone() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_002(Option<CustomView>.None)}, "fsn_1", "Flex_spaceTest", "testFlexSpaceDefaultNone")

        let none1: Component = findInView("fsn_1")
        let none2: Component = findInView("fsn_2")
        let rectNone1 = none1.getBounds()
        let rectNone2 = none2.getBounds()
        Hilog.info(1, "Cangjie-Test", "space None gap: ${rectNone2.left - rectNone1.right}")
        @Expect(rectNone2.left - rectNone1.right, 0)
    }

    // testFlexSpaceNegativeInvalid：mainSpacing=-20vp 负值不生效，间距为 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceNegativeInvalid() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_008(Option<CustomView>.None)}, "fsg_1", "Flex_spaceTest", "testFlexSpaceNegativeInvalid")

        let neg1: Component = findInView("fsg_1")
        let neg2: Component = findInView("fsg_2")
        let rectNeg1 = neg1.getBounds()
        let rectNeg2 = neg2.getBounds()
        Hilog.info(1, "Cangjie-Test", "negative gap: ${rectNeg2.left - rectNeg1.right}")
        @Expect(rectNeg2.left - rectNeg1.right, 0)
    }

    // testFlexSpacePercentInvalid：mainSpacing=0.5percent 百分比不生效，间距为 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpacePercentInvalid() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_009(Option<CustomView>.None)}, "fsp_1", "Flex_spaceTest", "testFlexSpacePercentInvalid")

        let pct1: Component = findInView("fsp_1")
        let pct2: Component = findInView("fsp_2")
        let rectPct1 = pct1.getBounds()
        let rectPct2 = pct2.getBounds()
        Hilog.info(1, "Cangjie-Test", "percent gap: ${rectPct2.left - rectPct1.right}")
        @Expect(rectPct2.left - rectPct1.right, 0)
    }

    // testFlexSpaceEmptyOptions：空 FlexSpaceOptions()（mainSpacing=None，crossSpacing=None），间距为默认 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceEmptyOptions() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_003(Option<CustomView>.None)}, "fse_1", "Flex_spaceTest", "testFlexSpaceEmptyOptions")

        let empty1: Component = findInView("fse_1")
        let empty2: Component = findInView("fse_2")
        let rectEmpty1 = empty1.getBounds()
        let rectEmpty2 = empty2.getBounds()
        Hilog.info(1, "Cangjie-Test", "empty options gap: ${rectEmpty2.left - rectEmpty1.right}")
        @Expect(rectEmpty2.left - rectEmpty1.right, 0)
    }

    // px 单位：mainSpacing=100px，间距精确为 100px（px 不随密度缩放）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpacePxUnit() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_005(Option<CustomView>.None)}, "fsx_1", "Flex_spaceTest", "testFlexSpacePxUnit")

        let comp1: Component = findInView("fsx_1")
        let comp2: Component = findInView("fsx_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.left - rect1.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpacePxUnit gap: ${gap}")
        @Expect(gap, 100)
    }

    // 交叉轴间距：wrap 换行后行间距 == 子组件高度（50vp）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossSpacing() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_012(Option<CustomView>.None)}, "fsc_1", "Flex_spaceTest", "testFlexSpaceCrossSpacing")

        let comp1: Component = findInView("fsc_1")
        let comp2: Component = findInView("fsc_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        // 换行后第二行在下方
        @Expect(rect2.top > rect1.bottom, true)
        let rowGap = rect2.top - rect1.bottom
        let childHeight = rect1.bottom - rect1.top
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceCrossSpacing rowGap: ${rowGap}, childHeight: ${childHeight}")
        // ±2px 取整容差：50vp 在 density 3.25 下为 162.5px，逐边取整引入 ±1 误差
        @Expect(rowGap >= childHeight - 2 && rowGap <= childHeight + 2, true)
    }

    // testFlexSpaceFpUnit：mainSpacing=LengthMetrics(50.0, unit: Fp)，间距存在（随字号换算）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceFpUnit() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_006(Option<CustomView>.None)}, "fsf_1", "Flex_spaceTest", "testFlexSpaceFpUnit")

        let fp1: Component = findInView("fsf_1")
        let fp2: Component = findInView("fsf_2")
        let rectFp1 = fp1.getBounds()
        let rectFp2 = fp2.getBounds()
        let gapFp = rectFp2.left - rectFp1.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceFpUnit fp gap: ${gapFp}")
        @Expect(gapFp > 0, true)
    }

    // testFlexSpaceLpxUnit：mainSpacing=LengthMetrics(5.0, unit: Lpx)，间距存在（随屏宽换算）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceLpxUnit() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_007(Option<CustomView>.None)}, "fsl_1", "Flex_spaceTest", "testFlexSpaceLpxUnit")

        let lpx1: Component = findInView("fsl_1")
        let lpx2: Component = findInView("fsl_2")
        let rectLpx1 = lpx1.getBounds()
        let rectLpx2 = lpx2.getBounds()
        let gapLpx = rectLpx2.left - rectLpx1.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceLpxUnit lpx gap: ${gapLpx}")
        @Expect(gapLpx > 0, true)
    }

    // 边界值：mainSpacing = 0 -> 间距为 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceBoundaryValueZero() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_010(Option<CustomView>.None)}, "fsz_1", "Flex_spaceTest", "testFlexSpaceBoundaryValueZero")

        let comp1: Component = findInView("fsz_1")
        let comp2: Component = findInView("fsz_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceBoundaryValueZero gap: ${rect2.left - rect1.right}")
        @Expect(rect2.left - rect1.right, 0)
    }

    // 边界值：超大值（1e9 px）-> 仅 crash 检测（首子组件可查询；第二子组件被间距推出屏幕不渲染属预期）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceBoundaryValueHuge() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_011(Option<CustomView>.None)}, "fsh_1", "Flex_spaceTest", "testFlexSpaceBoundaryValueHuge")

        let huge = findInView("fsh_1")
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceBoundaryValueHuge found first child: ${huge.getBounds().left >= 0}")
        let huge2 = TestDriver.driver.findComponent(On().id("fsh_2"))
        // 第二子组件被超大间距推出屏幕，断言不可查询
        @Expect(huge2.isSome(), false)
    }

    // 特殊值：NoCall 不设置 space（使用无 space 的既有构造）-> 间距为 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceSpecialValueNoCall() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_001(Option<CustomView>.None)}, "fsn2_1", "Flex_spaceTest", "testFlexSpaceSpecialValueNoCall")

        let comp1: Component = findInView("fsn2_1")
        let comp2: Component = findInView("fsn2_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceSpecialValueNoCall gap: ${rect2.left - rect1.right}")
        @Expect(rect2.left - rect1.right, 0)
    }

    // 注释约束：justifyContent 为 SpaceBetween/SpaceAround/SpaceEvenly 时 space 不生效
    // SpaceBetween 下间距 = 容器宽 - 2*子组件宽（200px），而非 mainSpacing 的 200px
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceSpaceWithJustifyCombo() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_022(Option<CustomView>.None)}, "flex_space_justify", "Flex_spaceTest", "testFlexSpaceSpaceWithJustifyCombo")

        let container: Component = findInView("flex_space_justify")
        let comp1: Component = findInView("fsj_1")
        let comp2: Component = findInView("fsj_2")
        let rect3 = container.getBounds()
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let childWidth = rect1.right - rect1.left
        let gap = rect2.left - rect1.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceSpaceWithJustifyCombo gap: ${gap}, childWidth: ${childWidth}")
        // 两端对齐：首子组件与容器左缘贴合（Column 默认水平居中容器，不能断言窗口坐标 0），
        // 间距 = 容器宽 - 2*子宽 = 320 - 2*50 = 220px（space 的 200px 不生效）
        @Expect(rect1.left, rect3.left)
        @Expect(gap, rect3.right - rect3.left - 2 * childWidth)
    }

    // 多参数组合：mainSpacing 与 crossSpacing 同时设置并同时生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceMainCrossCombo() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_017(Option<CustomView>.None)}, "fsmc_1", "Flex_spaceTest", "testFlexSpaceMainCrossCombo")

        // 同排两个子组件：主轴间距 = 200px
        let a: Component = findInView("fsmc_1")
        let b: Component = findInView("fsmc_2")
        let rect1 = a.getBounds()
        let rect2 = b.getBounds()
        let mainGap = rect2.left - rect1.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceMainCrossCombo mainGap: ${mainGap}")
        @Expect(mainGap, 200)

        // 换行后：交叉轴行间距 = 50px
        let c: Component = findInView("fsmc_3")
        let rect3 = c.getBounds()
        let crossGap = rect3.top - rect1.bottom
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceMainCrossCombo crossGap: ${crossGap}")
        @Expect(crossGap, 50)
    }

    // 多参数组合：Column 方向 × mainSpacing（主轴随方向变化，垂直间距生效）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceColumnDirectionMainSpacing() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_018(Option<CustomView>.None)}, "fscol_1", "Flex_spaceTest", "testFlexSpaceColumnDirectionMainSpacing")

        let comp1: Component = findInView("fscol_1")
        let comp2: Component = findInView("fscol_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.top - rect1.bottom
        let childHeight = rect1.bottom - rect1.top
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceColumnDirectionMainSpacing gap: ${gap}")
        @Expect(gap, childHeight)
    }

    // 多参数组合：RowReverse 方向 × mainSpacing（首子组件贴右，间距仍为 50px）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceRowReverseMainSpacing() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_019(Option<CustomView>.None)}, "fsrr_1", "Flex_spaceTest", "testFlexSpaceRowReverseMainSpacing")

        let a: Component = findInView("fsrr_1")
        let b: Component = findInView("fsrr_2")
        let rect1 = a.getBounds()
        let rect2 = b.getBounds()
        // 反转后 A 在右侧
        @Expect(rect1.right > rect2.right, true)
        let gap = rect1.left - rect2.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceRowReverseMainSpacing gap: ${gap}")
        @Expect(gap, 50)
    }

    // 多参数组合：ColumnReverse 方向 × mainSpacing（首子组件贴底，间距仍为 50px）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceColumnReverseMainSpacing() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_020(Option<CustomView>.None)}, "fscc_1", "Flex_spaceTest", "testFlexSpaceColumnReverseMainSpacing")

        let a: Component = findInView("fscc_1")
        let b: Component = findInView("fscc_2")
        let rect1 = a.getBounds()
        let rect2 = b.getBounds()
        // 反转后 A 在下方
        @Expect(rect1.bottom > rect2.bottom, true)
        let gap = rect1.top - rect2.bottom
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceColumnReverseMainSpacing gap: ${gap}")
        @Expect(gap, 50)
    }

    // 多参数组合：WrapReverse × crossSpacing
    // 用例目的：验证多行（WrapReverse）布局下 crossSpacing 生效，行距 = 50px
    // 行序与行内起点属 WrapReverse 既有语义，与 space 验证解耦，不在此断言
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceWrapReverseCrossSpacing() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_021(Option<CustomView>.None)}, "fswr_1", "Flex_spaceTest", "testFlexSpaceWrapReverseCrossSpacing")

        let a: Component = findInView("fswr_1")
        let b: Component = findInView("fswr_2")
        let rect1 = a.getBounds()
        let rect2 = b.getBounds()
        // 换行发生：A、B 分处两行
        @Expect(rect1.top != rect2.top, true)
        // 行距测量与行序解耦：上行 bottom 到下行 top
        let rowGap = if (rect1.top < rect2.top) { rect2.top - rect1.bottom } else { rect1.top - rect2.bottom }
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceWrapReverseCrossSpacing rowGap: ${rowGap}")
        // crossSpacing 生效：行距 = 50px
        @Expect(rowGap, 50)
    }

    // 注释约束：justifyContent 为 SpaceAround 时 space 不生效（均匀分布间距 != mainSpacing 的 200px）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceSpaceWithJustifySpaceAround() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_023(Option<CustomView>.None)}, "fsja_1", "Flex_spaceTest", "testFlexSpaceSpaceWithJustifySpaceAround")

        let comp1: Component = findInView("fsja_1")
        let comp2: Component = findInView("fsja_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.left - rect1.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceSpaceWithJustifySpaceAround gap: ${gap}")
        // 均匀分布间距 = (320-100)/3 ≈ 73px，与 space 的 200px 无关
        @Expect(gap != 200, true)
        @Expect(gap > 0, true)
    }

    // 注释约束：justifyContent 为 SpaceEvenly 时 space 不生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceSpaceWithJustifySpaceEvenly() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_024(Option<CustomView>.None)}, "fsje_1", "Flex_spaceTest", "testFlexSpaceSpaceWithJustifySpaceEvenly")

        let comp1: Component = findInView("fsje_1")
        let comp2: Component = findInView("fsje_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.left - rect1.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceSpaceWithJustifySpaceEvenly gap: ${gap}")
        @Expect(gap != 200, true)
        @Expect(gap > 0, true)
    }

    // crossSpacing 异常值：负值 -> FWDefault 0（wrap 换行下行间距为 0）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossNegativeInvalid() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_013(Option<CustomView>.None)}, "fscn_1", "Flex_spaceTest", "testFlexSpaceCrossNegativeInvalid")

        let comp1: Component = findInView("fscn_1")
        let comp2: Component = findInView("fscn_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let rowGap = rect2.top - rect1.bottom
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceCrossNegativeInvalid rowGap: ${rowGap}")
        @Expect(rowGap, 0)
    }

    // crossSpacing 异常值：百分比 -> FWDefault 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossPercentInvalid() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_014(Option<CustomView>.None)}, "fscp_1", "Flex_spaceTest", "testFlexSpaceCrossPercentInvalid")

        let comp1: Component = findInView("fscp_1")
        let comp2: Component = findInView("fscp_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let rowGap = rect2.top - rect1.bottom
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceCrossPercentInvalid rowGap: ${rowGap}")
        @Expect(rowGap, 0)
    }

    // crossSpacing 边界值：0 -> 行间距 0
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossBoundaryZero() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_015(Option<CustomView>.None)}, "fscz_1", "Flex_spaceTest", "testFlexSpaceCrossBoundaryZero")

        let comp1: Component = findInView("fscz_1")
        let comp2: Component = findInView("fscz_2")
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let rowGap = rect2.top - rect1.bottom
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceCrossBoundaryZero rowGap: ${rowGap}")
        @Expect(rowGap, 0)
    }

    // crossSpacing 边界值：超大值 -> 仅 crash 检测（首子组件可查询；第二子组件被间距推出屏幕不渲染属预期）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossHugeCrash() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_016(Option<CustomView>.None)}, "fscv_1", "Flex_spaceTest", "testFlexSpaceCrossHugeCrash")

        let comp1 = findInView("fscv_1")
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceCrossHugeCrash first child found")
        let comp2 = TestDriver.driver.findComponent(On().id("fscv_2"))
        // 第二子组件被超大间距推出屏幕，断言不可查询
        @Expect(comp2.isSome(), false)
    }

    // 多参数组合：justifyContent=Center（生效值）× mainSpacing -> space 正常生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceWithJustifyCenterCombo() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_026(Option<CustomView>.None)}, "flex_space_justifycenter", "Flex_spaceTest", "testFlexSpaceWithJustifyCenterCombo")

        let container: Component = findInView("flex_space_justifycenter")
        let comp1: Component = findInView("fsjc_1")
        let comp2: Component = findInView("fsjc_2")
        let rect3 = container.getBounds()
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.left - rect1.right
        let leftOffset = rect1.left - rect3.left
        let containerWidth = rect3.right - rect3.left
        let childWidth = rect1.right - rect1.left
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceWithJustifyCenterCombo gap: ${gap}, leftOffset: ${leftOffset}")
        // Center 下 space 生效：内容总宽 = 2*子宽 + 间距，两侧均分
        @Expect(gap, 50)
        @Expect(leftOffset, (containerWidth - 2 * childWidth - gap) / 2)
    }

    // 多参数组合：justifyContent=End（生效值）× mainSpacing -> space 正常生效
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceWithJustifyEndCombo() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_027(Option<CustomView>.None)}, "flex_space_justifyend", "Flex_spaceTest", "testFlexSpaceWithJustifyEndCombo")

        let container: Component = findInView("flex_space_justifyend")
        let comp1: Component = findInView("fsje2_1")
        let comp2: Component = findInView("fsje2_2")
        let rect3 = container.getBounds()
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.left - rect1.right
        let rightOffset = rect3.right - rect2.right
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceWithJustifyEndCombo gap: ${gap}, rightOffset: ${rightOffset}")
        // End 下 space 生效：子组件贴右且间距为 50px
        @Expect(gap, 50)
        @Expect(rightOffset, 0)
    }

    // 生效值：justifyContent=Start（显式设置）× mainSpacing=200px -> space 正常生效且左对齐
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceWithJustifyStartCombo() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_025(Option<CustomView>.None)}, "flex_space_justifystart", "Flex_spaceTest", "testFlexSpaceWithJustifyStartCombo")

        let container: Component = findInView("flex_space_justifystart")
        let comp1: Component = findInView("fsjs_1")
        let comp2: Component = findInView("fsjs_2")
        let rect3 = container.getBounds()
        let rect1 = comp1.getBounds()
        let rect2 = comp2.getBounds()
        let gap = rect2.left - rect1.right
        let leftOffset = rect1.left - rect3.left
        Hilog.info(1, "Cangjie-Test", "testFlexSpaceWithJustifyStartCombo gap: ${gap}, leftOffset: ${leftOffset}")
        // Start 下 space 生效：子组件左对齐（leftOffset=0）且间距为 200px
        @Expect(gap, 200)
        @Expect(leftOffset, 0)
    }

    // crossSpacing=LengthMetrics(100.0, unit: Px)：行间距精确 100px（不随密度缩放）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossPxUnit() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_028(Option<CustomView>.None)}, "fsc_1", "Flex_spaceTest", "testFlexSpaceCrossPxUnit")

        let rect1 = findInView("fsc_1").getBounds()
        let rect2 = findInView("fsc_2").getBounds()
        let rowGap = rect2.top - rect1.bottom
        Hilog.info(1, "Cangjie-Test", "crossPx rowGap: ${rowGap}")
        @Expect(rowGap >= 98 && rowGap <= 102, true)
    }

    // crossSpacing=LengthMetrics(50.0, unit: Fp)：行间距存在（随字号换算，与 main 侧用例006 对称）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossFpUnit() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_029(Option<CustomView>.None)}, "fsc_1", "Flex_spaceTest", "testFlexSpaceCrossFpUnit")

        let rect1 = findInView("fsc_1").getBounds()
        let rect2 = findInView("fsc_2").getBounds()
        let rowGap = rect2.top - rect1.bottom
        Hilog.info(1, "Cangjie-Test", "crossFp rowGap: ${rowGap}")
        @Expect(rowGap > 0, true)
    }

    // crossSpacing=LengthMetrics(5.0, unit: Lpx)：行间距存在（随屏宽换算，与 main 侧用例007 对称）
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testFlexSpaceCrossLpxUnit() {
        enterFlexSpaceView({_: CustomView => View_Flex_init_030(Option<CustomView>.None)}, "fsc_1", "Flex_spaceTest", "testFlexSpaceCrossLpxUnit")

        let rect1 = findInView("fsc_1").getBounds()
        let rect2 = findInView("fsc_2").getBounds()
        let rowGap = rect2.top - rect1.bottom
        Hilog.info(1, "Cangjie-Test", "crossLpx rowGap: ${rowGap}")
        @Expect(rowGap > 0, true)
    }
}

func enterFlexSpaceView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
