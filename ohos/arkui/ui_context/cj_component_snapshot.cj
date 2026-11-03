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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.ui_context

import std.collection.HashMap
import ohos.base.{NativeOptionInt32, NativeOptionInt64}
import ohos.labels.APILevel
import ohos.arkui.component.common.{DynamicRangeMode}
import ohos.arkui.component.util.{greatNotEqual}
import ohos.graphics.color_space_manager.ColorSpace
import ohos.multimedia.image.PixelMap
import ohos.ffi.{Callback2Param}
import ohos.business_exception.{BusinessException, AsyncCallback}

@C
protected struct NativeSnapshotOptions {
    protected NativeSnapshotOptions(
        let scale: Float32,
        let waitUntilRenderFinished: Bool,
        let region: NativeSnapshotRegion,
        let colorMode: NativeColorModeOptions,
        let dynamicRangeMode: NativeDynamicRangeModeOptions
    ) {}
}

// Region modes, aligned with NG::SnapshotRegionMode (COMMON = 0, LOCALIZED = 1, NO_REGION = 2).
protected const COMMON_REGION_MODE: Int32 = 0
protected const LOCALIZED_REGION_MODE: Int32 = 1
protected const NO_REGION_MODE: Int32 = 2

@C
protected struct NativeSnapshotRegion {
    protected NativeSnapshotRegion(
        let regionMode: Int32,
        let regionStart: Float64,
        let regionEnd: Float64,
        let regionTop: Float64,
        let regionBottom: Float64
    ) {}
}

@C
protected struct NativeColorModeOptions {
    protected NativeColorModeOptions(
        let colorSpace: UInt32,
        let isAuto: Bool
    ) {}
}

@C
protected struct NativeDynamicRangeModeOptions {
    protected NativeDynamicRangeModeOptions(
        let dynamicRangeMode: UInt32,
        let isAuto: Bool
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkComponentSnapshotGetV2(instanceId: Int32, id: CString, callback: Int64, options: NativeSnapshotOptions): Unit
}

// Error code to message mapping for ComponentSnapshot#get, aligned with the @throws
// descriptions of get in the ArkTS interface declarations (.d.ts). Note that 100001
// has different semantics per API in this module (e.g. createFromBuilder uses
// "The builder is not a valid build function."), so each API should keep its own
// map instead of extending this one.
let GET_ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (100001, "Invalid ID."),
        (160003, "Unsupported color space or dynamic range mode in snapshot options.")
    ]
)

func getErrorMessage(errCode: Int32): String {
    if (let Some(msg) <- GET_ERROR_CODE_MAP.get(errCode)) {
        return msg
    }
    return ""
}

