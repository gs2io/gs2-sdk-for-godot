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
class_name Gs2ScheduleWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2ScheduleCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2ScheduleGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2ScheduleGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2ScheduleUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2ScheduleDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2ScheduleGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2ScheduleDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2ScheduleCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2ScheduleCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2ScheduleCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2SchedulePrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SchedulePrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2ScheduleImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2ScheduleCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func create_event_master(request: Gs2ScheduleCreateEventMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.schedule_type != null:
        body["scheduleType"] = request.schedule_type
    if request.absolute_begin != null:
        body["absoluteBegin"] = request.absolute_begin
    if request.absolute_end != null:
        body["absoluteEnd"] = request.absolute_end
    if request.repeat_type != null:
        body["repeatType"] = request.repeat_type
    if request.repeat_begin_day_of_month != null:
        body["repeatBeginDayOfMonth"] = request.repeat_begin_day_of_month
    if request.repeat_end_day_of_month != null:
        body["repeatEndDayOfMonth"] = request.repeat_end_day_of_month
    if request.repeat_begin_day_of_week != null:
        body["repeatBeginDayOfWeek"] = request.repeat_begin_day_of_week
    if request.repeat_end_day_of_week != null:
        body["repeatEndDayOfWeek"] = request.repeat_end_day_of_week
    if request.repeat_begin_hour != null:
        body["repeatBeginHour"] = request.repeat_begin_hour
    if request.repeat_end_hour != null:
        body["repeatEndHour"] = request.repeat_end_hour
    if request.relative_trigger_name != null:
        body["relativeTriggerName"] = request.relative_trigger_name
    if request.repeat_setting != null:
        body["repeatSetting"] = request.repeat_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "eventMaster", "createEventMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleCreateEventMasterResult.from_dict(response.body), null)


func get_event_master(request: Gs2ScheduleGetEventMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "eventMaster", "getEventMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetEventMasterResult.from_dict(response.body), null)


func update_event_master(request: Gs2ScheduleUpdateEventMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.schedule_type != null:
        body["scheduleType"] = request.schedule_type
    if request.absolute_begin != null:
        body["absoluteBegin"] = request.absolute_begin
    if request.absolute_end != null:
        body["absoluteEnd"] = request.absolute_end
    if request.repeat_type != null:
        body["repeatType"] = request.repeat_type
    if request.repeat_begin_day_of_month != null:
        body["repeatBeginDayOfMonth"] = request.repeat_begin_day_of_month
    if request.repeat_end_day_of_month != null:
        body["repeatEndDayOfMonth"] = request.repeat_end_day_of_month
    if request.repeat_begin_day_of_week != null:
        body["repeatBeginDayOfWeek"] = request.repeat_begin_day_of_week
    if request.repeat_end_day_of_week != null:
        body["repeatEndDayOfWeek"] = request.repeat_end_day_of_week
    if request.repeat_begin_hour != null:
        body["repeatBeginHour"] = request.repeat_begin_hour
    if request.repeat_end_hour != null:
        body["repeatEndHour"] = request.repeat_end_hour
    if request.relative_trigger_name != null:
        body["relativeTriggerName"] = request.relative_trigger_name
    if request.repeat_setting != null:
        body["repeatSetting"] = request.repeat_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "eventMaster", "updateEventMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleUpdateEventMasterResult.from_dict(response.body), null)


func delete_event_master(request: Gs2ScheduleDeleteEventMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "eventMaster", "deleteEventMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleDeleteEventMasterResult.from_dict(response.body), null)


func get_trigger(request: Gs2ScheduleGetTriggerRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "getTrigger", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetTriggerResult.from_dict(response.body), null)


func get_trigger_by_user_id(request: Gs2ScheduleGetTriggerByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "getTriggerByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetTriggerByUserIdResult.from_dict(response.body), null)


func trigger_by_user_id(request: Gs2ScheduleTriggerByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.trigger_strategy != null:
        body["triggerStrategy"] = request.trigger_strategy
    if request.ttl != null:
        body["ttl"] = request.ttl
    if request.event_id != null:
        body["eventId"] = request.event_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "triggerByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleTriggerByUserIdResult.from_dict(response.body), null)


func extend_trigger_by_user_id(request: Gs2ScheduleExtendTriggerByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.extend_seconds != null:
        body["extendSeconds"] = request.extend_seconds
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "extendTriggerByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleExtendTriggerByUserIdResult.from_dict(response.body), null)


func trigger_by_stamp_sheet(request: Gs2ScheduleTriggerByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "triggerByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleTriggerByStampSheetResult.from_dict(response.body), null)


func extend_trigger_by_stamp_sheet(request: Gs2ScheduleExtendTriggerByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "extendTriggerByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleExtendTriggerByStampSheetResult.from_dict(response.body), null)


func delete_trigger(request: Gs2ScheduleDeleteTriggerRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "deleteTrigger", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleDeleteTriggerResult.from_dict(response.body), null)


func delete_trigger_by_user_id(request: Gs2ScheduleDeleteTriggerByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "deleteTriggerByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleDeleteTriggerByUserIdResult.from_dict(response.body), null)


func verify_trigger(request: Gs2ScheduleVerifyTriggerRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.elapsed_minutes != null:
        body["elapsedMinutes"] = request.elapsed_minutes
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "verifyTrigger", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleVerifyTriggerResult.from_dict(response.body), null)


func verify_trigger_by_user_id(request: Gs2ScheduleVerifyTriggerByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.elapsed_minutes != null:
        body["elapsedMinutes"] = request.elapsed_minutes
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "trigger", "verifyTriggerByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleVerifyTriggerByUserIdResult.from_dict(response.body), null)


func get_event(request: Gs2ScheduleGetEventRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.is_in_schedule != null:
        body["isInSchedule"] = request.is_in_schedule
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "event", "getEvent", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetEventResult.from_dict(response.body), null)


func get_event_by_user_id(request: Gs2ScheduleGetEventByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.is_in_schedule != null:
        body["isInSchedule"] = request.is_in_schedule
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "event", "getEventByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetEventByUserIdResult.from_dict(response.body), null)


func get_raw_event(request: Gs2ScheduleGetRawEventRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "event", "getRawEvent", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleGetRawEventResult.from_dict(response.body), null)


func verify_event(request: Gs2ScheduleVerifyEventRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "event", "verifyEvent", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleVerifyEventResult.from_dict(response.body), null)


func verify_event_by_user_id(request: Gs2ScheduleVerifyEventByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.event_name != null:
        body["eventName"] = request.event_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "event", "verifyEventByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ScheduleVerifyEventByUserIdResult.from_dict(response.body), null)


func pre_update_current_event_master(request: Gs2SchedulePreUpdateCurrentEventMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("schedule", "currentEventMaster", "preUpdateCurrentEventMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SchedulePreUpdateCurrentEventMasterResult.from_dict(response.body), null)