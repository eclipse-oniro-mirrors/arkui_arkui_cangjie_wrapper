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
// Direct-capture buffer for onChildTouchTest data-plane value assertions.
// onChildTouchTest callbacks run on the UI thread and append one entry list per invocation
// here; the ohosTest side resets before injection and reads the records after the injected
// gesture has settled, so per-property value assertions (x/y, parentX/parentY,
// windowX/windowY, rect, id, entry count) bypass the "@State -> re-render -> inspector
// read-back" chain entirely. Cross-thread pattern follows the GestureEventRecords /
// OnChildTouchCount precedent (static registry, written on UI thread, read on the test
// thread after the injected gesture has finished).
package ohos_app_cangjie_entry

import ohos.arkui.component.*
import std.collection.*

// Raw field values of one TouchTestInfo element. All numbers are px in the same frame as
// the ui_test bounds (the CJ FFI passes the raw pipeline values through).
public class TouchTestRecordEntry {
    public var id: String
    public var x: Float64
    public var y: Float64
    public var parentX: Float64
    public var parentY: Float64
    public var windowX: Float64
    public var windowY: Float64
    public var rectX: Float64
    public var rectY: Float64
    public var rectWidth: Float64
    public var rectHeight: Float64

    public init(id: String, x: Float64, y: Float64, parentX: Float64, parentY: Float64,
        windowX: Float64, windowY: Float64, rectX: Float64, rectY: Float64,
        rectWidth: Float64, rectHeight: Float64) {
        this.id = id
        this.x = x
        this.y = y
        this.parentX = parentX
        this.parentY = parentY
        this.windowX = windowX
        this.windowY = windowY
        this.rectX = rectX
        this.rectY = rectY
        this.rectWidth = rectWidth
        this.rectHeight = rectHeight
    }
}

public class OnChildTouchRecords {
    // One entry list per callback invocation, in invocation order.
    public static var invocations: ArrayList<Array<TouchTestRecordEntry>> =
        ArrayList<Array<TouchTestRecordEntry>>()

    public static func reset(): Unit {
        invocations = ArrayList<Array<TouchTestRecordEntry>>()
    }

    // Views call this inside the onChildTouchTest callback to capture the raw TouchTestInfo
    // field values of the whole invocation without serializing them into status text.
    public static func record(touchInfo: Array<TouchTestInfo>): Unit {
        let entries = Array<TouchTestRecordEntry>(touchInfo.size) { i => captureEntry(touchInfo[i]) }
        invocations.add(entries)
    }

    // Entry list of the invocation with the given index (0-based, injection order).
    public static func entriesOf(invocation: Int64): Array<TouchTestRecordEntry> {
        match (invocations.get(invocation)) {
            case Some(entries) => entries
            case None => throw Exception("no onChildTouchTest invocation ${invocation.toString()}")
        }
    }
}

func captureEntry(info: TouchTestInfo): TouchTestRecordEntry {
    TouchTestRecordEntry(
        info.id,
        info.x,
        info.y,
        info.parentX,
        info.parentY,
        info.windowX,
        info.windowY,
        info.rect.x,
        info.rect.y,
        info.rect.width,
        info.rect.height
    )
}
