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

package ohos.arkui.component.common

import ohos.arkui.component.native_struct.{CJGestureEventV2}
import ohos.business_exception.BusinessException
import ohos.ffi.{RemoteDataLite, releaseFFIData, Callback0Param}
import ohos.labels.{APILevel}
import std.collection.ArrayList

foreign {
    func FfiOHOSAceFrameworkGestureCreate(priority: Int32, mask: Int32): Unit

    func FfiOHOSAceFrameworkGestureSetTag(tag: CString): Unit

    func FfiOHOSAceFrameworkGestureOnActionV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionStartV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionUpdateV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionEndV2(callback: Int64): Unit

    func FfiOHOSAceFrameworkGestureOnActionCancel(callback: Int64): Unit

    func FfiOHOSAceFrameworkGesturePop(): Unit

    func FfiOHOSAceFrameworkGestureFinish(): Unit

    func FfiOHOSAceFrameworkTapGestureCreate(count: Int32, fingers: Int32): Unit

    func FfiOHOSAceFrameworkLongPressGestureCreate(fingers: Int32, repeat: Bool, duration: Int32): Unit

    func FfiOHOSAceFrameworkPinchGestureCreate(fingers: Int32, distance: Float64): Unit

    func FfiOHOSAceFrameworkSwipeGestureCreate(fingers: Int32, direction: UInt32, speed: Float64): Unit

    func FfiOHOSAceFrameworkRotationGestureCreate(fingers: Int32, angle: Float64): Unit

    func FfiOHOSAceFrameworkPanGestureCreate(fingers: Int32, direction: UInt32, distance: Float64): Unit

    func FfiOHOSAceFrameworkPanGestureCreateWithOptions(panGestureOptions: Int64): Unit

    func FfiOHOSAceFrameworkGestureGroupCreate(mode: Int32): Unit

    func FfiOHOSAceFrameworkPanGestureOptionsCtor(fingers: Int32, direction: UInt32, distance: Float64): Int64

    func FfiOHOSAceFrameworkPanGestureOptionsSetDirection(selfID: Int64, direction: UInt32): Unit

    func FfiOHOSAceFrameworkPanGestureOptionsSetDistance(selfID: Int64, distance: Float64): Unit

    func FfiOHOSAceFrameworkPanGestureOptionsSetFingers(selfID: Int64, fingers: Int32): Unit
}

func parseInteractionHand(operatingHand: Int32): ?InteractionHand {
    match (operatingHand) {
        case 1 => InteractionHand.Left
        case 2 => InteractionHand.Right
        case _ => Option<InteractionHand>.None
    }
}

func parseCJGestureEventV2(cjEvent: CJGestureEventV2): GestureEvent {
    let fingerList: ArrayList<FingerInfo> = ArrayList<FingerInfo>()
    // fingerInfos: effective touch fingers (sourceType == TouchScreen && sourceTool == Finger) first,
    // others after, both keeping the original order. When the parallel fingerExtraList is absent
    // (legacy native), it degrades to the fingerList order.
    let touchFingers: ArrayList<FingerInfo> = ArrayList<FingerInfo>()
    let otherFingers: ArrayList<FingerInfo> = ArrayList<FingerInfo>()
    let hasExtra = !cjEvent.fingerExtraList.isNull()
    if (!cjEvent.fingerList.isNull()) {
        for (i in 0..cjEvent.fingerListSize) {
            let cjFinger = unsafe { cjEvent.fingerList.read(Int64(i)) }
            var finger = FingerInfo(cjFinger.id, cjFinger.globalX, cjFinger.globalY, cjFinger.localX, cjFinger.localY,
                0.0, 0.0, hand: Option<InteractionHand>.None,
                globalDisplayX: Option<Float64>.None, globalDisplayY: Option<Float64>.None)
            var isTouchFinger = true
            if (hasExtra) {
                let extra = unsafe { cjEvent.fingerExtraList.read(Int64(i)) }
                finger = FingerInfo(cjFinger.id, cjFinger.globalX, cjFinger.globalY, cjFinger.localX,
                    cjFinger.localY, extra.displayX, extra.displayY, hand: parseInteractionHand(extra.operatingHand),
                    globalDisplayX: extra.globalDisplayX, globalDisplayY: extra.globalDisplayY)
                isTouchFinger = SourceType.parseValue(extra.sourceType) == SourceType.TouchScreen &&
                    SourceTool.parseValue(extra.sourceTool) == SourceTool.Finger
            }
            fingerList.add(finger)
            if (isTouchFinger) {
                touchFingers.add(finger)
            } else {
                otherFingers.add(finger)
            }
        }
    }
    let fingerInfos: ArrayList<FingerInfo> = ArrayList<FingerInfo>()
    for (i in 0..touchFingers.size) {
        fingerInfos.add(touchFingers[i])
    }
    for (i in 0..otherFingers.size) {
        fingerInfos.add(otherFingers[i])
    }
    let target = if (cjEvent.target.isNull()) {
        EventTarget(Area(0, 0, Position(), Position()))
    } else {
        parseCJTarget(unsafe { cjEvent.target.read() })
    }
    GestureEvent(target, cjEvent.timestamp, SourceType.parseValue(cjEvent.source), cjEvent.offsetX, cjEvent.offsetY,
        cjEvent.repeat, fingerList.toArray(), cjEvent.angle, cjEvent.speed, cjEvent.scale, cjEvent.pinchCenterX,
        cjEvent.pinchCenterY, cjEvent.velocityX, cjEvent.velocityY, cjEvent.velocity,
        fingerInfos: fingerInfos.toArray()
    )
}

