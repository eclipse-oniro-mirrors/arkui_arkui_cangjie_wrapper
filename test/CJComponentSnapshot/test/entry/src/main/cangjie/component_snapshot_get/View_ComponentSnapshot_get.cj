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

package ohos_app_cangjie_entry.component_snapshot_get

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.ui_context.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.graphics.color_space_manager.*
import kit.ImageKit.PixelMap
import kit.CangjieKit.AsyncCallback
import kit.CangjieKit.BusinessException
import kit.PerformanceAnalysisKit.Hilog
import kit.LocalizationKit.*

/*
 * 截图回调存档全局变量（测试侧读取断言）
 */
public var snapDone: Bool = false
public var snapErrCode: Int32 = -1
public var snapErrMessage: String = ""
public var snapPixelMapPresent: Bool = false

func resetSnapState(): Unit {
    snapDone = false
    snapErrCode = -1
    snapErrMessage = ""
    snapPixelMapPresent = false
}

func setSnapResultState(err: Option<BusinessException>, pixelMap: Option<PixelMap>): Unit {
    snapDone = true
    snapErrCode = if (err.isNone()) {0} else {err.getOrThrow().code}
    snapErrMessage = if (err.isNone()) {""} else {err.getOrThrow().message}
    snapPixelMapPresent = if (err.isNone() && pixelMap.isSome()) {true} else {false}
}

/**
 * View_ComponentSnapshot_get_1: 默认 options 截图成功（TestComponentSnapshot_get_001）
 */
@Component
public class View_ComponentSnapshot_get_1 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("default options").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get("Snapshot_target_id",{
                        err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                    })
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_2: 缓存同实例（TestComponentSnapshot_get_002）
 */
@Component
public class View_ComponentSnapshot_get_2 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("call twice").onClick({
                e =>
                    resetSnapState()
                    let uiContext = this.getUIContext()
                    let snapshot1 = uiContext.getComponentSnapshot()
                    let snapshot2 = uiContext.getComponentSnapshot()
                    snapshot1.get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        }
                    )
                    snapshot2.get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        }
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_3: 早期调用链路（TestComponentSnapshot_get_003）
 */
@Component
public class View_ComponentSnapshot_get_3 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    protected func aboutToAppear() {
        resetSnapState()
        this.getUIContext().getComponentSnapshot().get(
            "Snapshot_target_id",
            { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                setSnapResultState(err, pixelMap)
                if (err.isNone() && pixelMap.isSome()) {
                    this.pixelMap = pixelMap.getOrThrow()
                }
            }
        )
    }

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_4: 不存在 id 错误契约（TestComponentSnapshot_get_004）
 */
@Component
public class View_ComponentSnapshot_get_4 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("not exist id").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "not_exist_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        }
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_5: 空串 id 截屏（TestComponentSnapshot_get_005）
 */
@Component
public class View_ComponentSnapshot_get_5 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("empty id").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        }
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_6: options None 默认构造（TestComponentSnapshot_get_006）
 */
@Component
public class View_ComponentSnapshot_get_6 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("options none").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: Option<SnapshotOptions>.None
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_7: scale 正常值 1.0（TestComponentSnapshot_get_007）
 */
@Component
public class View_ComponentSnapshot_get_7 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("scale 1.0").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(scale: 1.0)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_8: scale 边界值 0（TestComponentSnapshot_get_008）
 */
@Component
public class View_ComponentSnapshot_get_8 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("scale 0").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(scale: 0.0)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_9: scale 无效等价类 -1（TestComponentSnapshot_get_009）
 */
@Component
public class View_ComponentSnapshot_get_9 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("scale -1").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(scale: -1.0)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_10: scale 边界值 Float64.Max（TestComponentSnapshot_get_010）
 */
