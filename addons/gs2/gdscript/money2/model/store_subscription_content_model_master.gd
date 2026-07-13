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
class_name Gs2Money2StoreSubscriptionContentModelMaster
extends RefCounted


var store_subscription_content_model_id = null
var name = null
var description = null
var metadata = null
var schedule_namespace_id = null
var trigger_name = null
var reallocate_span_days = null
var trigger_extend_mode = null
var rollup_hour = null
var apple_app_store = null
var google_play = null
var created_at = null
var updated_at = null
var revision = null


func with_store_subscription_content_model_id(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    store_subscription_content_model_id = v
    return self


func with_name(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    name = v
    return self


func with_description(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    metadata = v
    return self


func with_schedule_namespace_id(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    schedule_namespace_id = v
    return self


func with_trigger_name(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    trigger_name = v
    return self


func with_reallocate_span_days(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    reallocate_span_days = v
    return self


func with_trigger_extend_mode(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    trigger_extend_mode = v
    return self


func with_rollup_hour(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    rollup_hour = v
    return self


func with_apple_app_store(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    apple_app_store = v
    return self


func with_google_play(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    google_play = v
    return self


func with_created_at(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2Money2StoreSubscriptionContentModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:subscription:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:subscription:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:subscription:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_content_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:subscription:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("contentName")


static func from_dict(data) -> Gs2Money2StoreSubscriptionContentModelMaster:
    if data == null:
        return null
    var ret = Gs2Money2StoreSubscriptionContentModelMaster.new()
    ret.store_subscription_content_model_id = null if data.get("storeSubscriptionContentModelId") == null else str(data.get("storeSubscriptionContentModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.schedule_namespace_id = null if data.get("scheduleNamespaceId") == null else str(data.get("scheduleNamespaceId"))
    ret.trigger_name = null if data.get("triggerName") == null else str(data.get("triggerName"))
    ret.reallocate_span_days = null if data.get("reallocateSpanDays") == null else int(data.get("reallocateSpanDays"))
    ret.trigger_extend_mode = null if data.get("triggerExtendMode") == null else str(data.get("triggerExtendMode"))
    ret.rollup_hour = null if data.get("rollupHour") == null else int(data.get("rollupHour"))
    ret.apple_app_store = null if data.get("appleAppStore") == null else Gs2Money2AppleAppStoreSubscriptionContent.from_dict(data.get("appleAppStore"))
    ret.google_play = null if data.get("googlePlay") == null else Gs2Money2GooglePlaySubscriptionContent.from_dict(data.get("googlePlay"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["storeSubscriptionContentModelId"] = store_subscription_content_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["scheduleNamespaceId"] = schedule_namespace_id
    ret["triggerName"] = trigger_name
    ret["reallocateSpanDays"] = reallocate_span_days
    ret["triggerExtendMode"] = trigger_extend_mode
    ret["rollupHour"] = rollup_hour
    ret["appleAppStore"] = null if apple_app_store == null else apple_app_store.to_dict()
    ret["googlePlay"] = null if google_play == null else google_play.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret