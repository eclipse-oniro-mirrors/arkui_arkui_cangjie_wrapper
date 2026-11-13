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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.__GenerateResource__
import ohos.resource_manager.*
import kit.ArkUI.*

/**
 * Video.onStop 播放到结束验证
 */
@Component
public class View_Video_onStop_003 {
    @State
    var finishMsg: String = ""
    @State
    var stopMsg: String = ""
    var videoSrc: AppResource = @rawfile("video.mp4")
    var controller: VideoController = VideoController()

    func build() {
        Column(space: 10) {
            Video(src: this.videoSrc, controller: this.controller)
                .width(300.px)
                .height(200.px)
                .autoPlay(false)
                .controls(false)
                .muted(true)
                .onFinish({ =>
                    this.finishMsg = "onFinish"
                })
                .onStop({ =>
                    this.stopMsg = "onStop"
                })
                .id("video_on_stop")
            Row(space: 10) {
                Button("start").id("video_start_btn").onClick({
                    evt => this.controller.start()
                })
            }
            Text(this.finishMsg).id("video_on_finish_msg")
            Text(this.stopMsg).id("video_on_stop_msg")
        }.margin(top: 20, left: 20)
    }
}
