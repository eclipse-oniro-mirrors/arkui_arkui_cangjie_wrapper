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

// Direct-capture buffer for GestureEvent data-plane value assertions (SR-006).
// Gesture callbacks run on the UI thread and append raw field values here; the ohosTest
// side resets before injection and reads the records after injection settles, so value
// assertions bypass the "@State -> re-render -> inspector read-back" chain entirely
// (DT-008~010 upgrade + DT-116~123). Cross-thread pattern follows the OnChildTouchCount
// precedent (static registry, written on UI thread, read on the test thread after the
// injected gesture has finished).
package ohos_app_cangjie_entry

import ohos.arkui.component.*
import std.collection.*

public class GestureEventRecord {
    public var phase: String
    public var timestamp: Int64
    public var offsetX: Float64
    public var offsetY: Float64
    public var velocityX: Float64
    public var velocityY: Float64
    public var velocity: Float64
    public var repeatValue: Bool
    public var fingerIds: Array<Int32>
    public var fingerGlobalXs: Array<Float64>
    public var fingerGlobalYs: Array<Float64>
    public var fingerLocalXs: Array<Float64>
    public var fingerLocalYs: Array<Float64>
    public var fingerHandValue: String
    public var fingerInfosNone: Bool
    public var fingerInfoIds: Array<Int32>
    public var fingerInfoGlobalXs: Array<Float64>
    public var fingerInfoGlobalYs: Array<Float64>
    public var fingerInfoLocalXs: Array<Float64>
    public var fingerInfoLocalYs: Array<Float64>
    public var fingerInfoHandValue: String
    public var tapLocationNone: Bool
    public var sourceTouch: Bool
    // FingerInfo display coordinate channels, per fingerList / fingerInfos channel:
    // displayX/displayY are the screen-origin coordinates (Float64);
    // globalDisplayX/globalDisplayY (?Float64) are the global-display-origin coordinates,
    // serialized as text ("OptionNone" or the value) since their Some/None state and
    // value are display-environment dependent (same rationale as fingerHandValue).
    public var fingerDisplayXs: Array<Float64>
    public var fingerDisplayYs: Array<Float64>
    public var fingerGlobalDisplayXs: Array<String>
    public var fingerGlobalDisplayYs: Array<String>
    public var fingerInfoDisplayXs: Array<Float64>
    public var fingerInfoDisplayYs: Array<Float64>
    public var fingerInfoGlobalDisplayXs: Array<String>
    public var fingerInfoGlobalDisplayYs: Array<String>

    public init(phase: String, timestamp: Int64, offsetX: Float64, offsetY: Float64,
        velocityX: Float64, velocityY: Float64, velocity: Float64, repeatValue: Bool,
        fingerIds: Array<Int32>, fingerGlobalXs: Array<Float64>, fingerGlobalYs: Array<Float64>,
        fingerLocalXs: Array<Float64>, fingerLocalYs: Array<Float64>, fingerHandValue: String,
        fingerInfosNone: Bool, fingerInfoIds: Array<Int32>, fingerInfoGlobalXs: Array<Float64>,
        fingerInfoGlobalYs: Array<Float64>, fingerInfoLocalXs: Array<Float64>,
        fingerInfoLocalYs: Array<Float64>, fingerInfoHandValue: String, tapLocationNone: Bool, sourceTouch: Bool,
        fingerDisplayXs: Array<Float64>, fingerDisplayYs: Array<Float64>,
        fingerGlobalDisplayXs: Array<String>, fingerGlobalDisplayYs: Array<String>,
        fingerInfoDisplayXs: Array<Float64>, fingerInfoDisplayYs: Array<Float64>,
        fingerInfoGlobalDisplayXs: Array<String>, fingerInfoGlobalDisplayYs: Array<String>) {
        this.phase = phase
        this.timestamp = timestamp
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.velocityX = velocityX
        this.velocityY = velocityY
        this.velocity = velocity
        this.repeatValue = repeatValue
        this.fingerIds = fingerIds
        this.fingerGlobalXs = fingerGlobalXs
        this.fingerGlobalYs = fingerGlobalYs
        this.fingerLocalXs = fingerLocalXs
        this.fingerLocalYs = fingerLocalYs
        this.fingerHandValue = fingerHandValue
        this.fingerInfosNone = fingerInfosNone
        this.fingerInfoIds = fingerInfoIds
        this.fingerInfoGlobalXs = fingerInfoGlobalXs
        this.fingerInfoGlobalYs = fingerInfoGlobalYs
        this.fingerInfoLocalXs = fingerInfoLocalXs
        this.fingerInfoLocalYs = fingerInfoLocalYs
        this.fingerInfoHandValue = fingerInfoHandValue
        this.tapLocationNone = tapLocationNone
        this.sourceTouch = sourceTouch
        this.fingerDisplayXs = fingerDisplayXs
        this.fingerDisplayYs = fingerDisplayYs
        this.fingerGlobalDisplayXs = fingerGlobalDisplayXs
        this.fingerGlobalDisplayYs = fingerGlobalDisplayYs
        this.fingerInfoDisplayXs = fingerInfoDisplayXs
        this.fingerInfoDisplayYs = fingerInfoDisplayYs
        this.fingerInfoGlobalDisplayXs = fingerInfoGlobalDisplayXs
        this.fingerInfoGlobalDisplayYs = fingerInfoGlobalDisplayYs
    }
}

