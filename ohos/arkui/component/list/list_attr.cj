/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

package ohos.arkui.component.list

import ohos.arkui.component.common.{Axis, EdgeEffect, ListItemAlign, StickyStyle, ScrollState, EdgeEffectOptions}
import ohos.arkui.component.scroll.{ScrollableCommonMethod}
import ohos.arkui.component.list_item_group.{ListDividerOptions}
import ohos.labels.{APILevel}
import ohos.base.{Length}

/**
 * Defines the List attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ListAttribute <: ScrollableCommonMethod<ListAttribute> {

    /**
     * Sets the direction in which the list items are arranged.
     *
     * @param { ?Axis } value - The axis direction.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func listDirection(value: ?Axis): ListAttribute

    /**
     * Sets the style of the divider for the list items. By default, there is no divider.
     *
     * @param { Option<ListDividerOptions> } value - The divider options.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func divider(value: Option<ListDividerOptions>): ListAttribute

    /**
     * Sets the effect used when the scroll boundary is reached.
     *
     * @param { ?EdgeEffect } value - The edge effect style.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func edgeEffect(value: ?EdgeEffect): ListAttribute

    /**
     * Sets whether to enable chained animations, which provide a visually connected,
     * or "chained," effect when the list is scrolled or its top or bottom edge is dragged.
     *
     * @param { ?Bool } value - Whether to enable chained animations.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func chainAnimation(value: ?Bool): ListAttribute

    /**
     * Called when the minimum number of list item caches is set for long list deferred loading.
     *
     * @param { ?Int32 } value - The cached count value.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func cachedCount(value: ?Int32): ListAttribute

    /**
     * Sets whether to enable multiselect.
     *
     * @param { ?Bool } value - Whether to enable multiselect.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func multiSelectable(value: ?Bool): ListAttribute

    /**
     * Sets the number of columns or rows in the list. If the value is set to the gutter type, it indicates the gap between columns.
     * It takes effect when the number of columns is greater than 1.
     *
     * @param { ?Int32 } value - The lanes count.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func lanes(value: ?Int32): ListAttribute

    /**
     * Sets the number of columns or rows in the list. If the value is set to the gutter type, it indicates the gap between columns.
     * It takes effect when the number of columns is greater than 1.
     *
     * @param { ?Length } minLength - The minimum length of lanes.
     * @param { ?Length } maxLength - The maximum length of lanes.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func lanes(minLength!: ?Length, maxLength!: ?Length): ListAttribute

    /**
     * Alignment mode of list items along the cross axis when the cross-axis width of the list is greater
     * than the cross-axis width of list items multiplied by the value of lanes.
     *
     * @param { ?ListItemAlign } value - The alignment mode.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func alignListItem(value: ?ListItemAlign): ListAttribute

    /**
     * Sets whether to pin the header to the top or the footer to the bottom in the list item group.
     *
     * @param { ?StickyStyle } value - The sticky style.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func sticky(value: ?StickyStyle): ListAttribute

    /**
     * Triggered when a child component enters or leaves the list display area.
     *
     * @param { ?(Int32, Int32, Int32) -> Unit } event - The scroll index event handler.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollIndex(event: ?(Int32, Int32, Int32) -> Unit): ListAttribute

    /**
     * Called when scrolling begin each frame.
     *
     * @param { ?(Float64, ScrollState) -> OnScrollFrameBeginHandlerResult } event - The scroll frame begin event handler.
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onScrollFrameBegin(event: ?(Float64, ScrollState) -> OnScrollFrameBeginHandlerResult): ListAttribute

    /**
     * Sets the effect used when the scroll boundary is reached.
     *
     * @param { ?EdgeEffect } edgeEffect - Effect used when the scroll boundary is reached. The spring and shadow
     *     effects are supported.
     *     Default value: EdgeEffect.Spring.
     * @param { ?EdgeEffectOptions } options - Whether to enable the scroll effect when the component content is smaller
     *     than the component itself. The value EdgeEffectOptions(true) means to enable the scroll effect, and
     *     EdgeEffectOptions(false) means the opposite. Default value: EdgeEffectOptions(false).
     * @returns { ListAttribute }
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func edgeEffect(edgeEffect: ?EdgeEffect, options!: ?EdgeEffectOptions): ListAttribute

    /**
     * Sets the scroll snap alignment effect for list items when scrolling ends.
     * This API is available only when the heights of list items are the same. During the alignment animation,
     * the scroll operation source type reported by the onWillScroll event is ScrollSource.Fling.
     *
     * @param { ?ScrollSnapAlign } value - Alignment mode of the scroll snap position. Default value:
     *     ScrollSnapAlign.None.
     * @returns { ListAttribute } The attribute of the component.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollSnapAlign(value: ?ScrollSnapAlign): ListAttribute
}