/**
 * Defines the rectangular region for capturing the component snapshot.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SnapshotRegion {
    /**
     * X-coordinate of the upper left corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component width].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var left: Float64

    /**
     * X-coordinate of the lower right corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component width].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var right: Float64

    /**
     * Y-coordinate of the upper left corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component height].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Float64

    /**
     * Y-coordinate of the lower right corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component height].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Float64

    /**
     * SnapshotRegion constructor.
     *
     * @param { Float64 } left - Left boundary. Unit: px.
     * @param { Float64 } right - Right boundary. Unit: px.
     * @param { Float64 } top - Top boundary. Unit: px.
     * @param { Float64 } bottom - Bottom boundary. Unit: px.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(left!: Float64, right!: Float64, top!: Float64, bottom!: Float64) {
        this.left = left
        this.right = right
        this.top = top
        this.bottom = bottom
    }

    protected func toNative(): NativeSnapshotRegion {
        return NativeSnapshotRegion(COMMON_REGION_MODE, this.left, this.right, this.top, this.bottom)
    }
}

/**
 * Defines the rectangular region for capturing the component snapshot, with coordinates adjusted based on the layout
 * direction (LTR or RTL).
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedSnapshotRegion {
    /**
     * For LTR layouts: X-coordinate of the upper left corner of the rectangular region.
     *
     * For RTL layouts: X-coordinate of the upper right corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component width].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: Float64

    /**
     * For LTR layouts: X-coordinate of the lower right corner of the rectangular region.
     *
     * For RTL layouts: X-coordinate of the lower left corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component width].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: Float64

    /**
     * For LTR layouts: Y-coordinate of the upper left corner of the rectangular region.
     *
     * For RTL layouts: Y-coordinate of the upper right corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component height].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var top: Float64

    /**
     * Y-coordinate of the lower right corner of the rectangular region.
     *
     * Unit: px.
     *
     * Value range: [0, Component height].
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var bottom: Float64

    /**
     * LocalizedSnapshotRegion constructor.
     *
     * @param { Float64 } start - Start boundary. Unit: px.
     * @param { Float64 } end - End boundary. Unit: px.
     * @param { Float64 } top - Top boundary. Unit: px.
     * @param { Float64 } bottom - Bottom boundary. Unit: px.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(start!: Float64, end!: Float64, top!: Float64, bottom!: Float64) {
        this.start = start
        this.end = end
        this.top = top
        this.bottom = bottom
    }

    protected func toNative(): NativeSnapshotRegion {
        return NativeSnapshotRegion(LOCALIZED_REGION_MODE, this.start, this.end, this.top, this.bottom)
    }
}

/**
 * Defines the type of the snapshot region.
 * SnapshotRegionType is a union type of SnapshotRegion and LocalizedSnapshotRegion.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public interface SnapshotRegionType {}

extend SnapshotRegion <: SnapshotRegionType {}

extend LocalizedSnapshotRegion <: SnapshotRegionType {}

/**
 * Defines the color space used for the snapshot.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ColorModeOptions {
    /**
     * Color space used for the snapshot.
     *
     * If the target component's color space is known, specify it through colorSpace and set isAuto to false
     * to achieve optimal snapshot quality.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colorSpace: ?ColorSpace

    /**
     * Whether the system automatically determines the color space to be used.
     *
     * The value true means to allow the system to automatically determine the color space to be used, and false
     * means to manually set the color space through colorSpace. If an invalid value is used, the default value
     * false is used.
     *
     * Default value: false
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isAuto: ?Bool

    /**
     * ColorModeOptions constructor.
     *
     * @param { ?ColorSpace } [colorSpace] - The color space.
     * @param { ?Bool } [isAuto] - Whether to use auto color mode.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        colorSpace!: ?ColorSpace = None,
        isAuto!: ?Bool = None
    ) {
        this.colorSpace = colorSpace
        this.isAuto = isAuto
    }

    protected func toNative(): NativeColorModeOptions {
        return NativeColorModeOptions(
            (this.colorSpace ?? ColorSpace.Srgb).getValue(),
            this.isAuto ?? false)
    }
}

/**
 * Defines the dynamic range mode used for the snapshot.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DynamicRangeModeOptions {
    /**
     * Dynamic range mode used for the snapshot.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dynamicRangeMode: ?DynamicRangeMode

    /**
     * Whether the system automatically determines the dynamic range mode to be used.
     *
     * The value true means to allow the system to automatically determine the dynamic range mode to be used, and
     * false means to manually set the dynamic range mode through dynamicRangeMode. If an invalid value is used,
     * the default value false is used.
     *
     * Default value: false
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var isAuto: ?Bool

    /**
     * DynamicRangeModeOptions constructor.
     *
     * @param { ?DynamicRangeMode } [dynamicRangeMode] - The dynamic range mode.
     * @param { ?Bool } [isAuto] - Whether to use auto dynamic range mode.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        dynamicRangeMode!: ?DynamicRangeMode = None,
        isAuto!: ?Bool = None
    ) {
        this.dynamicRangeMode = dynamicRangeMode
        this.isAuto = isAuto
    }

    protected func toNative(): NativeDynamicRangeModeOptions {
        return NativeDynamicRangeModeOptions(
            UInt32((this.dynamicRangeMode ?? DynamicRangeMode.Standard).getValue()),
            this.isAuto ?? false)
    }
}

/**
 * Defines the extra options for snapshot taking.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SnapshotOptions {
    /**
     * Scale ratio for rendering pixel maps during a snapshot. Note that a high scale ratio may increase the time taken
     * for the snapshot or even result in a snapshot failure.
     *
     * Value range: [0, +∞). If the value is less than or equal to 0, the default value is used.
     *
     * Default value: 1
     *
     * Avoid capturing images that are excessively large, ideally not larger than the screen size. If the size of the
     * image to capture exceeds device-specific underlying limits, the capture will fail.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var scale: ?Float64

    /**
     * Whether to force the system to wait for all rendering commands to complete before taking the snapshot. The value
     * true means to force the system to wait for all rendering commands to complete before taking the snapshot, and
     * false means the opposite. This option ensures the snapshot reflects the most up-to-date content and should be
     * enabled whenever possible. Note that enabling this option may increase the time required for the snapshot to
     * complete, which depends on the size of the area that needs to be redrawn at the time.
     *
     * Default value: false
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var waitUntilRenderFinished: ?Bool

    /**
     * Rectangular region for the snapshot. The default region is the entire component.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var region: ?SnapshotRegionType

    /**
     * Color space used for the snapshot.
     *
     * Default value: ColorModeOptions(colorSpace: ColorSpace.Srgb, isAuto: false)
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var colorMode: ?ColorModeOptions

    /**
     * Dynamic range mode used for the snapshot.
     *
     * Default value: DynamicRangeModeOptions(dynamicRangeMode: DynamicRangeMode.Standard, isAuto: false)
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var dynamicRangeMode: ?DynamicRangeModeOptions

    /**
     * SnapshotOptions constructor.
     *
     * @param { ?Float64 } scale - The scale of the snapshot.
     * @param { ?Bool } waitUntilRenderFinished - Whether to wait until render finished.
     * @param { ?SnapshotRegionType } [region] - The region to snapshot.
     * @param { ?ColorModeOptions } [colorMode] - The color mode options.
     * @param { ?DynamicRangeModeOptions } [dynamicRangeMode] - The dynamic range mode options.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        scale!: ?Float64 = None,
        waitUntilRenderFinished!: ?Bool = None,
        region!: ?SnapshotRegionType = None,
        colorMode!: ?ColorModeOptions = None,
        dynamicRangeMode!: ?DynamicRangeModeOptions = None
    ) {
        this.scale = scale
        this.waitUntilRenderFinished = waitUntilRenderFinished
        this.region = region
        this.colorMode = colorMode
        this.dynamicRangeMode = dynamicRangeMode
    }

    protected func toNative(): NativeSnapshotOptions {
        var scaleValue = 1.0
        if (let Some(scale_) <- this.scale) {
            if (greatNotEqual(scale_, 0.0)) {
                scaleValue = scale_
            }
        }

        var nativeRegion = NativeSnapshotRegion(NO_REGION_MODE, 0.0, 0.0, 0.0, 0.0)
        if (let Some(region_) <- this.region) {
            match (region_) {
                case r: SnapshotRegion => nativeRegion = r.toNative()
                case r: LocalizedSnapshotRegion => nativeRegion = r.toNative()
                case _ => ()
            }
        }

        var nativeColorModeOptions = NativeColorModeOptions(ColorSpace.Srgb.getValue(), false)
        if (let Some(colorMode_) <- this.colorMode) {
            nativeColorModeOptions = colorMode_.toNative()
        }

        var nativeDynamicRangeMode = NativeDynamicRangeModeOptions(UInt32(DynamicRangeMode.Standard.getValue()), false)
        if (let Some(drMode_) <- this.dynamicRangeMode) {
            nativeDynamicRangeMode = drMode_.toNative()
        }

        return NativeSnapshotOptions(
            Float32(scaleValue),
            this.waitUntilRenderFinished ?? false,
            nativeRegion,
            nativeColorModeOptions,
            nativeDynamicRangeMode
        )
    }
}

/**
 * Defines the ComponentSnapshot class for taking snapshots of components.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ComponentSnapshot {
    private var instanceId: Int64
    protected init(instanceId: Int64) {
        this.instanceId = instanceId
    }
    
    /**
     * Obtains the snapshot of a component that has been loaded based on the provided component ID. This
     * API uses an asynchronous callback to return the result.
     *
     * @param { String } id - The ID of the target component.
     * @param { AsyncCallback<PixelMap> } callback - Callback used to return the result.
     * @param { SnapshotOptions } [options] - Custom settings of the snapshot.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1. Mandatory parameters are left unspecified.
     *     2. Incorrect parameters types.
     *     3. Parameter verification failed.
     * @throws { BusinessException } 100001 - Invalid ID.
     * @throws { BusinessException } 160003 - Unsupported color space or dynamic range mode in snapshot options.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full",
        throwexception: true
    ]
    public func get(id: String, callback: AsyncCallback<PixelMap>, options!: ?SnapshotOptions = Option.None): Unit {
        let wrapper = { errCode: NativeOptionInt32, pixelMapId: NativeOptionInt64 =>
            let arg0: Option<BusinessException> = if (errCode.hasValue) {
                Some(BusinessException(errCode.value, getErrorMessage(errCode.value)))
            } else {
                None
            }
            let arg1: Option<PixelMap> = if (pixelMapId.hasValue) {
                Some(PixelMap(pixelMapId.value))
            } else {
                None
            }
            callback(arg0, arg1)
        }
        let lambdaData = Callback2Param<NativeOptionInt32, NativeOptionInt64, Unit>(wrapper)
        unsafe {
            try (idC = LibC.mallocCString(id).asResource()) {
                FfiOHOSAceFrameworkComponentSnapshotGetV2(
                    Int32(this.instanceId),
                    idC.value,
                    lambdaData.getID(),
                    (options ?? SnapshotOptions()).toNative()
                )
            }
        }
    }
}
