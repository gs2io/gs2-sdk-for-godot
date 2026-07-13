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
class_name Gs2InventoryWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2InventoryCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.acquire_script != null:
        body["acquireScript"] = request.acquire_script.to_dict()
    if request.overflow_script != null:
        body["overflowScript"] = request.overflow_script.to_dict()
    if request.consume_script != null:
        body["consumeScript"] = request.consume_script.to_dict()
    if request.simple_item_acquire_script != null:
        body["simpleItemAcquireScript"] = request.simple_item_acquire_script.to_dict()
    if request.simple_item_consume_script != null:
        body["simpleItemConsumeScript"] = request.simple_item_consume_script.to_dict()
    if request.big_item_acquire_script != null:
        body["bigItemAcquireScript"] = request.big_item_acquire_script.to_dict()
    if request.big_item_consume_script != null:
        body["bigItemConsumeScript"] = request.big_item_consume_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2InventoryGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2InventoryGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2InventoryUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.acquire_script != null:
        body["acquireScript"] = request.acquire_script.to_dict()
    if request.overflow_script != null:
        body["overflowScript"] = request.overflow_script.to_dict()
    if request.consume_script != null:
        body["consumeScript"] = request.consume_script.to_dict()
    if request.simple_item_acquire_script != null:
        body["simpleItemAcquireScript"] = request.simple_item_acquire_script.to_dict()
    if request.simple_item_consume_script != null:
        body["simpleItemConsumeScript"] = request.simple_item_consume_script.to_dict()
    if request.big_item_acquire_script != null:
        body["bigItemAcquireScript"] = request.big_item_acquire_script.to_dict()
    if request.big_item_consume_script != null:
        body["bigItemConsumeScript"] = request.big_item_consume_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2InventoryDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2InventoryGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2InventoryDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2InventoryCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2InventoryCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2InventoryCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2InventoryPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2InventoryImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("inventory", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2InventoryCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("inventory", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func create_inventory_model_master(request: Gs2InventoryCreateInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.initial_capacity != null:
        body["initialCapacity"] = request.initial_capacity
    if request.max_capacity != null:
        body["maxCapacity"] = request.max_capacity
    if request.protect_referenced_item != null:
        body["protectReferencedItem"] = request.protect_referenced_item
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventoryModelMaster", "createInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCreateInventoryModelMasterResult.from_dict(response.body), null)


func get_inventory_model_master(request: Gs2InventoryGetInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventoryModelMaster", "getInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetInventoryModelMasterResult.from_dict(response.body), null)


func update_inventory_model_master(request: Gs2InventoryUpdateInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.initial_capacity != null:
        body["initialCapacity"] = request.initial_capacity
    if request.max_capacity != null:
        body["maxCapacity"] = request.max_capacity
    if request.protect_referenced_item != null:
        body["protectReferencedItem"] = request.protect_referenced_item
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventoryModelMaster", "updateInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryUpdateInventoryModelMasterResult.from_dict(response.body), null)


func delete_inventory_model_master(request: Gs2InventoryDeleteInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventoryModelMaster", "deleteInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteInventoryModelMasterResult.from_dict(response.body), null)


func create_item_model_master(request: Gs2InventoryCreateItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.stacking_limit != null:
        body["stackingLimit"] = request.stacking_limit
    if request.allow_multiple_stacks != null:
        body["allowMultipleStacks"] = request.allow_multiple_stacks
    if request.sort_value != null:
        body["sortValue"] = request.sort_value
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "itemModelMaster", "createItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCreateItemModelMasterResult.from_dict(response.body), null)


func get_item_model_master(request: Gs2InventoryGetItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "itemModelMaster", "getItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetItemModelMasterResult.from_dict(response.body), null)


func update_item_model_master(request: Gs2InventoryUpdateItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.stacking_limit != null:
        body["stackingLimit"] = request.stacking_limit
    if request.allow_multiple_stacks != null:
        body["allowMultipleStacks"] = request.allow_multiple_stacks
    if request.sort_value != null:
        body["sortValue"] = request.sort_value
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "itemModelMaster", "updateItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryUpdateItemModelMasterResult.from_dict(response.body), null)


func delete_item_model_master(request: Gs2InventoryDeleteItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "itemModelMaster", "deleteItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteItemModelMasterResult.from_dict(response.body), null)


func get_item_model(request: Gs2InventoryGetItemModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "itemModel", "getItemModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetItemModelResult.from_dict(response.body), null)


func create_simple_inventory_model_master(request: Gs2InventoryCreateSimpleInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleInventoryModelMaster", "createSimpleInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCreateSimpleInventoryModelMasterResult.from_dict(response.body), null)


func get_simple_inventory_model_master(request: Gs2InventoryGetSimpleInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleInventoryModelMaster", "getSimpleInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetSimpleInventoryModelMasterResult.from_dict(response.body), null)


func update_simple_inventory_model_master(request: Gs2InventoryUpdateSimpleInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleInventoryModelMaster", "updateSimpleInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryUpdateSimpleInventoryModelMasterResult.from_dict(response.body), null)


func delete_simple_inventory_model_master(request: Gs2InventoryDeleteSimpleInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleInventoryModelMaster", "deleteSimpleInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteSimpleInventoryModelMasterResult.from_dict(response.body), null)


func create_simple_item_model_master(request: Gs2InventoryCreateSimpleItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleItemModelMaster", "createSimpleItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCreateSimpleItemModelMasterResult.from_dict(response.body), null)


func get_simple_item_model_master(request: Gs2InventoryGetSimpleItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleItemModelMaster", "getSimpleItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetSimpleItemModelMasterResult.from_dict(response.body), null)


func update_simple_item_model_master(request: Gs2InventoryUpdateSimpleItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleItemModelMaster", "updateSimpleItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryUpdateSimpleItemModelMasterResult.from_dict(response.body), null)


func delete_simple_item_model_master(request: Gs2InventoryDeleteSimpleItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleItemModelMaster", "deleteSimpleItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteSimpleItemModelMasterResult.from_dict(response.body), null)


func get_simple_item_model(request: Gs2InventoryGetSimpleItemModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleItemModel", "getSimpleItemModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetSimpleItemModelResult.from_dict(response.body), null)


func create_big_inventory_model_master(request: Gs2InventoryCreateBigInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigInventoryModelMaster", "createBigInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCreateBigInventoryModelMasterResult.from_dict(response.body), null)


func get_big_inventory_model_master(request: Gs2InventoryGetBigInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigInventoryModelMaster", "getBigInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetBigInventoryModelMasterResult.from_dict(response.body), null)


func update_big_inventory_model_master(request: Gs2InventoryUpdateBigInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigInventoryModelMaster", "updateBigInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryUpdateBigInventoryModelMasterResult.from_dict(response.body), null)


func delete_big_inventory_model_master(request: Gs2InventoryDeleteBigInventoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigInventoryModelMaster", "deleteBigInventoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteBigInventoryModelMasterResult.from_dict(response.body), null)


func create_big_item_model_master(request: Gs2InventoryCreateBigItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItemModelMaster", "createBigItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryCreateBigItemModelMasterResult.from_dict(response.body), null)


func get_big_item_model_master(request: Gs2InventoryGetBigItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItemModelMaster", "getBigItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetBigItemModelMasterResult.from_dict(response.body), null)


func update_big_item_model_master(request: Gs2InventoryUpdateBigItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItemModelMaster", "updateBigItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryUpdateBigItemModelMasterResult.from_dict(response.body), null)


func delete_big_item_model_master(request: Gs2InventoryDeleteBigItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItemModelMaster", "deleteBigItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteBigItemModelMasterResult.from_dict(response.body), null)


func get_big_item_model(request: Gs2InventoryGetBigItemModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItemModel", "getBigItemModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetBigItemModelResult.from_dict(response.body), null)


func pre_update_current_item_model_master(request: Gs2InventoryPreUpdateCurrentItemModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "currentItemModelMaster", "preUpdateCurrentItemModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryPreUpdateCurrentItemModelMasterResult.from_dict(response.body), null)


func get_inventory(request: Gs2InventoryGetInventoryRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventory", "getInventory", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetInventoryResult.from_dict(response.body), null)


func get_inventory_by_user_id(request: Gs2InventoryGetInventoryByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventory", "getInventoryByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetInventoryByUserIdResult.from_dict(response.body), null)


func add_capacity_by_user_id(request: Gs2InventoryAddCapacityByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.add_capacity_value != null:
        body["addCapacityValue"] = request.add_capacity_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventory", "addCapacityByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryAddCapacityByUserIdResult.from_dict(response.body), null)


func set_capacity_by_user_id(request: Gs2InventorySetCapacityByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.new_capacity_value != null:
        body["newCapacityValue"] = request.new_capacity_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventory", "setCapacityByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventorySetCapacityByUserIdResult.from_dict(response.body), null)


func delete_inventory_by_user_id(request: Gs2InventoryDeleteInventoryByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
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
    var response = await session.send("inventory", "inventory", "deleteInventoryByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteInventoryByUserIdResult.from_dict(response.body), null)


func verify_inventory_current_max_capacity(request: Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.current_inventory_max_capacity != null:
        body["currentInventoryMaxCapacity"] = request.current_inventory_max_capacity
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
    var response = await session.send("inventory", "inventory", "verifyInventoryCurrentMaxCapacity", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifyInventoryCurrentMaxCapacityResult.from_dict(response.body), null)


func verify_inventory_current_max_capacity_by_user_id(request: Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.current_inventory_max_capacity != null:
        body["currentInventoryMaxCapacity"] = request.current_inventory_max_capacity
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
    var response = await session.send("inventory", "inventory", "verifyInventoryCurrentMaxCapacityByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdResult.from_dict(response.body), null)


func add_capacity_by_stamp_sheet(request: Gs2InventoryAddCapacityByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventory", "addCapacityByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryAddCapacityByStampSheetResult.from_dict(response.body), null)


func set_capacity_by_stamp_sheet(request: Gs2InventorySetCapacityByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "inventory", "setCapacityByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventorySetCapacityByStampSheetResult.from_dict(response.body), null)


func get_reference_of(request: Gs2InventoryGetReferenceOfRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "getReferenceOf", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetReferenceOfResult.from_dict(response.body), null)


func get_reference_of_by_user_id(request: Gs2InventoryGetReferenceOfByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "getReferenceOfByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetReferenceOfByUserIdResult.from_dict(response.body), null)


func verify_reference_of(request: Gs2InventoryVerifyReferenceOfRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
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
    var response = await session.send("inventory", "referenceOf", "verifyReferenceOf", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifyReferenceOfResult.from_dict(response.body), null)


func verify_reference_of_by_user_id(request: Gs2InventoryVerifyReferenceOfByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
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
    var response = await session.send("inventory", "referenceOf", "verifyReferenceOfByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifyReferenceOfByUserIdResult.from_dict(response.body), null)


func add_reference_of(request: Gs2InventoryAddReferenceOfRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "addReferenceOf", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryAddReferenceOfResult.from_dict(response.body), null)


func add_reference_of_by_user_id(request: Gs2InventoryAddReferenceOfByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "addReferenceOfByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryAddReferenceOfByUserIdResult.from_dict(response.body), null)


func delete_reference_of(request: Gs2InventoryDeleteReferenceOfRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "deleteReferenceOf", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteReferenceOfResult.from_dict(response.body), null)


func delete_reference_of_by_user_id(request: Gs2InventoryDeleteReferenceOfByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.item_set_name != null:
        body["itemSetName"] = request.item_set_name
    if request.reference_of != null:
        body["referenceOf"] = request.reference_of
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "deleteReferenceOfByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteReferenceOfByUserIdResult.from_dict(response.body), null)


func add_reference_of_item_set_by_stamp_sheet(request: Gs2InventoryAddReferenceOfItemSetByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "addReferenceOfItemSetByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryAddReferenceOfItemSetByStampSheetResult.from_dict(response.body), null)


func delete_reference_of_item_set_by_stamp_sheet(request: Gs2InventoryDeleteReferenceOfItemSetByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "referenceOf", "deleteReferenceOfItemSetByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteReferenceOfItemSetByStampSheetResult.from_dict(response.body), null)


func get_simple_item(request: Gs2InventoryGetSimpleItemRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleItem", "getSimpleItem", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetSimpleItemResult.from_dict(response.body), null)


func get_simple_item_by_user_id(request: Gs2InventoryGetSimpleItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "simpleItem", "getSimpleItemByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetSimpleItemByUserIdResult.from_dict(response.body), null)


func delete_simple_items_by_user_id(request: Gs2InventoryDeleteSimpleItemsByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
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
    var response = await session.send("inventory", "simpleItem", "deleteSimpleItemsByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteSimpleItemsByUserIdResult.from_dict(response.body), null)


func verify_simple_item(request: Gs2InventoryVerifySimpleItemRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.count != null:
        body["count"] = request.count
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
    var response = await session.send("inventory", "simpleItem", "verifySimpleItem", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifySimpleItemResult.from_dict(response.body), null)


func verify_simple_item_by_user_id(request: Gs2InventoryVerifySimpleItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.count != null:
        body["count"] = request.count
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
    var response = await session.send("inventory", "simpleItem", "verifySimpleItemByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifySimpleItemByUserIdResult.from_dict(response.body), null)


func get_big_item(request: Gs2InventoryGetBigItemRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "getBigItem", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetBigItemResult.from_dict(response.body), null)


func get_big_item_by_user_id(request: Gs2InventoryGetBigItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "getBigItemByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryGetBigItemByUserIdResult.from_dict(response.body), null)


func acquire_big_item_by_user_id(request: Gs2InventoryAcquireBigItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.acquire_count != null:
        body["acquireCount"] = request.acquire_count
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "acquireBigItemByUserId", body)
    if response.error != null:
        if response.error.has_error_code("itemSet.operation.conflict"):
            return Gs2AsyncResult.new(null, Gs2InventoryConflictException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryAcquireBigItemByUserIdResult.from_dict(response.body), null)


func consume_big_item(request: Gs2InventoryConsumeBigItemRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.consume_count != null:
        body["consumeCount"] = request.consume_count
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "consumeBigItem", body)
    if response.error != null:
        if response.error.has_error_code("itemSet.operation.conflict"):
            return Gs2AsyncResult.new(null, Gs2InventoryConflictException.new(response.error))
        if response.error.has_error_code("itemSet.count.insufficient"):
            return Gs2AsyncResult.new(null, Gs2InventoryInsufficientException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryConsumeBigItemResult.from_dict(response.body), null)


func consume_big_item_by_user_id(request: Gs2InventoryConsumeBigItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.consume_count != null:
        body["consumeCount"] = request.consume_count
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "consumeBigItemByUserId", body)
    if response.error != null:
        if response.error.has_error_code("itemSet.operation.conflict"):
            return Gs2AsyncResult.new(null, Gs2InventoryConflictException.new(response.error))
        if response.error.has_error_code("itemSet.count.insufficient"):
            return Gs2AsyncResult.new(null, Gs2InventoryInsufficientException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryConsumeBigItemByUserIdResult.from_dict(response.body), null)


func set_big_item_by_user_id(request: Gs2InventorySetBigItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
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
    var response = await session.send("inventory", "bigItem", "setBigItemByUserId", body)
    if response.error != null:
        if response.error.has_error_code("itemSet.operation.conflict"):
            return Gs2AsyncResult.new(null, Gs2InventoryConflictException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventorySetBigItemByUserIdResult.from_dict(response.body), null)


func delete_big_item_by_user_id(request: Gs2InventoryDeleteBigItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "deleteBigItemByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryDeleteBigItemByUserIdResult.from_dict(response.body), null)


func verify_big_item(request: Gs2InventoryVerifyBigItemRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.count != null:
        body["count"] = request.count
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
    var response = await session.send("inventory", "bigItem", "verifyBigItem", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifyBigItemResult.from_dict(response.body), null)


func verify_big_item_by_user_id(request: Gs2InventoryVerifyBigItemByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.inventory_name != null:
        body["inventoryName"] = request.inventory_name
    if request.item_name != null:
        body["itemName"] = request.item_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.count != null:
        body["count"] = request.count
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
    var response = await session.send("inventory", "bigItem", "verifyBigItemByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryVerifyBigItemByUserIdResult.from_dict(response.body), null)


func acquire_big_item_by_stamp_sheet(request: Gs2InventoryAcquireBigItemByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "acquireBigItemByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventoryAcquireBigItemByStampSheetResult.from_dict(response.body), null)


func set_big_item_by_stamp_sheet(request: Gs2InventorySetBigItemByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inventory", "bigItem", "setBigItemByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InventorySetBigItemByStampSheetResult.from_dict(response.body), null)