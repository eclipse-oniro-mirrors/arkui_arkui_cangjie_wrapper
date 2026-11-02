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

package ohos.arkui.component.column_split

import ohos.arkui.component.common.{CommonMethodComponent}
import ohos.labels.{APILevel}

foreign {
    func FfiOHOSAceFrameworkColumnSplitCreate(): Unit

    func FfiOHOSAceFrameworkColumnSplitResizeable(value: Bool): Unit
}

/**
 * Defines the ColumnSplit component.
 * A container that arranges child components vertically and inserts a horizontal divider between every two child
 *     components.
 * This component limits the height of its child components through dividers.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ColumnSplit <: CommonMethodComponent<ColumnSplit> & ColumnSplitAttribute {
    /**
     * ColumnSplit constructor.
     * Creates a vertical split layout container with dividers between child components.
     *
     * @param { () -> Unit } content - The child components of the ColumnSplit.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: () -> Unit) {
        unsafe {
            FfiOHOSAceFrameworkColumnSplitCreate()
        }
        this.child = content
    }

    /**
     * Sets whether the divider can be dragged.
     *
     * @param { ?Bool } value - Whether the divider can be dragged. true: The divider can be dragged. false: The divider
     *     cannot be dragged. Default value: false. Invalid values are treated as the default value.
     * @returns { This } The instance of the component.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resizeable(value: ?Bool): This {
        unsafe {
            FfiOHOSAceFrameworkColumnSplitResizeable(value ?? false)
        }
        this
    }
}
