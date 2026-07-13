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
class_name Gs2StaminaWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2StaminaCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.overflow_trigger_script != null:
        body["overflowTriggerScript"] = request.overflow_trigger_script
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2StaminaGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2StaminaGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2StaminaUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.overflow_trigger_script != null:
        body["overflowTriggerScript"] = request.overflow_trigger_script
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2StaminaDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2StaminaGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2StaminaDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2StaminaCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2StaminaCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2StaminaCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2StaminaPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2StaminaImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("stamina", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2StaminaCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("stamina", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func create_stamina_model_master(request: Gs2StaminaCreateStaminaModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.recover_interval_minutes != null:
        body["recoverIntervalMinutes"] = request.recover_interval_minutes
    if request.recover_value != null:
        body["recoverValue"] = request.recover_value
    if request.initial_capacity != null:
        body["initialCapacity"] = request.initial_capacity
    if request.is_overflow != null:
        body["isOverflow"] = request.is_overflow
    if request.max_capacity != null:
        body["maxCapacity"] = request.max_capacity
    if request.max_stamina_table_name != null:
        body["maxStaminaTableName"] = request.max_stamina_table_name
    if request.recover_interval_table_name != null:
        body["recoverIntervalTableName"] = request.recover_interval_table_name
    if request.recover_value_table_name != null:
        body["recoverValueTableName"] = request.recover_value_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "staminaModelMaster", "createStaminaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCreateStaminaModelMasterResult.from_dict(response.body), null)


func get_stamina_model_master(request: Gs2StaminaGetStaminaModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "staminaModelMaster", "getStaminaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetStaminaModelMasterResult.from_dict(response.body), null)


func update_stamina_model_master(request: Gs2StaminaUpdateStaminaModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.recover_interval_minutes != null:
        body["recoverIntervalMinutes"] = request.recover_interval_minutes
    if request.recover_value != null:
        body["recoverValue"] = request.recover_value
    if request.initial_capacity != null:
        body["initialCapacity"] = request.initial_capacity
    if request.is_overflow != null:
        body["isOverflow"] = request.is_overflow
    if request.max_capacity != null:
        body["maxCapacity"] = request.max_capacity
    if request.max_stamina_table_name != null:
        body["maxStaminaTableName"] = request.max_stamina_table_name
    if request.recover_interval_table_name != null:
        body["recoverIntervalTableName"] = request.recover_interval_table_name
    if request.recover_value_table_name != null:
        body["recoverValueTableName"] = request.recover_value_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "staminaModelMaster", "updateStaminaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaUpdateStaminaModelMasterResult.from_dict(response.body), null)


func delete_stamina_model_master(request: Gs2StaminaDeleteStaminaModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "staminaModelMaster", "deleteStaminaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDeleteStaminaModelMasterResult.from_dict(response.body), null)


func create_max_stamina_table_master(request: Gs2StaminaCreateMaxStaminaTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.values != null:
        body["values"] = request.values
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "maxStaminaTableMaster", "createMaxStaminaTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCreateMaxStaminaTableMasterResult.from_dict(response.body), null)


func get_max_stamina_table_master(request: Gs2StaminaGetMaxStaminaTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.max_stamina_table_name != null:
        body["maxStaminaTableName"] = request.max_stamina_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "maxStaminaTableMaster", "getMaxStaminaTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetMaxStaminaTableMasterResult.from_dict(response.body), null)


func update_max_stamina_table_master(request: Gs2StaminaUpdateMaxStaminaTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.max_stamina_table_name != null:
        body["maxStaminaTableName"] = request.max_stamina_table_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.values != null:
        body["values"] = request.values
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "maxStaminaTableMaster", "updateMaxStaminaTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaUpdateMaxStaminaTableMasterResult.from_dict(response.body), null)


func delete_max_stamina_table_master(request: Gs2StaminaDeleteMaxStaminaTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.max_stamina_table_name != null:
        body["maxStaminaTableName"] = request.max_stamina_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "maxStaminaTableMaster", "deleteMaxStaminaTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDeleteMaxStaminaTableMasterResult.from_dict(response.body), null)


func create_recover_interval_table_master(request: Gs2StaminaCreateRecoverIntervalTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.values != null:
        body["values"] = request.values
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverIntervalTableMaster", "createRecoverIntervalTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCreateRecoverIntervalTableMasterResult.from_dict(response.body), null)


func get_recover_interval_table_master(request: Gs2StaminaGetRecoverIntervalTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.recover_interval_table_name != null:
        body["recoverIntervalTableName"] = request.recover_interval_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverIntervalTableMaster", "getRecoverIntervalTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetRecoverIntervalTableMasterResult.from_dict(response.body), null)


func update_recover_interval_table_master(request: Gs2StaminaUpdateRecoverIntervalTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.recover_interval_table_name != null:
        body["recoverIntervalTableName"] = request.recover_interval_table_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.values != null:
        body["values"] = request.values
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverIntervalTableMaster", "updateRecoverIntervalTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaUpdateRecoverIntervalTableMasterResult.from_dict(response.body), null)


func delete_recover_interval_table_master(request: Gs2StaminaDeleteRecoverIntervalTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.recover_interval_table_name != null:
        body["recoverIntervalTableName"] = request.recover_interval_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverIntervalTableMaster", "deleteRecoverIntervalTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDeleteRecoverIntervalTableMasterResult.from_dict(response.body), null)


func create_recover_value_table_master(request: Gs2StaminaCreateRecoverValueTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.values != null:
        body["values"] = request.values
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverValueTableMaster", "createRecoverValueTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaCreateRecoverValueTableMasterResult.from_dict(response.body), null)


func get_recover_value_table_master(request: Gs2StaminaGetRecoverValueTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.recover_value_table_name != null:
        body["recoverValueTableName"] = request.recover_value_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverValueTableMaster", "getRecoverValueTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetRecoverValueTableMasterResult.from_dict(response.body), null)


func update_recover_value_table_master(request: Gs2StaminaUpdateRecoverValueTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.recover_value_table_name != null:
        body["recoverValueTableName"] = request.recover_value_table_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.values != null:
        body["values"] = request.values
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverValueTableMaster", "updateRecoverValueTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaUpdateRecoverValueTableMasterResult.from_dict(response.body), null)


func delete_recover_value_table_master(request: Gs2StaminaDeleteRecoverValueTableMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.recover_value_table_name != null:
        body["recoverValueTableName"] = request.recover_value_table_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "recoverValueTableMaster", "deleteRecoverValueTableMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDeleteRecoverValueTableMasterResult.from_dict(response.body), null)


func pre_update_current_stamina_master(request: Gs2StaminaPreUpdateCurrentStaminaMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "currentStaminaMaster", "preUpdateCurrentStaminaMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaPreUpdateCurrentStaminaMasterResult.from_dict(response.body), null)


func get_stamina_model(request: Gs2StaminaGetStaminaModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "staminaModel", "getStaminaModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetStaminaModelResult.from_dict(response.body), null)


func get_stamina(request: Gs2StaminaGetStaminaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "getStamina", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetStaminaResult.from_dict(response.body), null)


func get_stamina_by_user_id(request: Gs2StaminaGetStaminaByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "getStaminaByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaGetStaminaByUserIdResult.from_dict(response.body), null)


func update_stamina_by_user_id(request: Gs2StaminaUpdateStaminaByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.value != null:
        body["value"] = request.value
    if request.max_value != null:
        body["maxValue"] = request.max_value
    if request.recover_interval_minutes != null:
        body["recoverIntervalMinutes"] = request.recover_interval_minutes
    if request.recover_value != null:
        body["recoverValue"] = request.recover_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "updateStaminaByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaUpdateStaminaByUserIdResult.from_dict(response.body), null)


func consume_stamina(request: Gs2StaminaConsumeStaminaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.consume_value != null:
        body["consumeValue"] = request.consume_value
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "consumeStamina", body)
    if response.error != null:
        if response.error.has_error_code("stamina.stamina.insufficient"):
            return Gs2AsyncResult.new(null, Gs2StaminaInsufficientException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaConsumeStaminaResult.from_dict(response.body), null)


func consume_stamina_by_user_id(request: Gs2StaminaConsumeStaminaByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.consume_value != null:
        body["consumeValue"] = request.consume_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "consumeStaminaByUserId", body)
    if response.error != null:
        if response.error.has_error_code("stamina.stamina.insufficient"):
            return Gs2AsyncResult.new(null, Gs2StaminaInsufficientException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaConsumeStaminaByUserIdResult.from_dict(response.body), null)


func apply_stamina(request: Gs2StaminaApplyStaminaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "applyStamina", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaApplyStaminaResult.from_dict(response.body), null)


func apply_stamina_by_user_id(request: Gs2StaminaApplyStaminaByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "applyStaminaByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaApplyStaminaByUserIdResult.from_dict(response.body), null)


func recover_stamina_by_user_id(request: Gs2StaminaRecoverStaminaByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.recover_value != null:
        body["recoverValue"] = request.recover_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "recoverStaminaByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaRecoverStaminaByUserIdResult.from_dict(response.body), null)


func raise_max_value_by_user_id(request: Gs2StaminaRaiseMaxValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.raise_value != null:
        body["raiseValue"] = request.raise_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "raiseMaxValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaRaiseMaxValueByUserIdResult.from_dict(response.body), null)


func decrease_max_value(request: Gs2StaminaDecreaseMaxValueRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.decrease_value != null:
        body["decreaseValue"] = request.decrease_value
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "decreaseMaxValue", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDecreaseMaxValueResult.from_dict(response.body), null)


func decrease_max_value_by_user_id(request: Gs2StaminaDecreaseMaxValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.decrease_value != null:
        body["decreaseValue"] = request.decrease_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "decreaseMaxValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDecreaseMaxValueByUserIdResult.from_dict(response.body), null)


func set_max_value_by_user_id(request: Gs2StaminaSetMaxValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.max_value != null:
        body["maxValue"] = request.max_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setMaxValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetMaxValueByUserIdResult.from_dict(response.body), null)


func set_recover_interval_by_user_id(request: Gs2StaminaSetRecoverIntervalByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.recover_interval_minutes != null:
        body["recoverIntervalMinutes"] = request.recover_interval_minutes
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setRecoverIntervalByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetRecoverIntervalByUserIdResult.from_dict(response.body), null)


func set_recover_value_by_user_id(request: Gs2StaminaSetRecoverValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.recover_value != null:
        body["recoverValue"] = request.recover_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setRecoverValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetRecoverValueByUserIdResult.from_dict(response.body), null)


func set_max_value_by_status(request: Gs2StaminaSetMaxValueByStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.signed_status_body != null:
        body["signedStatusBody"] = request.signed_status_body
    if request.signed_status_signature != null:
        body["signedStatusSignature"] = request.signed_status_signature
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setMaxValueByStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetMaxValueByStatusResult.from_dict(response.body), null)


func set_recover_interval_by_status(request: Gs2StaminaSetRecoverIntervalByStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.signed_status_body != null:
        body["signedStatusBody"] = request.signed_status_body
    if request.signed_status_signature != null:
        body["signedStatusSignature"] = request.signed_status_signature
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setRecoverIntervalByStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetRecoverIntervalByStatusResult.from_dict(response.body), null)


func set_recover_value_by_status(request: Gs2StaminaSetRecoverValueByStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.signed_status_body != null:
        body["signedStatusBody"] = request.signed_status_body
    if request.signed_status_signature != null:
        body["signedStatusSignature"] = request.signed_status_signature
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setRecoverValueByStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetRecoverValueByStatusResult.from_dict(response.body), null)


func delete_stamina_by_user_id(request: Gs2StaminaDeleteStaminaByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "deleteStaminaByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaDeleteStaminaByUserIdResult.from_dict(response.body), null)


func verify_stamina_value(request: Gs2StaminaVerifyStaminaValueRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaValue", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaValueResult.from_dict(response.body), null)


func verify_stamina_value_by_user_id(request: Gs2StaminaVerifyStaminaValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaValueByUserIdResult.from_dict(response.body), null)


func verify_stamina_max_value(request: Gs2StaminaVerifyStaminaMaxValueRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaMaxValue", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaMaxValueResult.from_dict(response.body), null)


func verify_stamina_max_value_by_user_id(request: Gs2StaminaVerifyStaminaMaxValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaMaxValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaMaxValueByUserIdResult.from_dict(response.body), null)


func verify_stamina_recover_interval_minutes(request: Gs2StaminaVerifyStaminaRecoverIntervalMinutesRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaRecoverIntervalMinutes", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaRecoverIntervalMinutesResult.from_dict(response.body), null)


func verify_stamina_recover_interval_minutes_by_user_id(request: Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaRecoverIntervalMinutesByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdResult.from_dict(response.body), null)


func verify_stamina_recover_value(request: Gs2StaminaVerifyStaminaRecoverValueRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaRecoverValue", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaRecoverValueResult.from_dict(response.body), null)


func verify_stamina_recover_value_by_user_id(request: Gs2StaminaVerifyStaminaRecoverValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaRecoverValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaRecoverValueByUserIdResult.from_dict(response.body), null)


func verify_stamina_overflow_value(request: Gs2StaminaVerifyStaminaOverflowValueRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaOverflowValue", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaOverflowValueResult.from_dict(response.body), null)


func verify_stamina_overflow_value_by_user_id(request: Gs2StaminaVerifyStaminaOverflowValueByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.stamina_name != null:
        body["staminaName"] = request.stamina_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "verifyStaminaOverflowValueByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaVerifyStaminaOverflowValueByUserIdResult.from_dict(response.body), null)


func recover_stamina_by_stamp_sheet(request: Gs2StaminaRecoverStaminaByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "recoverStaminaByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaRecoverStaminaByStampSheetResult.from_dict(response.body), null)


func raise_max_value_by_stamp_sheet(request: Gs2StaminaRaiseMaxValueByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "raiseMaxValueByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaRaiseMaxValueByStampSheetResult.from_dict(response.body), null)


func set_max_value_by_stamp_sheet(request: Gs2StaminaSetMaxValueByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setMaxValueByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetMaxValueByStampSheetResult.from_dict(response.body), null)


func set_recover_interval_by_stamp_sheet(request: Gs2StaminaSetRecoverIntervalByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setRecoverIntervalByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetRecoverIntervalByStampSheetResult.from_dict(response.body), null)


func set_recover_value_by_stamp_sheet(request: Gs2StaminaSetRecoverValueByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("stamina", "stamina", "setRecoverValueByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2StaminaSetRecoverValueByStampSheetResult.from_dict(response.body), null)