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
class_name Gs2MegaFieldWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2MegaFieldCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2MegaFieldGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2MegaFieldGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2MegaFieldUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2MegaFieldDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2MegaFieldGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldGetServiceVersionResult.from_dict(response.body), null)


func create_area_model_master(request: Gs2MegaFieldCreateAreaModelMasterRequest) -> Gs2AsyncResult:
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
    var response = await session.send("megaField", "areaModelMaster", "createAreaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldCreateAreaModelMasterResult.from_dict(response.body), null)


func get_area_model_master(request: Gs2MegaFieldGetAreaModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "areaModelMaster", "getAreaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldGetAreaModelMasterResult.from_dict(response.body), null)


func update_area_model_master(request: Gs2MegaFieldUpdateAreaModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "areaModelMaster", "updateAreaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldUpdateAreaModelMasterResult.from_dict(response.body), null)


func delete_area_model_master(request: Gs2MegaFieldDeleteAreaModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "areaModelMaster", "deleteAreaModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldDeleteAreaModelMasterResult.from_dict(response.body), null)


func get_layer_model(request: Gs2MegaFieldGetLayerModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "layerModel", "getLayerModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldGetLayerModelResult.from_dict(response.body), null)


func create_layer_model_master(request: Gs2MegaFieldCreateLayerModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
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
    var response = await session.send("megaField", "layerModelMaster", "createLayerModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldCreateLayerModelMasterResult.from_dict(response.body), null)


func get_layer_model_master(request: Gs2MegaFieldGetLayerModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "layerModelMaster", "getLayerModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldGetLayerModelMasterResult.from_dict(response.body), null)


func update_layer_model_master(request: Gs2MegaFieldUpdateLayerModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "layerModelMaster", "updateLayerModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldUpdateLayerModelMasterResult.from_dict(response.body), null)


func delete_layer_model_master(request: Gs2MegaFieldDeleteLayerModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "layerModelMaster", "deleteLayerModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldDeleteLayerModelMasterResult.from_dict(response.body), null)


func pre_update_current_field_master(request: Gs2MegaFieldPreUpdateCurrentFieldMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "currentFieldMaster", "preUpdateCurrentFieldMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldPreUpdateCurrentFieldMasterResult.from_dict(response.body), null)


func put_position(request: Gs2MegaFieldPutPositionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.position != null:
        body["position"] = request.position.to_dict()
    if request.vector != null:
        body["vector"] = request.vector.to_dict()
    if request.r != null:
        body["r"] = request.r
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "spatial", "putPosition", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldPutPositionResult.from_dict(response.body), null)


func put_position_by_user_id(request: Gs2MegaFieldPutPositionByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.position != null:
        body["position"] = request.position.to_dict()
    if request.vector != null:
        body["vector"] = request.vector.to_dict()
    if request.r != null:
        body["r"] = request.r
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "spatial", "putPositionByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldPutPositionByUserIdResult.from_dict(response.body), null)


func near_user_ids(request: Gs2MegaFieldNearUserIdsRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.point != null:
        body["point"] = request.point.to_dict()
    if request.r != null:
        body["r"] = request.r
    if request.limit != null:
        body["limit"] = request.limit
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "spatial", "nearUserIds", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldNearUserIdsResult.from_dict(response.body), null)


func near_user_ids_from_system(request: Gs2MegaFieldNearUserIdsFromSystemRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.area_model_name != null:
        body["areaModelName"] = request.area_model_name
    if request.layer_model_name != null:
        body["layerModelName"] = request.layer_model_name
    if request.point != null:
        body["point"] = request.point.to_dict()
    if request.r != null:
        body["r"] = request.r
    if request.limit != null:
        body["limit"] = request.limit
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("megaField", "spatial", "nearUserIdsFromSystem", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MegaFieldNearUserIdsFromSystemResult.from_dict(response.body), null)