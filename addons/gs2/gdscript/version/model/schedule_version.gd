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
class_name Gs2VersionScheduleVersion
extends RefCounted


var current_version = null
var warning_version = null
var error_version = null
var schedule_event_id = null


func with_current_version(v) -> Gs2VersionScheduleVersion:
    current_version = v
    return self


func with_warning_version(v) -> Gs2VersionScheduleVersion:
    warning_version = v
    return self


func with_error_version(v) -> Gs2VersionScheduleVersion:
    error_version = v
    return self


func with_schedule_event_id(v) -> Gs2VersionScheduleVersion:
    schedule_event_id = v
    return self


static func from_dict(data) -> Gs2VersionScheduleVersion:
    if data == null:
        return null
    var ret = Gs2VersionScheduleVersion.new()
    ret.current_version = null if data.get("currentVersion") == null else Gs2VersionVersion.from_dict(data.get("currentVersion"))
    ret.warning_version = null if data.get("warningVersion") == null else Gs2VersionVersion.from_dict(data.get("warningVersion"))
    ret.error_version = null if data.get("errorVersion") == null else Gs2VersionVersion.from_dict(data.get("errorVersion"))
    ret.schedule_event_id = null if data.get("scheduleEventId") == null else str(data.get("scheduleEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["currentVersion"] = null if current_version == null else current_version.to_dict()
    ret["warningVersion"] = null if warning_version == null else warning_version.to_dict()
    ret["errorVersion"] = null if error_version == null else error_version.to_dict()
    ret["scheduleEventId"] = schedule_event_id
    return ret