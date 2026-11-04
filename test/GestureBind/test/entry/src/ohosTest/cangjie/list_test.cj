/**
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

package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.modtestView
import ohos_app_cangjie_entry.modtestCaseText
import ohos_app_cangjie_entry.modtestSuiteText
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import std.collection.*
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*

import ohos_app_cangjie_entry_test.unittest_support.registerTestSuite

private let register = testsuite()

func testsuite() {
    registerTestSuite {Gesture_comattr_gesture_1_test()}
    registerTestSuite {Gesture_comattr_gesture_2_test()}
    registerTestSuite {Gesture_comattr_parallel_1_test()}
    registerTestSuite {Gesture_comattr_parallel_2_test()}
    registerTestSuite {Gesture_comattr_gesture_arkts_test()}
    registerTestSuite {Gesture_AllComponents_test()}
    registerTestSuite {Gesture_AllComponentsFull_1_test()}
    registerTestSuite {Gesture_AllComponentsFull_2_test()}
    registerTestSuite {Gesture_AllComponentsFull_3_test()}
    registerTestSuite {Gesture_AllComponentsFull_4_test()}
    registerTestSuite {Gesture_comattr_parallel_compete_test()}
    registerTestSuite {Gesture_comattr_gesture_value_test()}
    registerTestSuite {Gesture_comattr_type_value_test()}
}
