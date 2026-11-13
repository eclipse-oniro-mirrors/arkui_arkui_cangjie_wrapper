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
 * 接口测试：Scroll.scrollable(scrollDirection: ?ScrollDirection)
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

func enterScrollableView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
class Scroll_scrollableTest {
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testScrollScrollableNone() {
        enterScrollableView({_: CustomView => View_Scroll_scrollable_001(Option<CustomView>.None)}, "scroll_dir", "Scroll_scrollableTest", "testScrollScrollableNone")
        // 属性验证：scrollable(ScrollDirection.None) 参数写入并读回
        let inspector = getInspectorByKey("scroll_dir")
        let jsonObject = JsonValue.fromStr(inspector).asObject()
        let attrs = jsonObject.get("$attrs").getOrThrow().asObject()
        let scrollable = attrs.get("scrollable").getOrThrow().toString()
        Hilog.info(1, "Cangjie-Test", "testScrollScrollableNone scrollable: ${scrollable}")
        @Expect(scrollable, "\"ScrollDirection.None\"")
    }
}
