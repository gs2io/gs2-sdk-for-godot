# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
class_name Gs2LogLogEntry
extends RefCounted


var timestamp = null
var status = null
var duration = null
var line = null
var labels = null


func with_timestamp(v) -> Gs2LogLogEntry:
    timestamp = v
    return self


func with_status(v) -> Gs2LogLogEntry:
    status = v
    return self


func with_duration(v) -> Gs2LogLogEntry:
    duration = v
    return self


func with_line(v) -> Gs2LogLogEntry:
    line = v
    return self


func with_labels(v) -> Gs2LogLogEntry:
    labels = v
    return self


static func from_dict(data) -> Gs2LogLogEntry:
    if data == null:
        return null
    var ret = Gs2LogLogEntry.new()
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.duration = null if data.get("duration") == null else int(data.get("duration"))
    ret.line = null if data.get("line") == null else str(data.get("line"))
    ret.labels = null if data.get("labels") == null else data.get("labels").map(func(v): return Gs2LogLabel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["timestamp"] = timestamp
    ret["status"] = status
    ret["duration"] = duration
    ret["line"] = line
    ret["labels"] = null if labels == null else labels.map(func(v): return null if v == null else v.to_dict())
    return ret