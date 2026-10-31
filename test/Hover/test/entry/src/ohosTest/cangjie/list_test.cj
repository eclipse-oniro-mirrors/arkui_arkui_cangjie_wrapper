package ohos_app_cangjie_entry_test
import ohos_app_cangjie_entry.Hover_AllComponents.*
import ohos_app_cangjie_entry.Column_comattr_hover_arkts.*
import ohos_app_cangjie_entry.Column_comattr_hover_1.*
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

import ohos.arkui.component.custom_component.CustomView

private let register = testsuite()

func testsuite() {
    registerTestSuite {Hover_AllComponents_test()}
    registerTestSuite {Column_comattr_hover_1_test()}
    registerTestSuite {Column_comattr_hover_arkts_test()}
}
