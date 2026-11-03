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

package ohos_app_cangjie_entry.span_lineheight

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

/* ═══════════════════════════════════════════════════
 * 接口5 Span.lineHeight — BC 基准值: 30.fp
 * ═══════════════════════════════════════════════════ */

/**
 * View_1: BC 基准·全基准值 Span.lineHeight(30.fp) (TestSpan_lineHeight_001)
 */
@Component
public class View_Span_lineHeight_1 {
    func build() {
        Text() {
            Span("hello")
                .lineHeight(30.fp)
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}

/**
 * View_2: BC·变化 value 边界 0.fp (TestSpan_lineHeight_002)
 */
@Component
public class View_Span_lineHeight_2 {
    func build() {
        Text() {
            Span("hello")
                .lineHeight(0.fp)
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}

/**
 * View_3: BC·变化 value 边界 Float64.Max.fp (TestSpan_lineHeight_003)
 */
@Component
public class View_Span_lineHeight_3 {
    func build() {
        Text() {
            Span("hello")
                .lineHeight(Float64.Max.fp)
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}

/**
 * View_4: BC·变化 value 无效 Float64.Min.fp (TestSpan_lineHeight_004)
 */
@Component
public class View_Span_lineHeight_4 {
    func build() {
        Text() {
            Span("hello")
                .lineHeight(Float64.Min.fp)
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}

/**
 * View_5: BC·变化 value 无效负值 (-10).fp (TestSpan_lineHeight_005)
 */
@Component
public class View_Span_lineHeight_5 {
    func build() {
        Text() {
            Span("hello")
                .lineHeight((-10).fp)
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}

/**
 * View_6: BC·变化 value 百分比单位 50.percent (TestSpan_lineHeight_006)
 */
@Component
public class View_Span_lineHeight_6 {
    func build() {
        Text() {
            Span("hello")
                .lineHeight(50.percent)
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}

/**
 * View_7: BC·默认值 Option<Length>.None (TestSpan_lineHeight_007)
 */
@Component
public class View_Span_lineHeight_7 {
    func build() {
        Text() {
            Span("hello")
                .lineHeight(Option<Length>.None)
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}

/**
 * View_8: BC·默认值 不调用 lineHeight (TestSpan_lineHeight_008)
 */
@Component
public class View_Span_lineHeight_8 {
    func build() {
        Text() {
            Span("hello")
        }
        .id("Text_span_id")
        .fontSize(16.fp)
    }
}
