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
 * 接口测试：Scroll.edgeEffect
 */
package ohos_app_cangjie_entry_test

import std.collection.ArrayList
import std.convert.*
import std.unittest.*
import std.unittest.testmacro.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.device_info.*
import ohos.hilog.Hilog
import ohos.ui_test
import ohos.ui_test.*
import ohos_app_cangjie_entry.*
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText

@Test
class Scroll_edgeEffectTest {
    // $attrs JsonObject（层级：edgeEffect / edgeEffectOptions{alwaysEnabled, effectEdge}，scrollable_pattern.cpp ToJsonValue）
    private func edgeAttrs(id: String): JsonObject {
        return JsonValue.fromStr(getInspectorByKey(id)).asObject()
        .get("$attrs").getOrThrow().asObject()
    }
    private func edgeEffectAttr(id: String): String {
        return edgeAttrs(id).get("edgeEffect").getOrThrow().toString()
    }
    private func edgeAlwaysEnabled(id: String): String {
        return edgeAttrs(id).get("edgeEffectOptions").getOrThrow().asObject()
        .get("alwaysEnabled").getOrThrow().toString()
    }
    private func edgeEffectEdge(id: String): String {
        return edgeAttrs(id).get("edgeEffectOptions").getOrThrow().asObject()
        .get("effectEdge").getOrThrow().toString()
    }
    private func findInView(id: String): Component {
        return TestDriver.driver.findComponent(On().id(id)).getOrThrow()
    }

    // ===== Spring =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringSingle() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_001(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringSingle")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringNoneOpt() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_002(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringNoneOpt")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringAlwaysStart() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_003(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringAlwaysStart")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringAlwaysEnd() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_004(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringAlwaysEnd")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringAlwaysAll() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_005(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringAlwaysAll")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringAlwaysInvalidThree() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_006(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringAlwaysInvalidThree")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringAlwaysInvalidNegative() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_007(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringAlwaysInvalidNegative")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringAlwaysInvalidLarge() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_008(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringAlwaysInvalidLarge")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringDisabledDefault() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_009(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringDisabledDefault")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringDisabledStart() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_010(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringDisabledStart")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringDisabledEnd() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_011(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringDisabledEnd")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringDisabledAll() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_012(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringDisabledAll")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringDisabledInvalidThree() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_013(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringDisabledInvalidThree")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringDisabledInvalidNegative() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_014(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringDisabledInvalidNegative")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeSpringDisabledInvalidLarge() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_015(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeSpringDisabledInvalidLarge")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== Fade =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeSingle() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_016(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeSingle")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeNoneOpt() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_017(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeNoneOpt")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeAlwaysDefault() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_018(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeAlwaysDefault")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeAlwaysStart() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_019(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeAlwaysStart")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeAlwaysEnd() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_020(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeAlwaysEnd")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeAlwaysAll() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_021(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeAlwaysAll")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeAlwaysInvalidThree() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_022(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeAlwaysInvalidThree")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeAlwaysInvalidNegative() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_023(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeAlwaysInvalidNegative")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeAlwaysInvalidLarge() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_024(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeAlwaysInvalidLarge")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeDisabledDefault() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_025(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeDisabledDefault")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeDisabledStart() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_026(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeDisabledStart")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeDisabledEnd() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_027(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeDisabledEnd")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeDisabledAll() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_028(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeDisabledAll")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeDisabledInvalidThree() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_029(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeDisabledInvalidThree")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeDisabledInvalidNegative() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_030(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeDisabledInvalidNegative")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeFadeDisabledInvalidLarge() {
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_031(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeFadeDisabledInvalidLarge")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== edgeEffect=None =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeOptionNoneSingle() {
        // Option.None 兜底：默认效果 EdgeEffect.None（scroll.cj:1014）
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_032(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeOptionNoneSingle")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.None"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeOptionNoneNoneOpt() {
        // Option.None 兜底：默认效果 EdgeEffect.None（scroll.cj:1014）
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_033(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeOptionNoneNoneOpt")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.None"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== 非滚动容器 + nestedScroll(SelfOnly) =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeNonScrollSpringAlwaysEnabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Spring + alwaysEnabled=true
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_034(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeNonScrollSpringAlwaysEnabled")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeNonScrollSpringDisabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Spring + alwaysEnabled=false
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_035(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeNonScrollSpringDisabled")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeNonScrollFadeAlwaysEnabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Fade + alwaysEnabled=true
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_036(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeNonScrollFadeAlwaysEnabled")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeNonScrollFadeDisabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Fade + alwaysEnabled=false
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_037(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeNonScrollFadeDisabled")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== 两参重载 options:None =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollEdgeNoneEnumOptNone() {
        // 两参重载 edgeEffect(EdgeEffect.None, options:None)：真实 None 直传（兜底语义不触发）
        enterScrollEdgeEffectView({_: CustomView => View_Scroll_edgeEffect_038(Option<CustomView>.None)}, "scroll_e", "Scroll_edgeEffectTest", "testScrollEdgeNoneEnumOptNone")

        let eff = edgeEffectAttr("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.None"), true)
        let always = edgeAlwaysEnabled("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("scroll_e")
        Hilog.info(1, "Cangjie-Test", "scroll_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }
}

func enterScrollEdgeEffectView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