public class GestureEventRecords {
    public static var records: ArrayList<GestureEventRecord> = ArrayList<GestureEventRecord>()

    public static func reset(): Unit {
        records = ArrayList<GestureEventRecord>()
    }

    public static func add(record: GestureEventRecord): Unit {
        records.add(record)
    }

    // Shared extraction: views call this inside gesture callbacks to capture raw
    // GestureEvent field values (fingerList/fingerInfos contents including global
    // coordinates on both channels, velocity family, timestamp, repeat, tapLocation,
    // source, FingerInfo.hand, FingerInfo display/globalDisplay coordinates) without
    // booleanizing.
    public static func record(phase: String, e: GestureEvent): Unit {
        let fingerIds = ArrayList<Int32>()
        let fingerGlobalXs = ArrayList<Float64>()
        let fingerGlobalYs = ArrayList<Float64>()
        let fingerLocalXs = ArrayList<Float64>()
        let fingerLocalYs = ArrayList<Float64>()
        let fingerDisplayXs = ArrayList<Float64>()
        let fingerDisplayYs = ArrayList<Float64>()
        let fingerGlobalDisplayXs = ArrayList<String>()
        let fingerGlobalDisplayYs = ArrayList<String>()
        var fingerHandValue = "absent"
        for (f in e.fingerList) {
            fingerIds.add(f.id)
            fingerGlobalXs.add(f.globalX)
            fingerGlobalYs.add(f.globalY)
            fingerLocalXs.add(f.localX)
            fingerLocalYs.add(f.localY)
            fingerDisplayXs.add(f.displayX)
            fingerDisplayYs.add(f.displayY)
            fingerGlobalDisplayXs.add(optionFloat64Text(f.globalDisplayX))
            fingerGlobalDisplayYs.add(optionFloat64Text(f.globalDisplayY))
            fingerHandValue = interactionHandValue(f.hand)
        }
        let infoIds = ArrayList<Int32>()
        let infoGlobalXs = ArrayList<Float64>()
        let infoGlobalYs = ArrayList<Float64>()
        let infoLocalXs = ArrayList<Float64>()
        let infoLocalYs = ArrayList<Float64>()
        let infoDisplayXs = ArrayList<Float64>()
        let infoDisplayYs = ArrayList<Float64>()
        let infoGlobalDisplayXs = ArrayList<String>()
        let infoGlobalDisplayYs = ArrayList<String>()
        var infosNone = true
        var infoHandValue = "absent"
        match (e.fingerInfos) {
            case Some(infos) =>
                infosNone = false
                for (f in infos) {
                    infoIds.add(f.id)
                    infoGlobalXs.add(f.globalX)
                    infoGlobalYs.add(f.globalY)
                    infoLocalXs.add(f.localX)
                    infoLocalYs.add(f.localY)
                    infoDisplayXs.add(f.displayX)
                    infoDisplayYs.add(f.displayY)
                    infoGlobalDisplayXs.add(optionFloat64Text(f.globalDisplayX))
                    infoGlobalDisplayYs.add(optionFloat64Text(f.globalDisplayY))
                    infoHandValue = interactionHandValue(f.hand)
                }
            case None => ()
        }
        var sourceTouch = false
        match (e.source) {
            case Some(SourceType.TouchScreen) => sourceTouch = true
            case _ => ()
        }
        add(GestureEventRecord(phase, e.timestamp, e.offsetX, e.offsetY,
            e.velocityX, e.velocityY, e.velocity, e.repeat, fingerIds.toArray(),
            fingerGlobalXs.toArray(), fingerGlobalYs.toArray(),
            fingerLocalXs.toArray(), fingerLocalYs.toArray(), fingerHandValue, infosNone, infoIds.toArray(),
            infoGlobalXs.toArray(), infoGlobalYs.toArray(), infoLocalXs.toArray(),
            infoLocalYs.toArray(), infoHandValue, e.tapLocation.isNone(), sourceTouch,
            fingerDisplayXs.toArray(), fingerDisplayYs.toArray(),
            fingerGlobalDisplayXs.toArray(), fingerGlobalDisplayYs.toArray(),
            infoDisplayXs.toArray(), infoDisplayYs.toArray(),
            infoGlobalDisplayXs.toArray(), infoGlobalDisplayYs.toArray()))
    }
}

// Serialization of FingerInfo.hand (?InteractionHand): the actual device-filled value,
// independent of whether the injection path marks an operating hand. "absent" = the
// channel carried no finger; "OptionNone" = hand is Option.None; otherwise the
// InteractionHand variant name.
func interactionHandValue(hand: ?InteractionHand): String {
    match (hand) {
        case None => "OptionNone"
        case Some(h) => match (h) {
            case InteractionHand.None => "None"
            case InteractionHand.Left => "Left"
            case _ => "Right"
        }
    }
}

// Serialization of ?Float64 coordinate channels (FingerInfo.globalDisplayX/globalDisplayY):
// the Some/None state and the concrete value are display-environment dependent, so the
// channel is captured as text ("OptionNone" or the value) for stability and cross-channel
// agreement assertions (the observed value is logged by the test, never assumed).
func optionFloat64Text(v: ?Float64): String {
    match (v) {
        case None => "OptionNone"
        case Some(x) => "${x}"
    }
}