func getOrDefault(value: Float64, min: Float64, max: Float64, default: Float64): Float64 {
    if (value < min || value > max) {
        return default
    }
    return value
}

func getOrDefault(value: Int32, min: Int32, max: Int32, default: Int32): Int32 {
    if (value < min || value > max) {
        return default
    }
    return value
}

enum GesturePriorityInner {
    Low
    | High
    | Parallel
    | ...

    func getValue(): Int32 {
        match (this) {
            case Low => 0
            case High => 1
            case Parallel => 2
            case _ => throw BusinessException(100001, "Internal error.")
        }
    }
}

class GestureInner {
    static func create(priority: GesturePriorityInner, mask: GestureMask): Unit {
        unsafe {
            FfiOHOSAceFrameworkGestureCreate(priority.getValue(), mask.getValue())
        }
    }

    static func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkGestureFinish()
        }
    }
}

/**
 * Defines the gesture type.
 * It is the base class of all gesture types, and all concrete gestures inherit from this class.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed abstract class GestureType {
    protected func onActionInner(callback: (GestureEvent) -> Unit): Unit {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEventV2(evt))
        }
        let lambdaData = CallbackCJGestureEventV2(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureOnActionV2(lambdaData.getID())
        }
    }

    protected func onActionStartInner(callback: (GestureEvent) -> Unit): Unit {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEventV2(evt))
        }
        let lambdaData = CallbackCJGestureEventV2(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureOnActionStartV2(lambdaData.getID())
        }
    }

    protected func onActionUpdateInner(callback: (GestureEvent) -> Unit): Unit {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEventV2(evt))
        }
        let lambdaData = CallbackCJGestureEventV2(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureOnActionUpdateV2(lambdaData.getID())
        }
    }

    protected func onActionEndInner(callback: (GestureEvent) -> Unit): Unit {
        let wrapper = {
            evt: CJGestureEventV2 => callback(parseCJGestureEventV2(evt))
        }
        let lambdaData = CallbackCJGestureEventV2(wrapper)
        unsafe {
            FfiOHOSAceFrameworkGestureOnActionEndV2(lambdaData.getID())
        }
    }

    protected func onActionCancelInner(callback: () -> Unit): Unit {
        unsafe {
            FfiOHOSAceFrameworkGestureOnActionCancel(Callback0Param<Unit>(callback).getID())
        }
    }

    protected open func create(): Unit {}

    protected open func pop(): Unit {
        unsafe {
            FfiOHOSAceFrameworkGesturePop()
        }
    }
}

/**
 * Defines a pan gesture.
 * A pan gesture is triggered when the movement distance of a finger on the screen reaches the minimum value.
 */
