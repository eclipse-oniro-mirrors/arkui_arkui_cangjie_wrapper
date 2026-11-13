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
 * 接口测试：List.edgeEffect
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
class List_edgeEffectTest {
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
    func testListEdgeSpringSingle() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_002(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringSingle")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringNoneOpt() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_003(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringNoneOpt")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringAlwaysDefault() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_004(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringAlwaysDefault")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringAlwaysStart() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_005(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringAlwaysStart")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringAlwaysEnd() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_006(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringAlwaysEnd")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringAlwaysAll() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_007(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringAlwaysAll")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringAlwaysInvalidThree() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_008(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringAlwaysInvalidThree")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringAlwaysInvalidNegative() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_009(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringAlwaysInvalidNegative")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringAlwaysInvalidLarge() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_010(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringAlwaysInvalidLarge")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringDisabledDefault() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_011(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringDisabledDefault")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringDisabledStart() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_012(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringDisabledStart")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringDisabledEnd() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_013(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringDisabledEnd")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringDisabledAll() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_014(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringDisabledAll")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringDisabledInvalidThree() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_015(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringDisabledInvalidThree")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringDisabledInvalidNegative() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_016(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringDisabledInvalidNegative")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeSpringDisabledInvalidLarge() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_017(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeSpringDisabledInvalidLarge")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== Fade =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeSingle() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_018(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeSingle")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeNoneOpt() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_019(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeNoneOpt")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeAlwaysDefault() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_020(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeAlwaysDefault")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeAlwaysStart() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_021(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeAlwaysStart")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeAlwaysEnd() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_022(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeAlwaysEnd")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeAlwaysAll() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_023(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeAlwaysAll")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeAlwaysInvalidThree() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_024(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeAlwaysInvalidThree")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeAlwaysInvalidNegative() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_025(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeAlwaysInvalidNegative")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeAlwaysInvalidLarge() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_026(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeAlwaysInvalidLarge")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeDisabledDefault() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_027(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeDisabledDefault")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeDisabledStart() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_028(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeDisabledStart")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.Start"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeDisabledEnd() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_029(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeDisabledEnd")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.End"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeDisabledAll() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_030(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeDisabledAll")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeDisabledInvalidThree() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_031(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeDisabledInvalidThree")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeDisabledInvalidNegative() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_032(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeDisabledInvalidNegative")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeFadeDisabledInvalidLarge() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_033(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeFadeDisabledInvalidLarge")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== edgeEffect=None =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeOptionNoneSingle() {
        // Option.None 兜底：默认滑动效果 Spring（list.cj:626/938）
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_034(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeOptionNoneSingle")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeOptionNoneEnumSingle() {
        // Option.None 兜底：默认滑动效果 Spring（list.cj:626/938）
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_035(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeOptionNoneEnumSingle")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeNoneEnumSingle() {
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_036(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeNoneEnumSingle")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.None"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== 非滚动容器 + nestedScroll(SelfOnly) =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeNonScrollSpringAlwaysEnabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Spring + alwaysEnabled=true
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_037(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeNonScrollSpringAlwaysEnabled")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeNonScrollSpringDisabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Spring + alwaysEnabled=false
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_038(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeNonScrollSpringDisabled")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeNonScrollFadeAlwaysEnabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Fade + alwaysEnabled=true
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_039(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeNonScrollFadeAlwaysEnabled")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("true"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeNonScrollFadeDisabled() {
        // 属性层验证：内容(120px)<组件(200px) 非滚动容器 + Fade + alwaysEnabled=false
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_040(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeNonScrollFadeDisabled")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Fade"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== 两参重载 options:None =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeNoneEnumOptNone() {
        // 两参重载 edgeEffect(EdgeEffect.None, options:None)：真实 None 直传（不走 Spring 兜底）
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_041(Option<CustomView>.None)}, "list_e", "List_edgeEffectTest", "testListEdgeNoneEnumOptNone")

        let eff = edgeEffectAttr("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.None"), true)
        let always = edgeAlwaysEnabled("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e")
        Hilog.info(1, "Cangjie-Test", "list_e effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }

    // ===== NoCall 默认值 =====
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testListEdgeNoCall() {
        // 属性层验证：NoCall List（list_e_nocall，未调用 edgeEffect）序列化 = 默认值（默认滑动效果 Spring / alwaysEnabled=false / All）
        enterListEdgeEffectView({_: CustomView => View_List_edgeEffect_001(Option<CustomView>.None)}, "list_e_nocall", "List_edgeEffectTest", "testListEdgeNoCall")

        let eff = edgeEffectAttr("list_e_nocall")
        Hilog.info(1, "Cangjie-Test", "list_e_nocall edgeEffect: ${eff}")
        @Expect(eff.contains("EdgeEffect.Spring"), true)
        let always = edgeAlwaysEnabled("list_e_nocall")
        Hilog.info(1, "Cangjie-Test", "list_e_nocall alwaysEnabled: ${always}")
        @Expect(always.contains("false"), true)
        let edge = edgeEffectEdge("list_e_nocall")
        Hilog.info(1, "Cangjie-Test", "list_e_nocall effectEdge: ${edge}")
        @Expect(edge.contains("EffectEdge.All"), true)
    }
}

func enterListEdgeEffectView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
