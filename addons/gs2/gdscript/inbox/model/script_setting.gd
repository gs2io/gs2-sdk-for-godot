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
class_name Gs2InboxScriptSetting
extends RefCounted


var trigger_script_id = null
var done_trigger_target_type = null
var done_trigger_script_id = null
var done_trigger_queue_namespace_id = null


func with_trigger_script_id(v) -> Gs2InboxScriptSetting:
    trigger_script_id = v
    return self


func with_done_trigger_target_type(v) -> Gs2InboxScriptSetting:
    done_trigger_target_type = v
    return self


func with_done_trigger_script_id(v) -> Gs2InboxScriptSetting:
    done_trigger_script_id = v
    return self


func with_done_trigger_queue_namespace_id(v) -> Gs2InboxScriptSetting:
    done_trigger_queue_namespace_id = v
    return self


static func from_dict(data) -> Gs2InboxScriptSetting:
    if data == null:
        return null
    var ret = Gs2InboxScriptSetting.new()
    ret.trigger_script_id = null if data.get("triggerScriptId") == null else str(data.get("triggerScriptId"))
    ret.done_trigger_target_type = null if data.get("doneTriggerTargetType") == null else str(data.get("doneTriggerTargetType"))
    ret.done_trigger_script_id = null if data.get("doneTriggerScriptId") == null else str(data.get("doneTriggerScriptId"))
    ret.done_trigger_queue_namespace_id = null if data.get("doneTriggerQueueNamespaceId") == null else str(data.get("doneTriggerQueueNamespaceId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["triggerScriptId"] = trigger_script_id
    ret["doneTriggerTargetType"] = done_trigger_target_type
    ret["doneTriggerScriptId"] = done_trigger_script_id
    ret["doneTriggerQueueNamespaceId"] = done_trigger_queue_namespace_id
    return ret