@Component
public class View_ComponentSnapshot_get_10 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("scale max").onClick({
                e =>
                    Hilog.info(0u32, "CangjieTest", "TestCase_11 onClick start.")
                    Hilog.info(0u32, "CangjieTest", "TestCase_11 Float64.Max:${Float64.Max}.")
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            Hilog.info(0u32, "CangjieTest", "TestCase_11 callback start.")
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                            Hilog.info(0u32, "CangjieTest", "TestCase_11 callback end.")
                        },
                        options: SnapshotOptions(scale: Float64.Max)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_11: scale 无效等价类 Float64.Min（TestComponentSnapshot_get_011）
 */
@Component
public class View_ComponentSnapshot_get_11 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("scale min").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(scale: Float64.Min)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_12: scale Option.None 默认 1.0（TestComponentSnapshot_get_012）
 */
@Component
public class View_ComponentSnapshot_get_12 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("scale None").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(scale: Option<Float64>.None)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_13: waitUntilRenderFinished true（TestComponentSnapshot_get_013）
 */
@Component
public class View_ComponentSnapshot_get_13 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("wait true").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(waitUntilRenderFinished: true)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_14: waitUntilRenderFinished false（TestComponentSnapshot_get_014）
 */
@Component
public class View_ComponentSnapshot_get_14 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("wait false").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(waitUntilRenderFinished: false)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_15: waitUntilRenderFinished Option.None 默认 false（TestComponentSnapshot_get_015）
 */
@Component
public class View_ComponentSnapshot_get_15 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("wait None").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(waitUntilRenderFinished: Option<Bool>.None)
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_16: SnapshotRegion 合法区域（TestComponentSnapshot_get_016）
 */
@Component
public class View_ComponentSnapshot_get_16 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("region valid").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: SnapshotRegion(
                                left: this.getUIContext().vp2px(5.0).getOrThrow().value,
                                right: this.getUIContext().vp2px(115.0).getOrThrow().value,
                                top: this.getUIContext().vp2px(5.0).getOrThrow().value,
                                bottom: this.getUIContext().vp2px(25.0).getOrThrow().value)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_17: SnapshotRegion 全边界坐标（TestComponentSnapshot_get_017）
 */
@Component
public class View_ComponentSnapshot_get_17 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("region boundary").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: SnapshotRegion(
                                left: this.getUIContext().vp2px(0.0).getOrThrow().value,
                                right: this.getUIContext().vp2px(120.0).getOrThrow().value,
                                top: this.getUIContext().vp2px(0.0).getOrThrow().value,
                                bottom: this.getUIContext().vp2px(30.0).getOrThrow().value)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_18: SnapshotRegion 越界区域（TestComponentSnapshot_get_018）
 */
@Component
public class View_ComponentSnapshot_get_18 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("region out of bounds").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: SnapshotRegion(
                                left: this.getUIContext().vp2px(-5.0).getOrThrow().value,
                                right: this.getUIContext().vp2px(300.0).getOrThrow().value,
                                top: this.getUIContext().vp2px(-5.0).getOrThrow().value,
                                bottom: this.getUIContext().vp2px(300.0).getOrThrow().value)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_19: SnapshotRegion 反向区域 right<left（TestComponentSnapshot_get_019）
 */
@Component
public class View_ComponentSnapshot_get_19 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("region reversed").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: SnapshotRegion(left: 120.0, right: 50.0, top: 30.0, bottom: 20.0)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_20: LocalizedSnapshotRegion 合法区域（TestComponentSnapshot_get_020）
 */
@Component
public class View_ComponentSnapshot_get_20 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("localized valid").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: LocalizedSnapshotRegion(
                                start: this.getUIContext().vp2px(5.0).getOrThrow().value,
                                end: this.getUIContext().vp2px(115.0).getOrThrow().value,
                                top: this.getUIContext().vp2px(5.0).getOrThrow().value,
                                bottom: this.getUIContext().vp2px(25.0).getOrThrow().value)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_21: LocalizedSnapshotRegion 全边界坐标（TestComponentSnapshot_get_021）
 */
@Component
public class View_ComponentSnapshot_get_21 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("localized boundary").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: LocalizedSnapshotRegion(
                                start: this.getUIContext().vp2px(0.0).getOrThrow().value,
                                end: this.getUIContext().vp2px(120.0).getOrThrow().value,
                                top: this.getUIContext().vp2px(0.0).getOrThrow().value,
                                bottom: this.getUIContext().vp2px(30.0).getOrThrow().value)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_22: LocalizedSnapshotRegion 越界区域（TestComponentSnapshot_get_022）
 */
@Component
public class View_ComponentSnapshot_get_22 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("localized out of bounds").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: LocalizedSnapshotRegion(
                                start: -5.0,
                                end: this.getUIContext().vp2px(300.0).getOrThrow().value,
                                top: -5.0,
                                bottom: this.getUIContext().vp2px(300.0).getOrThrow().value)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_23: region Option.None 默认截全组件（TestComponentSnapshot_get_023）
 */
@Component
public class View_ComponentSnapshot_get_23 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("region None").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            region: Option<SnapshotRegionType>.None
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_24: colorMode 手动 Srgb（TestComponentSnapshot_get_024）
 */
@Component
public class View_ComponentSnapshot_get_24 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("colorMode Srgb").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            colorMode: ColorModeOptions(colorSpace: ColorSpace.Srgb, isAuto: false)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_25: colorMode 手动 DisplayP3（TestComponentSnapshot_get_025）
 */
@Component
public class View_ComponentSnapshot_get_25 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("colorMode DisplayP3").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            colorMode: ColorModeOptions(colorSpace: ColorSpace.DisplayP3, isAuto: false)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_26: colorMode 手动 Unknown（TestComponentSnapshot_get_026）
 */
@Component
public class View_ComponentSnapshot_get_26 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("colorMode Unknown").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            colorMode: ColorModeOptions(colorSpace: ColorSpace.Unknown, isAuto: false)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_27: colorMode isAuto=true（TestComponentSnapshot_get_027）
 */
@Component
public class View_ComponentSnapshot_get_27 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("colorMode auto").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            colorMode: ColorModeOptions(isAuto: true)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_28: colorMode 两参数均不传默认构造（TestComponentSnapshot_get_028）
 */
@Component
public class View_ComponentSnapshot_get_28 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("colorMode default").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            colorMode: ColorModeOptions()
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_29: colorMode Option.None 默认值（TestComponentSnapshot_get_029）
 */
@Component
public class View_ComponentSnapshot_get_29 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("colorMode None").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            colorMode: Option<ColorModeOptions>.None
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_30: dynamicRangeMode 手动 Standard（TestComponentSnapshot_get_030）
 */
@Component
public class View_ComponentSnapshot_get_30 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("drm Standard").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            dynamicRangeMode: DynamicRangeModeOptions(
                                dynamicRangeMode: DynamicRangeMode.Standard, isAuto: false
                            )
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_31: dynamicRangeMode 手动 High（TestComponentSnapshot_get_031）
 */
@Component
public class View_ComponentSnapshot_get_31 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("drm High").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            dynamicRangeMode: DynamicRangeModeOptions(
                                dynamicRangeMode: DynamicRangeMode.High, isAuto: false
                            )
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_32: dynamicRangeMode 手动 Constraint（TestComponentSnapshot_get_032）
 */
@Component
public class View_ComponentSnapshot_get_32 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("drm Constraint").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            dynamicRangeMode: DynamicRangeModeOptions(
                                dynamicRangeMode: DynamicRangeMode.Constraint, isAuto: false
                            )
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_33: dynamicRangeMode isAuto=true（TestComponentSnapshot_get_033）
 */
@Component
public class View_ComponentSnapshot_get_33 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("drm auto").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            dynamicRangeMode: DynamicRangeModeOptions(isAuto: true)
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_34: dynamicRangeMode 两参数均不传默认构造（TestComponentSnapshot_get_034）
 */
@Component
public class View_ComponentSnapshot_get_34 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("drm default").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            dynamicRangeMode: DynamicRangeModeOptions()
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_35: dynamicRangeMode Option.None 默认值（TestComponentSnapshot_get_035）
 */
@Component
public class View_ComponentSnapshot_get_35 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("drm None").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            dynamicRangeMode: Option<DynamicRangeModeOptions>.None
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_36: 全参数综合区域截图（TestComponentSnapshot_get_036）
 */
@Component
public class View_ComponentSnapshot_get_36 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("full params").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            scale: 1.0,
                            waitUntilRenderFinished: true,
                            region: SnapshotRegion(left: this.getUIContext().vp2px(10.0).getOrThrow().value,
                                                right:this.getUIContext().vp2px(110.0).getOrThrow().value,
                                                top: this.getUIContext().vp2px(10.0).getOrThrow().value,
                                                bottom: this.getUIContext().vp2px(20.0).getOrThrow().value),
                            colorMode: ColorModeOptions(colorSpace: ColorSpace.Srgb, isAuto: false),
                            dynamicRangeMode: DynamicRangeModeOptions(
                                dynamicRangeMode: DynamicRangeMode.High, isAuto: false
                            )
                        )
                    )
            })
        }.width(100.percent)
    }
}

