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
class_name Gs2EnchantWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2EnchantCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2EnchantGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2EnchantGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2EnchantUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2EnchantDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2EnchantGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2EnchantDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2EnchantCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2EnchantCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2EnchantCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2EnchantPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2EnchantImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("enchant", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2EnchantCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("enchant", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func get_balance_parameter_model(request: Gs2EnchantGetBalanceParameterModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterModel", "getBalanceParameterModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetBalanceParameterModelResult.from_dict(response.body), null)


func create_balance_parameter_model_master(request: Gs2EnchantCreateBalanceParameterModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.total_value != null:
        body["totalValue"] = request.total_value
    if request.initial_value_strategy != null:
        body["initialValueStrategy"] = request.initial_value_strategy
    if request.parameters != null:
        body["parameters"] = request.parameters.map(func(v): return null if v == null else v.to_dict())
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterModelMaster", "createBalanceParameterModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantCreateBalanceParameterModelMasterResult.from_dict(response.body), null)


func get_balance_parameter_model_master(request: Gs2EnchantGetBalanceParameterModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterModelMaster", "getBalanceParameterModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetBalanceParameterModelMasterResult.from_dict(response.body), null)


func update_balance_parameter_model_master(request: Gs2EnchantUpdateBalanceParameterModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.total_value != null:
        body["totalValue"] = request.total_value
    if request.initial_value_strategy != null:
        body["initialValueStrategy"] = request.initial_value_strategy
    if request.parameters != null:
        body["parameters"] = request.parameters.map(func(v): return null if v == null else v.to_dict())
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterModelMaster", "updateBalanceParameterModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantUpdateBalanceParameterModelMasterResult.from_dict(response.body), null)


func delete_balance_parameter_model_master(request: Gs2EnchantDeleteBalanceParameterModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterModelMaster", "deleteBalanceParameterModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantDeleteBalanceParameterModelMasterResult.from_dict(response.body), null)


func pre_update_current_parameter_master(request: Gs2EnchantPreUpdateCurrentParameterMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "currentParameterMaster", "preUpdateCurrentParameterMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantPreUpdateCurrentParameterMasterResult.from_dict(response.body), null)


func get_balance_parameter_status(request: Gs2EnchantGetBalanceParameterStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterStatus", "getBalanceParameterStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetBalanceParameterStatusResult.from_dict(response.body), null)


func get_balance_parameter_status_by_user_id(request: Gs2EnchantGetBalanceParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterStatus", "getBalanceParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetBalanceParameterStatusByUserIdResult.from_dict(response.body), null)


func delete_balance_parameter_status_by_user_id(request: Gs2EnchantDeleteBalanceParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterStatus", "deleteBalanceParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantDeleteBalanceParameterStatusByUserIdResult.from_dict(response.body), null)


func re_draw_balance_parameter_status_by_user_id(request: Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.fixed_parameter_names != null:
        body["fixedParameterNames"] = request.fixed_parameter_names
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterStatus", "reDrawBalanceParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantReDrawBalanceParameterStatusByUserIdResult.from_dict(response.body), null)


func re_draw_balance_parameter_status_by_stamp_sheet(request: Gs2EnchantReDrawBalanceParameterStatusByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterStatus", "reDrawBalanceParameterStatusByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantReDrawBalanceParameterStatusByStampSheetResult.from_dict(response.body), null)


func set_balance_parameter_status_by_user_id(request: Gs2EnchantSetBalanceParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.parameter_values != null:
        body["parameterValues"] = request.parameter_values.map(func(v): return null if v == null else v.to_dict())
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterStatus", "setBalanceParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantSetBalanceParameterStatusByUserIdResult.from_dict(response.body), null)


func set_balance_parameter_status_by_stamp_sheet(request: Gs2EnchantSetBalanceParameterStatusByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "balanceParameterStatus", "setBalanceParameterStatusByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantSetBalanceParameterStatusByStampSheetResult.from_dict(response.body), null)


func get_rarity_parameter_status(request: Gs2EnchantGetRarityParameterStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "getRarityParameterStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetRarityParameterStatusResult.from_dict(response.body), null)


func get_rarity_parameter_status_by_user_id(request: Gs2EnchantGetRarityParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "getRarityParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantGetRarityParameterStatusByUserIdResult.from_dict(response.body), null)


func delete_rarity_parameter_status_by_user_id(request: Gs2EnchantDeleteRarityParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "deleteRarityParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantDeleteRarityParameterStatusByUserIdResult.from_dict(response.body), null)


func re_draw_rarity_parameter_status_by_user_id(request: Gs2EnchantReDrawRarityParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.fixed_parameter_names != null:
        body["fixedParameterNames"] = request.fixed_parameter_names
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "reDrawRarityParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantReDrawRarityParameterStatusByUserIdResult.from_dict(response.body), null)


func re_draw_rarity_parameter_status_by_stamp_sheet(request: Gs2EnchantReDrawRarityParameterStatusByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "reDrawRarityParameterStatusByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantReDrawRarityParameterStatusByStampSheetResult.from_dict(response.body), null)


func add_rarity_parameter_status_by_user_id(request: Gs2EnchantAddRarityParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.count != null:
        body["count"] = request.count
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "addRarityParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantAddRarityParameterStatusByUserIdResult.from_dict(response.body), null)


func add_rarity_parameter_status_by_stamp_sheet(request: Gs2EnchantAddRarityParameterStatusByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "addRarityParameterStatusByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantAddRarityParameterStatusByStampSheetResult.from_dict(response.body), null)


func verify_rarity_parameter_status(request: Gs2EnchantVerifyRarityParameterStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.parameter_value_name != null:
        body["parameterValueName"] = request.parameter_value_name
    if request.parameter_count != null:
        body["parameterCount"] = request.parameter_count
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
    var response = await session.send("enchant", "rarityParameterStatus", "verifyRarityParameterStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantVerifyRarityParameterStatusResult.from_dict(response.body), null)


func verify_rarity_parameter_status_by_user_id(request: Gs2EnchantVerifyRarityParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.parameter_value_name != null:
        body["parameterValueName"] = request.parameter_value_name
    if request.parameter_count != null:
        body["parameterCount"] = request.parameter_count
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
    var response = await session.send("enchant", "rarityParameterStatus", "verifyRarityParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantVerifyRarityParameterStatusByUserIdResult.from_dict(response.body), null)


func set_rarity_parameter_status_by_user_id(request: Gs2EnchantSetRarityParameterStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.parameter_name != null:
        body["parameterName"] = request.parameter_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.parameter_values != null:
        body["parameterValues"] = request.parameter_values.map(func(v): return null if v == null else v.to_dict())
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "setRarityParameterStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantSetRarityParameterStatusByUserIdResult.from_dict(response.body), null)


func set_rarity_parameter_status_by_stamp_sheet(request: Gs2EnchantSetRarityParameterStatusByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("enchant", "rarityParameterStatus", "setRarityParameterStatusByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2EnchantSetRarityParameterStatusByStampSheetResult.from_dict(response.body), null)