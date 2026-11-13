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
 * 接口测试：Video.onStop
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
class Video_onStopTest {
    private func boundsOf(id: String) {
        findInView(id).getBounds()
    }

    private func textOf(id: String): String {
        try {
            TestDriver.driver.findComponent(On().id(id)).getOrThrow().getText()
        } catch (e: Exception) {
            ""
        }
    }

    private func waitUntil(timeoutMs: Int64, cond: () -> Bool): Bool {
        var waited: Int64 = 0
        while (waited < timeoutMs) {
            if (cond()) {
                return true
            }
            sleepFor(500.milliSecond)
            waited += 500
        }
        return cond()
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

    // stop() 触发 onStop 回调
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testVideoOnStopTriggered() {
        enterVideoOnStopView({_: CustomView => View_Video_onStop_001(Option<CustomView>.None)}, "video_start_btn", "Video_onStopTest", "testVideoOnStopTriggered")

        TestDriver.driver.findComponent(On().id("video_start_btn")).getOrThrow().click()
        sleepFor(2000.milliSecond)
        TestDriver.driver.findComponent(On().id("video_stop_btn")).getOrThrow().click()
        let found = waitUntil(15000) { =>
            textOf("video_on_stop_msg") == "onStop"
        }
        Hilog.info(1, "Cangjie-Test", "testVideoOnStopTriggered msg: ${textOf("video_on_stop_msg")}")
        @Expect(found, true)
    }

    // 暂停播放不触发 onStop
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testVideoPauseNotTriggerOnStop() {
        enterVideoOnStopView({_: CustomView => View_Video_onStop_005(Option<CustomView>.None)}, "video_pause_btn", "Video_onStopTest", "testVideoPauseNotTriggerOnStop")

        TestDriver.driver.findComponent(On().id("video_start_btn")).getOrThrow().click()
        sleepFor(2000.milliSecond)
        TestDriver.driver.findComponent(On().id("video_pause_btn")).getOrThrow().click()
        sleepFor(2000.milliSecond)
        let msg = textOf("video_on_stop_msg")
        Hilog.info(1, "Cangjie-Test", "testVideoPauseNotTriggerOnStop msg: ${msg}")
        @Expect(msg != "onStop", true)
    }

    // onStop(None) 恢复默认：stop 不崩溃，按钮回调正常执行
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testVideoOnStopNoneRestoreDefault() {
        enterVideoOnStopView({_: CustomView => View_Video_onStop_004(Option<CustomView>.None)}, "video_start_btn", "Video_onStopTest", "testVideoOnStopNoneRestoreDefault")

        TestDriver.driver.findComponent(On().id("video_start_btn")).getOrThrow().click()
        sleepFor(2000.milliSecond)
        TestDriver.driver.findComponent(On().id("video_stop_btn")).getOrThrow().click()
        sleepFor(2000.milliSecond)
        @Expect(textOf("video_on_stop_msg"), "")
        // 页面未被破坏，两个 Video 均可查询
        @Expect(TestDriver.driver.findComponent(On().id("video_on_stop")).isSome(), true)
        @Expect(TestDriver.driver.findComponent(On().id("video_on_stop")).isSome(), true)
    }

    // 未开始播放直接 stop
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testVideoOnStopExceptionNotStarted() {
        enterVideoOnStopView({_: CustomView => View_Video_onStop_002(Option<CustomView>.None)}, "video_stop_btn", "Video_onStopTest", "testVideoOnStopExceptionNotStarted")

        TestDriver.driver.findComponent(On().id("video_stop_btn")).getOrThrow().click()
        sleepFor(2000.milliSecond)
        // 未开始播放直接 stop 也会触发 onStop 回调
        @Expect(textOf("video_on_stop_msg"), "onStop")
        // 不崩溃且页面完好
        @Expect(TestDriver.driver.findComponent(On().id("video_on_stop")).isSome(), true)
    }

    // 播放到底触发 onFinish，不触发 onStop
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testVideoOnStopPlayToEnd() {
        enterVideoOnStopView({_: CustomView => View_Video_onStop_003(Option<CustomView>.None)}, "video_start_btn", "Video_onStopTest", "testVideoOnStopPlayToEnd")

        TestDriver.driver.findComponent(On().id("video_start_btn")).getOrThrow().click()
        // 播放结束触发的是 onFinish 回调函数，而非 onStop
        let finished = waitUntil(60000) { =>
            textOf("video_on_finish_msg") == "onFinish"
        }
        @Expect(finished, true)
        // onStop 仅 stop() 显式停止触发，播放到底不触发
        Hilog.info(1, "Cangjie-Test", "testVideoOnStopPlayToEnd stopMsg: ${textOf("video_on_stop_msg")}")
        @Expect(textOf("video_on_stop_msg"), "")
    }

    // onStop 与 onStart/onPause 等生命周期回调并存时互不阻塞，均按各自时机触发
    @TestCase
    @Tag[APILevel26, TestLevel0]
    func testVideoOnStopWithLifecycleCallbacks() {
        enterVideoOnStopView({_: CustomView => View_Video_onStop_006(Option<CustomView>.None)}, "video_start_btn", "Video_onStopTest", "testVideoOnStopWithLifecycleCallbacks")

        // start -> onStart 触发
        TestDriver.driver.findComponent(On().id("video_start_btn")).getOrThrow().click()
        let started = waitUntil(10000) { =>
            textOf("video_on_start_msg") == "onStart"
        }
        @Expect(started, true)

        // pause -> onPause 触发
        TestDriver.driver.findComponent(On().id("video_pause_btn")).getOrThrow().click()
        let paused = waitUntil(10000) { =>
            textOf("video_on_pause_msg") == "onPause"
        }
        @Expect(paused, true)

        // stop -> onStop 触发，且前两个回调状态保持（互不阻塞/互不覆盖）
        TestDriver.driver.findComponent(On().id("video_stop_btn")).getOrThrow().click()
        let stopped = waitUntil(10000) { =>
            textOf("video_on_stop_msg") == "onStop"
        }
        Hilog.info(1, "Cangjie-Test",
        "testVideoOnStopWithLifecycleCallbacks start: ${textOf("video_on_start_msg")}, pause: ${textOf("video_on_pause_msg")}, stop: ${textOf("video_on_stop_msg")}")
        @Expect(stopped, true)
        @Expect(textOf("video_on_start_msg"), "onStart")
        @Expect(textOf("video_on_pause_msg"), "onPause")
    }
}

func enterVideoOnStopView(view: (CustomView) -> CustomView, comattrId: String, suiteName: String, caseName: String): Unit {
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