/**
 * View_ComponentSnapshot_get_37: colorMode isAuto=true 时无效 colorSpace 被忽略（TestComponentSnapshot_get_037）
 */
@Component
public class View_ComponentSnapshot_get_37 {
    @State var pixelMap: ?PixelMap = Option<PixelMap>.None

    func build() {
        Column(space: 10) {
            Row() {
                Column {
                    if (pixelMap.isSome()) {
                        Image(this.pixelMap).fitOriginalSize(true).margin(5).id("Image_id")
                    } else {
                        Image(Option<ResourceStr>.None).width(130.vp).height(130.vp).backgroundColor(Color.Gray).margin(5).id("Image_id")
                    }
                }.width(150.vp).height(150.vp).border(color: Color.Black, width: 2.vp).justifyContent(FlexAlign.Center)

                Text("snapshot target")
                  .backgroundColor(Color.Green)
                  .width(120.vp)
                  .height(30.vp)
                  .margin(5)
                  .id('Snapshot_target_id')
            }
            Button("colorMode auto override").onClick({
                e =>
                    resetSnapState()
                    this.getUIContext().getComponentSnapshot().get(
                        "Snapshot_target_id",
                        { err: Option<BusinessException>, pixelMap: Option<PixelMap> =>
                            setSnapResultState(err, pixelMap)
                            if (err.isNone() && pixelMap.isSome()) {
                                this.pixelMap = pixelMap.getOrThrow()
                            }
                        },
                        options: SnapshotOptions(
                            colorMode: ColorModeOptions(colorSpace: ColorSpace.Unknown, isAuto: true)
                        )
                    )
            })
        }.width(100.percent)
    }
}