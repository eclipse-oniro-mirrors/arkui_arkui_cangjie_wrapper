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

package ohos_app_cangjie_entry.text_font

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

// BC 基准值：size=16.fp、weight=FontWeight.Normal、family="HarmonyOS Sans"、style=FontStyle.Normal

/**
 * View_Text_font_1: BC 基准用例·全基准值 (TestText_font_001)
 */
@Component
public class View_Text_font_1 {
    func build() {
        Text("BC base case")
            .id("Text_base_id")
            .font(size: 16.fp, weight: FontWeight.Normal, family: "HarmonyOS Sans", style: FontStyle.Normal)
    }
}

/**
 * View_Text_font_2: BC·变化 size 有效边界 (TestText_font_002)
 * 0.fp / 1.fp / Float64.Max，其余三参数保持基准值
 */
@Component
public class View_Text_font_2 {
    func build() {
        Column(space: 10) {
            Text("size 0.fp")
                .id("Text_0fp_id")
                .font(size: 0.fp, weight: FontWeight.Normal, family: "HarmonyOS Sans", style: FontStyle.Normal)
            Text("size 1.fp")
                .id("Text_1fp_id")
                .font(size: 1.fp, weight: FontWeight.Normal, family: "HarmonyOS Sans", style: FontStyle.Normal)
            Text("size Float64.Max")
                .id("Text_max_id")
                .font(size: Float64.Max.fp, weight: FontWeight.Normal, family: "HarmonyOS Sans", style: FontStyle.Normal)
        }.width(100.percent)
    }
}

/**
 * View_Text_font_3: BC·变化 size 无效值 (TestText_font_003)
 * -5.fp / 50.percent，其余三参数保持基准值
 */
@Component
public class View_Text_font_3 {
    func build() {
        Column(space: 10) {
            Text("size -5.fp")
                .id("Text_neg_id")
                .font(size: (-5).fp, weight: FontWeight.Normal, family: "HarmonyOS Sans", style: FontStyle.Normal)
            Text("size 50.percent")
                .id("Text_pct_id")
                .font(size: 50.percent, weight: FontWeight.Normal, family: "HarmonyOS Sans", style: FontStyle.Normal)
        }.width(100.percent)
    }
}

/**
 * View_Text_font_4: BC·变化 weight (TestText_font_004)
 * W900 / W400，其余三参数保持基准值
 */
@Component
public class View_Text_font_4 {
    func build() {
        Column(space: 10) {
            Text("weight W900")
                .id("Text_w900_id")
                .font(size: 16.fp, weight: FontWeight.W900, family: "HarmonyOS Sans", style: FontStyle.Normal)
            Text("weight W400")
                .id("Text_w400_id")
                .font(size: 16.fp, weight: FontWeight.W400, family: "HarmonyOS Sans", style: FontStyle.Normal)
        }.width(100.percent)
    }
}

/**
 * View_Text_font_5: BC·变化 family 有效值 (TestText_font_005)
 * "Arial" / "Arial,HarmonyOS Sans"，其余三参数保持基准值
 */
@Component
public class View_Text_font_5 {
    func build() {
        Column(space: 10) {
            Text("family Arial")
                .id("Text_arial_id")
                .font(size: 16.fp, weight: FontWeight.Normal, family: "Arial", style: FontStyle.Normal)
            Text("family Arial,HarmonyOS Sans")
                .id("Text_multi_id")
                .font(size: 16.fp, weight: FontWeight.Normal, family: "Arial,HarmonyOS Sans", style: FontStyle.Normal)
        }.width(100.percent)
    }
}

/**
 * View_Text_font_6: BC·变化 family 无效空串 (TestText_font_006)
 * ""，其余三参数保持基准值
 */
@Component
public class View_Text_font_6 {
    func build() {
        Text("family empty")
            .id("Text_empty_id")
            .font(size: 16.fp, weight: FontWeight.Normal, family: "", style: FontStyle.Normal)
    }
}

/**
 * View_Text_font_7: BC·变化 family 超长字符串 (TestText_font_007)
 * 超过100个字符的字符串，其余三参数保持基准值
 */
@Component
public class View_Text_font_7 {
    var family: String = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                         "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb" +
                         "ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" +
                         "ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd" +
                         "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
    func build() {
        Text("family long")
            .id("Text_long_id")
            .font(size: 16.fp, weight: FontWeight.Normal, family: this.family, style: FontStyle.Normal)
    }
}

/**
 * View_Text_font_8: BC·变化 style (TestText_font_008)
 * FontStyle.Italic，其余三参数保持基准值
 */
@Component
public class View_Text_font_8 {
    func build() {
        Text("style Italic")
            .id("Text_italic_id")
            .font(size: 16.fp, weight: FontWeight.Normal, family: "HarmonyOS Sans", style: FontStyle.Italic)
    }
}

/**
 * View_Text_font_9: BC·默认值专项 (TestText_font_009)
 * A: font() 完全不传参（等同全部 None）
 * B: 不调用 font 接口
 */
@Component
public class View_Text_font_9 {
    func build() {
        Column(space: 10) {
            Text("font no args")
                .id("Text_nofont_id")
                .font()
            Text("no font call")
                .id("Text_nocall_id")
        }.width(100.percent)
    }
}