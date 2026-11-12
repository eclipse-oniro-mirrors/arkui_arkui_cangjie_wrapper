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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.relative_container

import ohos.arkui.component.common.{CommonMethodComponent, BarrierDirection, Axis}
import ohos.arkui.component.util.{transAppResourceToLength}
import ohos.base.{Length}
import ohos.ffi.{CArrString}
import ohos.labels.{APILevel}
import std.deriving.Derive
import ohos.business_exception.BusinessException

@C
struct CLength {
    CLength(
        let value: Float64,
        let unit: Int32
    ) {}
}

@C
struct CGuideLinePosition {
    CGuideLinePosition(
        let start: CLength,
        let end: CLength
    ) {}

    init(position: GuideLinePosition) {
        this.start = match (position.start) {
            case Some(v) =>
                let v_ = transAppResourceToLength(v)
                CLength(v_.value, v_.unitType.getValue())
            case None => CLength(Float64(0), -1)
        }

        this.end = match (position.end) {
            case Some(v) =>
                let v_ = transAppResourceToLength(v)
                CLength(v_.value, v_.unitType.getValue())
            case None => CLength(Float64(0), -1)
        }
    }
}

@C
struct CGuideLineStyle {
    CGuideLineStyle(
        let id: CString,
        let direction: Int32,
        let position: CGuideLinePosition
    ) {}

    init(guideline: GuideLineStyle) {
        this.id = unsafe { LibC.mallocCString(guideline.id ?? "") }
        this.direction = (guideline.direction ?? Axis.Vertical).getValue()
        this.position = CGuideLinePosition(guideline.position ?? GuideLinePosition(start: 0))
    }

    func free(): Unit {
        unsafe { LibC.free(id) }
    }
}

@C
struct CGuideLineInfos {
    CGuideLineInfos(
        let size: Int64,
        let guideline: CPointer<CGuideLineStyle>
    ) {}

    init(infos: Array<GuideLineStyle>) {
        this.size = infos.size
        this.guideline = if (size > 0) {
            let ptr = unsafe { LibC.malloc<CGuideLineStyle>(count: size) }
            if (ptr.isNull()) {
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            for (i in 0..size) {
                unsafe { ptr.write(i, CGuideLineStyle(infos[i])) }
            }
            ptr
        } else {
            CPointer<CGuideLineStyle>()
        }
    }

    func free(): Unit {
        if (!guideline.isNull()) {
            for (i in 0..size) {
                unsafe { guideline.read(i).free() }
            }
            unsafe { LibC.free<CGuideLineStyle>(guideline) }
        }
    }
}

@C
struct CBarrierStyle {
    var id: CString = CString(CPointer<UInt8>())
    var direction: Int32 = -1
    var referencedId: CArrString = CArrString(CPointer<CString>(), 0)

    CBarrierStyle(
        id: CString,
        direction: Int32,
        referencedId: CArrString
    ) {
        this.id = id
        this.direction = direction
        this.referencedId = referencedId
    }

    init(barrier: BarrierStyle) {
        try {
            this.id = unsafe { LibC.mallocCString(barrier.id ?? "") }
            this.direction = (barrier.direction ?? BarrierDirection.Left).getValue()
            let tmpReferencedId = barrier.referencedId ?? []
            let size = tmpReferencedId.size
            this.referencedId = if (size == 0) {
                CArrString(CPointer<CString>(), 0)
            } else {
                let ptr = unsafe { LibC.malloc<CString>(count: size) }
                if (ptr.isNull()) {
                    throw BusinessException(100001, "Internal error: failed to allocate memory.")
                }
                for (i in 0..size) {
                    unsafe { ptr.write(i, LibC.mallocCString(tmpReferencedId[i])) }
                }
                CArrString(ptr, size)
            }
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        unsafe { LibC.free(id) }
        referencedId.free()
    }
}

@C
struct CBarrierInfos {
    CBarrierInfos(
        let size: Int64,
        let barrier: CPointer<CBarrierStyle>
    ) {}

    init(barrierInfos: Array<BarrierStyle>) {
        this.size = barrierInfos.size
        this.barrier = if (size > 0) {
            let ptr = unsafe { LibC.malloc<CBarrierStyle>(count: size) }
            if (ptr.isNull()) {
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            for (i in 0..size) {
                unsafe { ptr.write(i, CBarrierStyle(barrierInfos[i])) }
            }
            ptr
        } else {
            CPointer<CBarrierStyle>()
        }
    }

    func free(): Unit {
        if (!barrier.isNull()) {
            for (i in 0..size) {
                unsafe { barrier.read(i).free() }
            }
            unsafe { LibC.free<CBarrierStyle>(barrier) }
        }
    }
}

/**
 * Native localized barrier style struct.
 * Field layout must stay in sync with the C++ side (cj_frontend_ohos).
 */
@C
protected struct CLocalizedBarrierStyle {
    var id: CString = CString(CPointer<UInt8>())
    var localizedDirection: Int32 = -1
    var referencedId: CArrString = CArrString(CPointer<CString>(), 0)

