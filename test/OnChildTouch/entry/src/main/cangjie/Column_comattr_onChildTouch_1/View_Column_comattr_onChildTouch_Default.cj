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
// Test view for Column_comattr_onChildTouch_Default - onChildTouchTest test page
package ohos_app_cangjie_entry.Column_comattr_onChildTouch_1

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import kit.ArkUI.*

@Component
public class View_Column_comattr_onChildTouch_Default {
    @State
    var callbackCount: Int64 = 0
    @State
    var seenMyList: Bool = false
    @State
    var listScrolled: Bool = false
    @State
    var buttonClickCount: Int64 = 0

    func build() {
        Column {
            Text("cb=${this.callbackCount.toString()};seen=${this.seenMyList.toString()}")
                .id("callbackStatusText")
                .fontSize(20.vp)
            Text("scroll=${this.listScrolled.toString()};click=${this.buttonClickCount.toString()}")
                .id("dispatchStatusText")
                .fontSize(20.vp)
            List {
                ListItem { Text("Item 0").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 1").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 2").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 3").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 4").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 5").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 6").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 7").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 8").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 9").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 10").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 11").fontSize(20.vp) }.height(56.vp)
                ListItem { Text("Item 12").fontSize(20.vp) }.height(56.vp)
            }
                .id("MyList")
                .listDirection(Axis.Vertical)
                .scrollBar(BarState.Off)
                .edgeEffect(EdgeEffect.Spring)
                .onScrollIndex({ first: Int32, last: Int32, center: Int32 =>
                    if (first > 0) {
                        this.listScrolled = true
                    }
                })
                .width(100.percent)
                .height(50.percent)
            Button { Text("Button").fontSize(20.vp) }
                .id("MyButton")
                .width(312.vp)
                .height(40.vp)
                .margin(top: 80.vp)
                .onClick({ _ =>
                    this.buttonClickCount = this.buttonClickCount + 1
                })
        }
            .id("Column_comattr_id")
            .width(100.percent)
            .height(100.percent)
            .onChildTouchTest({ touchInfo: Array<TouchTestInfo> =>
                this.callbackCount = this.callbackCount + 1
                for (info in touchInfo) {
                    if (info.id == "MyList") {
                        this.seenMyList = true
                    }
                }
                return TouchResult(TouchTestStrategy.Default)
            })
    }
}
