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

package ohos.arkui.component.tab

import ohos.arkui.component.common.{CommonMethod, BarMode, CustomBuilder, EdgeEffect}
import ohos.labels.{APILevel}
import ohos.base.{Length, Callback, ResourceStr, ResourceColor}

/**
 * Defines the tabs attribute functions.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TabsAttribute <: CommonMethod<TabsAttribute> {
    /**
     * Called when the width of the bar graph is set.
     * Configures the width of the tab bar.
     *
     * @param { ?Length } value - Width of the tab bar. If the set value is less than 0
     * or greater than the width of the Tabs component, the default value is used.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func barWidth(value: ?Length): TabsAttribute

    /**
     * Called when the height of the bar graph is set.
     * Configures the height of the tab bar.
     *
     * @param { ?Length } value - Height of the tab bar. If the set value is less than 0 or
     * greater than the height of the Tabs component, the default value is used.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func barHeight(value: ?Length): TabsAttribute

    /**
     * Sets whether to use vertical tabs.
     * Configures the orientation of the tabs.
     *
     * @param { ?Bool } value - Whether to use vertical tabs. The default value is false.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func vertical(value: ?Bool): TabsAttribute

    /**
     * Sets whether the tabs are scrollable.
     * Controls whether the tab bar can be scrolled when there are many tabs.
     *
     * @param { ?Bool } value - Whether the tabs are scrollable. The default value is true.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func scrollable(value: ?Bool): TabsAttribute

    /**
     * Sets the tab bar layout mode to BarMode.Fixed.
     * Configures the layout mode of the tab bar.
     *
     * @param { ?BarMode } value - The width of each tab is determined by equally dividing
     * the number of tabs by the bar width (or bar height in the vertical layout).
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func barMode(value: ?BarMode): TabsAttribute

    /**
     * Sets the length of time required to complete the tab switching animation,
     * which is initiated by clicking a specific tab or by calling the changeIndex API of TabsController.
     * Configures the duration of the tab switching animation.
     *
     * @param { ?Float32 } value - Animation duration in seconds.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func animationDuration(value: ?Float32): TabsAttribute

    /**
     * Triggered when a tab is switched.
     *
     * <p><strong>NOTE</strong>:
     * <br>This event is triggered when any of the following conditions is met:
     * 1. The swiping animation is completed, followed by tab switching.
     * 2. The Controller API is called.
     * 3. The attribute value is updated using a state variable.
     * 4. A tab is clicked.
     * </p>
     *
     * @param { ?Callback<Int32, Unit> } event - Callback function triggered when tab changes.
     * The parameter is the index of the selected tab.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onChange(event: ?Callback<Int32, Unit>): TabsAttribute

    /**
     * Sets the divider between the TabBar and TabContent components.
     *
     * @param { ?Length } strokeWidth - Width of the divider. It cannot be set in percentage.
     *  Default value: 0.0, Unit: vp, Value range: [0, +∞).
     * @param { ?ResourceColor } color - Color of the divider. Default value: #33182431.
     * @param { ?Length } startMargin - Distance between the divider and the top of the sidebar.
     *  It cannot be set in percentage. Default value: 0.0, Unit: vp, Value range: [0, +∞).
     * @param { ?Length } endMargin - Distance between the divider and the bottom of the sidebar.
     *  It cannot be set in percentage. Default value: 0.0, Unit: vp, Value range: [0, +∞).
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func divider(strokeWidth!: ?Length, color!: ?ResourceColor, startMargin!: ?Length, 
        endMargin!: ?Length): TabsAttribute

    /**
     * Sets the edge effect used when the boundary of the scrolling area is reached.
     *
     * @param { ?EdgeEffect } edgeEffect - Effect used when the boundary of the scrolling area is reached.
     * Default value: EdgeEffect.Spring
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func edgeEffect(edgeEffect: ?EdgeEffect): TabsAttribute

    /**
     * Triggered when the transition animation starts. If animationDuration is
     * set to 0 and scrollable is set to false, this callback is not triggered.
     *
     * @param { ?(Int32, Int32, TabsAnimationEvent) -> Unit } handler - Callback triggered when the transition animation starts.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onAnimationStart(handler: ?(Int32, Int32, TabsAnimationEvent) -> Unit): TabsAttribute

    /**
     * Triggered when a new page is about to be displayed.
     *
     * This event is triggered when any of the following occurs:
     *
     * 1. When the user swipes through the TabContent to switch to a new page.
     *
     * 2. When TabsController.changeIndex is called to switch to a new page.
     *
     * 3. When the index attribute is changed to switch to a new page.
     *
     * 4. When the user taps a tab on the tab bar to switch to a new page.
     *
     * 5. When the user presses the left or
     *     right arrow key on the keyboard to switch to a new page while the tab bar has focus.
     *
     * @param { ?(Int32, Int32) -> Bool } handler - Callback triggered when a new page is about to be displayed.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onContentWillChange(handler: ?(Int32, Int32) -> Bool): TabsAttribute

    /**
     * Triggered on a frame-by-frame basis during swipe gestures for tab switching.
     *
     * @param { ?(Int32, TabsAnimationEvent) -> Unit } handler - Triggered on a frame-by-frame basis during swipe gestures for tab switching.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onGestureSwipe(handler: ?(Int32, TabsAnimationEvent) -> Unit): TabsAttribute

    /**
     * Triggered when a tab is clicked.
     *
     * @param { ?(Int32) -> Unit } event - Index of the clicked tab. The index starts from 0.
     * @returns { TabsAttribute } Returns the tabs attribute.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func onTabBarClick(event: ?(Int32) -> Unit): TabsAttribute
}

/**
 * Defines the attribute functions of TabContent.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface TabContentAttribute <: CommonMethod<TabContentAttribute> {
    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the content set exceeds the space provided by the tab bar, it will be clipped.
     * </p>
     *
     * @param { ?ResourceStr } content - Content displayed on the tab bar.
     * @returns { TabContentAttribute } Returns the tab content attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabBar(content: ?ResourceStr): TabContentAttribute

    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>The bottom tab style does not include an indicator.
     * <br>When an icon display error occurs, a gray blank block is displayed.
     * </p>
     *
     * @param { ?ResourceStr } icon - TabBar icon.
     * @param { ?ResourceStr } text - TabBar text.
     * @returns { TabContentAttribute } Returns the tab content attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabBar(icon!: ?ResourceStr, text!: ?ResourceStr): TabContentAttribute

    /**
     * Sets the content displayed on the tab bar.
     *
     * <p><strong>NOTE</strong>:
     * <br>If the content set exceeds the space provided by the tab bar, it will be clipped.
     * </p>
     *
     * @param { ?CustomBuilder } content - Content displayed on the tab bar.
     * @returns { TabContentAttribute } Returns the tab content attribute.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func tabBar(content: ?CustomBuilder): TabContentAttribute
}