@!APILevel[
    since: "26.1.0",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PanGesture <: GestureType {
    private var fingers: ?Int32 = Option.None
    private var direction: ?PanDirection = Option.None
    private var distance: ?Float64 = Option.None
    private var onActionStartCallback: ?(GestureEvent) -> Unit = Option.None
    private var onActionUpdateCallback: ?(GestureEvent) -> Unit = Option.None
    private var onActionEndCallback: ?(GestureEvent) -> Unit = Option.None
    private var onActionCancelCallback: ?() -> Unit = Option.None

    /**
     * Creates a pan gesture.
     *
     * @param { ?Int32 } [fingers] - Minimum number of fingers to trigger a pan gesture. Value range: [1, 10].
     *   Default value: 1. If the value is less than 1 or is not set, the default value is used.
     * @param { ?PanDirection } [direction] - Pan direction. The value supports the AND (&) and OR (|) operations.
     *   Default value: PanDirection.All.
     * @param { ?Float64 } [distance] - Minimum pan distance to trigger the gesture, in vp. Value range: [0, +∞).
     *   Default value: 5.0. If the value specified is less than 0, the default value is used.
     *   NOTE: If a pan gesture and a tab swipe occur at the same time, set distance to 1 to make the gesture more
     *   easily recognizable. When the scale attribute is applied to the component, the actual pan distance is
     *   adjusted based on the scale ratio.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(fingers!: ?Int32 = Option<Int32>.None, direction!: ?PanDirection = Option<PanDirection>.None,
        distance!: ?Float64 = Option<Float64>.None) {
        this.fingers = match (fingers) {
            case Some(v) => getOrDefault(v, 1, 10, 1)
            case None => 1
        }
        this.direction = direction ?? PanDirection.All
        this.distance = match (distance) {
            case Some(v) => getOrDefault(v, 0.0, Float64.Max, 5.0)
            case None => 5.0
        }
    }

    /**
     * Registers the callback for successful pan gesture recognition.
     *
     * @param { (GestureEvent) -> Unit } callback - Callback for successful pan gesture recognition.
     * @returns { This } The instance of the gesture.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionStart(callback: (GestureEvent) -> Unit): This {
        this.onActionStartCallback = callback
        this
    }

    /**
     * Registers the callback for pan gesture updates.
     * If fingerList contains multiple fingers, this callback updates the location information of only one finger each time.
     *
     * @param { (GestureEvent) -> Unit } callback - Callback for pan gesture updates.
     * @returns { This } The instance of the gesture.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionUpdate(callback: (GestureEvent) -> Unit): This {
        this.onActionUpdateCallback = callback
        this
    }

    /**
     * Registers the callback for pan gesture completion.
     * This callback is triggered when all fingers are lifted after successful pan gesture recognition.
     *
     * @param { (GestureEvent) -> Unit } callback - Callback for pan gesture completion.
     * @returns { This } The instance of the gesture.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionEnd(callback: (GestureEvent) -> Unit): This {
        this.onActionEndCallback = callback
        this
    }

    /**
     * Registers the callback for pan gesture cancellation. This callback is triggered when a touch cancellation
     * event occurs after successful pan gesture recognition. No gesture event information is returned.
     *
     * @param { () -> Unit } callback - Callback for pan gesture cancellation.
     * @returns { This } The instance of the gesture.
     */
    @!APILevel[
        since: "26.1.0",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onActionCancel(callback: () -> Unit): This {
        this.onActionCancelCallback = callback
        this
    }

    protected override func create() {
        unsafe {
            FfiOHOSAceFrameworkPanGestureCreate(fingers.getOrThrow(), direction.getOrThrow().getValue(),
                distance.getOrThrow())
        }

        match (this.onActionStartCallback) {
            case Some(val) => onActionStartInner(val)
            case None => ()
        }
        match (this.onActionUpdateCallback) {
            case Some(val) => onActionUpdateInner(val)
            case None => ()
        }
        match (this.onActionEndCallback) {
            case Some(val) => onActionEndInner(val)
            case None => ()
        }
        match (this.onActionCancelCallback) {
            case Some(val) => onActionCancelInner(val)
            case None => ()
        }
    }
}