    CLocalizedBarrierStyle(
        id: CString,
        localizedDirection: Int32,
        referencedId: CArrString
    ) {
        this.id = id
        this.localizedDirection = localizedDirection
        this.referencedId = referencedId
    }

    init(barrier: LocalizedBarrierStyle) {
        try {
            this.id = unsafe { LibC.mallocCString(barrier.id) }
            this.localizedDirection = barrier.localizedDirection.getValue()
            let size = barrier.referencedId.size
            if (size != 0) {
                let ptr = unsafe { LibC.malloc<CString>(count: size) }
                if (ptr.isNull()) {
                    throw BusinessException(100001, "Internal error: failed to allocate memory.")
                }
                for (i in 0..size) {
                    unsafe { ptr.write(i, LibC.mallocCString(barrier.referencedId[i])) }
                }
                this.referencedId = CArrString(ptr, size)
            }
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free(): Unit {
        unsafe { LibC.free(id) }
        referencedId.free()
    }
}

/**
 * Native localized barrier infos array struct.
 * Field layout must stay in sync with the C++ side (cj_frontend_ohos).
 */
@C
protected struct CLocalizedBarrierInfos {
    var size: Int64 = 0
    var barrier: CPointer<CLocalizedBarrierStyle> = CPointer<CLocalizedBarrierStyle>()

    init(barrierInfos: Array<LocalizedBarrierStyle>) {
        this.size = barrierInfos.size
        this.barrier = if (size > 0) {
            let ptr = unsafe { LibC.malloc<CLocalizedBarrierStyle>(count: size) }
            if (ptr.isNull()) {
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            for (i in 0..size) {
                unsafe { ptr.write(i, CLocalizedBarrierStyle(barrierInfos[i])) }
            }
            ptr
        } else {
            CPointer<CLocalizedBarrierStyle>()
        }
    }

    func free(): Unit {
        if (!barrier.isNull()) {
            for (i in 0..size) {
                unsafe { barrier.read(i).free() }
            }
            unsafe { LibC.free<CLocalizedBarrierStyle>(barrier) }
        }
    }
}


foreign {
    func FfiOHOSAceFrameworkRelativeContainerCreate(): Unit

    func FfiOHOSAceFrameworkReletiveContainerGuideLine(guidelineInfos: CGuideLineInfos): Unit

    func FfiOHOSAceFrameworkReletiveContainerBarrier(barrierInfos: CBarrierInfos): Unit

    func FfiOHOSAceFrameworkReletiveContainerLocalizedBarrier(barrierInfos: CLocalizedBarrierInfos): Unit
}

/**
 * Enumerates the directions of barriers with mirror mode support.
 */
@Derive[Equatable]
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum LocalizedBarrierDirection {
    /**
     * The barrier is on the left (for left-to-right scripts) or right (for right-to-left scripts) side of all the
     *     referenced components.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Start
    |
    /**
     * The barrier is on the right (for left-to-right scripts) or left (for right-to-left scripts) side of all the
     *     referenced components.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    End
    |
    /**
     * The barrier is at the top of all the referenced components.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Top
    |
    /**
     * The barrier is at the bottom of all the referenced components.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Bottom
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case Start => 0
            case End => 1
            case Top => 2
            case Bottom => 3
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

/**
 * Specifies the BarrierStyle of relative container
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class BarrierStyle {
    /**
    * Specifies the id of barrier
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: ?String

    /**
    * Specifies the direction of barrier
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: ?BarrierDirection

    /**
    * Specifies the referencedId of barrier
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var referencedId: ?Array<String>

    /**
    * Defines the constructor of BarrierStyle.
    *
    * @param { ?String } id
    * @param { ?BarrierDirection } direction
    * @param { ?Array<String> } referencedId
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id: ?String, direction: ?BarrierDirection, referencedId: ?Array<String>) {
        this.id = id ?? ""
        this.direction = direction ?? BarrierDirection.Left
        this.referencedId = referencedId ?? []
    }
}

/**
 * Defines the ID, direction, and referenced components of a barrier.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class LocalizedBarrierStyle {
    /**
     * ID of the barrier, which must be unique and cannot be the same as the name of any component in the container.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: String

    /**
     * Direction of the barrier. Vertical-direction barriers (including Top and Bottom) can only serve as the horizontal
     *     anchor of a component. If they are used as a vertical anchor, the anchor value will be 0.
     *     Horizontal-direction barriers (including Start and End) can only serve as the vertical anchor of a component.
     *     If they are used as a horizontal anchor, the anchor value will be 0.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var localizedDirection: LocalizedBarrierDirection

    /**
     * Referenced components of the barrier.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var referencedId: Array<String>

    /**
     * LocalizedBarrierStyle constructor.
     *
     * @param { String } id - ID of the barrier, which must be unique and cannot be the same as the name of any
     *     component in the container.
     * @param { LocalizedBarrierDirection } localizedDirection - Direction of the barrier. Vertical-direction barriers
     *     (including Top and Bottom) can only serve as the horizontal anchor of a component. If they are used as a
     *     vertical anchor, the anchor value will be 0. Horizontal-direction barriers (including Start and End) can only
     *     serve as the vertical anchor of a component. If they are used as a horizontal anchor, the anchor value will
     *     be 0.
     * @param { Array<String> } referencedId - Referenced components of the barrier.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        id: String,
        localizedDirection: LocalizedBarrierDirection,
        referencedId: Array<String>
    ) {
        this.id = id
        this.localizedDirection = localizedDirection
        this.referencedId = referencedId
    }
}

/**
 * Specifies the position of guideLine
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLinePosition {
    /**
    * Specifies the distance to start of container
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var start: ?Length

    /**
    * Specifies the distance to end of container
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var end: ?Length

    /**
    * Defines the constructor of GuideLinePosition.
    *
    * @param { ?Length } start
    * @param { ?Length } end
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(start!: ?Length = None, end!: ?Length = None) {
        this.start = start
        this.end = end
    }
}

/**
 * Specifies the GuideLineStyle of relative container
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class GuideLineStyle {
    /**
    * Specifies the id of guideLine
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: ?String

    /**
    * Specifies the direction of guideLine
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var direction: ?Axis

    /**
    * Specifies the position of guideLine
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var position: ?GuideLinePosition

    /**
    * Defines the constructor of GuideLineStyle.
    *
    * @param { ?String } id
    * @param { ?Axis } direction
    * @param { ?GuideLinePosition } position
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(id: ?String, direction: ?Axis, position: ?GuideLinePosition) {
        this.id = id ?? ""
        this.direction = direction ?? Axis.Vertical
        this.position = position ?? GuideLinePosition(start: 0)
    }
}

/**
 * Defines RelativeContainer Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RelativeContainer <: CommonMethodComponent<RelativeContainer> & RelativeContainerAttribute {
    /**
    * Constructor of relativeContainer
    *
    * @param { () -> Unit } child
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(child!: () -> Unit = {=>}) {
        unsafe { FfiOHOSAceFrameworkRelativeContainerCreate() }
        this.child = child
    }

    /**
     * Specifies guideLines of relativeContainer
     *
     * @param { ?Array<GuideLineStyle> } value - Array of guide line styles.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func guideLine(value: ?Array<GuideLineStyle>): This {
        let cGuideLine = CGuideLineInfos(value ?? [])
        unsafe { FfiOHOSAceFrameworkReletiveContainerGuideLine(cGuideLine) }
        cGuideLine.free()
        this
    }

    /**
     * Specifies barriers of relativeContainer
     *
     * @param { ?Array<BarrierStyle> } value - Array of barrier styles.
     * @returns { This }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barrier(value: ?Array<BarrierStyle>): This {
        let cBarrier = CBarrierInfos(value ?? [])
        unsafe { FfiOHOSAceFrameworkReletiveContainerBarrier(cBarrier) }
        cBarrier.free()
        this
    }

    /**
     * Sets barriers in the RelativeContainer component. Each array element defines a barrier.
     * Barriers can be defined in mirrored layout mode.
     *
     * @param { Array<LocalizedBarrierStyle> } value - Barriers in the RelativeContainer component.
     * @returns { This } The instance of the component.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barrier(value: Array<LocalizedBarrierStyle>): This {
        let cBarrier = CLocalizedBarrierInfos(value)
        unsafe { FfiOHOSAceFrameworkReletiveContainerLocalizedBarrier(cBarrier) }
        cBarrier.free()
        this
    }
}
