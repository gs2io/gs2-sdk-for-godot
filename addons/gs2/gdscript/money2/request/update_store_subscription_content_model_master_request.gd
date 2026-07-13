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
class_name Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest
extends Gs2Request


var namespace_name = null
var content_name = null
var description = null
var metadata = null
var schedule_namespace_id = null
var trigger_name = null
var trigger_extend_mode = null
var rollup_hour = null
var reallocate_span_days = null
var apple_app_store = null
var google_play = null


func with_namespace_name(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    namespace_name = v
    return self


func with_content_name(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    content_name = v
    return self


func with_description(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    metadata = v
    return self


func with_schedule_namespace_id(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    schedule_namespace_id = v
    return self


func with_trigger_name(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    trigger_name = v
    return self


func with_trigger_extend_mode(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    trigger_extend_mode = v
    return self


func with_rollup_hour(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    rollup_hour = v
    return self


func with_reallocate_span_days(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    reallocate_span_days = v
    return self


func with_apple_app_store(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    apple_app_store = v
    return self


func with_google_play(v) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    google_play = v
    return self


static func from_dict(data) -> Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.content_name = null if data.get("contentName") == null else str(data.get("contentName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.schedule_namespace_id = null if data.get("scheduleNamespaceId") == null else str(data.get("scheduleNamespaceId"))
    ret.trigger_name = null if data.get("triggerName") == null else str(data.get("triggerName"))
    ret.trigger_extend_mode = null if data.get("triggerExtendMode") == null else str(data.get("triggerExtendMode"))
    ret.rollup_hour = null if data.get("rollupHour") == null else int(data.get("rollupHour"))
    ret.reallocate_span_days = null if data.get("reallocateSpanDays") == null else int(data.get("reallocateSpanDays"))
    ret.apple_app_store = null if data.get("appleAppStore") == null else Gs2Money2AppleAppStoreSubscriptionContent.from_dict(data.get("appleAppStore"))
    ret.google_play = null if data.get("googlePlay") == null else Gs2Money2GooglePlaySubscriptionContent.from_dict(data.get("googlePlay"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["contentName"] = content_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["scheduleNamespaceId"] = schedule_namespace_id
    ret["triggerName"] = trigger_name
    ret["triggerExtendMode"] = trigger_extend_mode
    ret["rollupHour"] = rollup_hour
    ret["reallocateSpanDays"] = reallocate_span_days
    ret["appleAppStore"] = null if apple_app_store == null else apple_app_store.to_dict()
    ret["googlePlay"] = null if google_play == null else google_play.to_dict()
    return ret