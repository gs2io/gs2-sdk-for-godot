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
class_name Gs2Money2WebSocketClient
extends Gs2AbstractWebSocketClient


func get_namespace_status(request: Gs2Money2GetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetNamespaceStatusResult.from_dict(response.body), null)


func get_service_version(request: Gs2Money2GetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2Money2DumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2DumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2Money2CheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2CheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2Money2CleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2CleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2Money2CheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2CheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2Money2PrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2PrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2Money2ImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("money2", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2ImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2Money2CheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("money2", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2CheckImportUserDataByUserIdResult.from_dict(response.body), null)


func get_wallet(request: Gs2Money2GetWalletRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.slot != null:
        body["slot"] = request.slot
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "wallet", "getWallet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetWalletResult.from_dict(response.body), null)


func get_wallet_by_user_id(request: Gs2Money2GetWalletByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.slot != null:
        body["slot"] = request.slot
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "wallet", "getWalletByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetWalletByUserIdResult.from_dict(response.body), null)


func deposit_by_user_id(request: Gs2Money2DepositByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.slot != null:
        body["slot"] = request.slot
    if request.deposit_transactions != null:
        body["depositTransactions"] = request.deposit_transactions.map(func(v): return null if v == null else v.to_dict())
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "wallet", "depositByUserId", body)
    if response.error != null:
        if response.error.has_error_code("wallet.operation.conflict"):
            return Gs2AsyncResult.new(null, Gs2Money2ConflictException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2DepositByUserIdResult.from_dict(response.body), null)


func deposit_by_stamp_sheet(request: Gs2Money2DepositByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "wallet", "depositByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2DepositByStampSheetResult.from_dict(response.body), null)


func get_refund_history(request: Gs2Money2GetRefundHistoryRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "refundHistory", "getRefundHistory", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetRefundHistoryResult.from_dict(response.body), null)


func get_store_content_model(request: Gs2Money2GetStoreContentModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeContentModel", "getStoreContentModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetStoreContentModelResult.from_dict(response.body), null)


func create_store_content_model_master(request: Gs2Money2CreateStoreContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.apple_app_store != null:
        body["appleAppStore"] = request.apple_app_store.to_dict()
    if request.google_play != null:
        body["googlePlay"] = request.google_play.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeContentModelMaster", "createStoreContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2CreateStoreContentModelMasterResult.from_dict(response.body), null)


func get_store_content_model_master(request: Gs2Money2GetStoreContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeContentModelMaster", "getStoreContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetStoreContentModelMasterResult.from_dict(response.body), null)


func update_store_content_model_master(request: Gs2Money2UpdateStoreContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.apple_app_store != null:
        body["appleAppStore"] = request.apple_app_store.to_dict()
    if request.google_play != null:
        body["googlePlay"] = request.google_play.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeContentModelMaster", "updateStoreContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2UpdateStoreContentModelMasterResult.from_dict(response.body), null)


func delete_store_content_model_master(request: Gs2Money2DeleteStoreContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeContentModelMaster", "deleteStoreContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2DeleteStoreContentModelMasterResult.from_dict(response.body), null)


func get_store_subscription_content_model(request: Gs2Money2GetStoreSubscriptionContentModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeSubscriptionContentModel", "getStoreSubscriptionContentModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetStoreSubscriptionContentModelResult.from_dict(response.body), null)


func create_store_subscription_content_model_master(request: Gs2Money2CreateStoreSubscriptionContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.schedule_namespace_id != null:
        body["scheduleNamespaceId"] = request.schedule_namespace_id
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.trigger_extend_mode != null:
        body["triggerExtendMode"] = request.trigger_extend_mode
    if request.rollup_hour != null:
        body["rollupHour"] = request.rollup_hour
    if request.reallocate_span_days != null:
        body["reallocateSpanDays"] = request.reallocate_span_days
    if request.apple_app_store != null:
        body["appleAppStore"] = request.apple_app_store.to_dict()
    if request.google_play != null:
        body["googlePlay"] = request.google_play.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeSubscriptionContentModelMaster", "createStoreSubscriptionContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2CreateStoreSubscriptionContentModelMasterResult.from_dict(response.body), null)


func get_store_subscription_content_model_master(request: Gs2Money2GetStoreSubscriptionContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeSubscriptionContentModelMaster", "getStoreSubscriptionContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetStoreSubscriptionContentModelMasterResult.from_dict(response.body), null)


func update_store_subscription_content_model_master(request: Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.schedule_namespace_id != null:
        body["scheduleNamespaceId"] = request.schedule_namespace_id
    if request.trigger_name != null:
        body["triggerName"] = request.trigger_name
    if request.trigger_extend_mode != null:
        body["triggerExtendMode"] = request.trigger_extend_mode
    if request.rollup_hour != null:
        body["rollupHour"] = request.rollup_hour
    if request.reallocate_span_days != null:
        body["reallocateSpanDays"] = request.reallocate_span_days
    if request.apple_app_store != null:
        body["appleAppStore"] = request.apple_app_store.to_dict()
    if request.google_play != null:
        body["googlePlay"] = request.google_play.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeSubscriptionContentModelMaster", "updateStoreSubscriptionContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2UpdateStoreSubscriptionContentModelMasterResult.from_dict(response.body), null)


func delete_store_subscription_content_model_master(request: Gs2Money2DeleteStoreSubscriptionContentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.content_name != null:
        body["contentName"] = request.content_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "storeSubscriptionContentModelMaster", "deleteStoreSubscriptionContentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2DeleteStoreSubscriptionContentModelMasterResult.from_dict(response.body), null)


func pre_update_current_model_master(request: Gs2Money2PreUpdateCurrentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "currentModelMaster", "preUpdateCurrentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2PreUpdateCurrentModelMasterResult.from_dict(response.body), null)


func get_daily_transaction_history(request: Gs2Money2GetDailyTransactionHistoryRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.year != null:
        body["year"] = request.year
    if request.month != null:
        body["month"] = request.month
    if request.day != null:
        body["day"] = request.day
    if request.currency != null:
        body["currency"] = request.currency
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "dailyTransactionHistory", "getDailyTransactionHistory", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetDailyTransactionHistoryResult.from_dict(response.body), null)


func get_unused_balance(request: Gs2Money2GetUnusedBalanceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.currency != null:
        body["currency"] = request.currency
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("money2", "unusedBalance", "getUnusedBalance", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Money2GetUnusedBalanceResult.from_dict(response.body), null)