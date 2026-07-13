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
class_name Gs2ScheduleTrigger
extends RefCounted


var trigger_id = null
var name = null
var user_id = null
var triggered_at = null
var expires_at = null
var created_at = null
var revision = null


func with_trigger_id(v) -> Gs2ScheduleTrigger:
    trigger_id = v
    return self


func with_name(v) -> Gs2ScheduleTrigger:
    name = v
    return self


func with_user_id(v) -> Gs2ScheduleTrigger:
    user_id = v
    return self


func with_triggered_at(v) -> Gs2ScheduleTrigger:
    triggered_at = v
    return self


func with_expires_at(v) -> Gs2ScheduleTrigger:
    expires_at = v
    return self


func with_created_at(v) -> Gs2ScheduleTrigger:
    created_at = v
    return self


func with_revision(v) -> Gs2ScheduleTrigger:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):user:(?<userId>.+):trigger:(?<triggerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):user:(?<userId>.+):trigger:(?<triggerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):user:(?<userId>.+):trigger:(?<triggerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):user:(?<userId>.+):trigger:(?<triggerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_trigger_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):user:(?<userId>.+):trigger:(?<triggerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("triggerName")


static func from_dict(data) -> Gs2ScheduleTrigger:
    if data == null:
        return null
    var ret = Gs2ScheduleTrigger.new()
    ret.trigger_id = null if data.get("triggerId") == null else str(data.get("triggerId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.triggered_at = null if data.get("triggeredAt") == null else int(data.get("triggeredAt"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["triggerId"] = trigger_id
    ret["name"] = name
    ret["userId"] = user_id
    ret["triggeredAt"] = triggered_at
    ret["expiresAt"] = expires_at
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret