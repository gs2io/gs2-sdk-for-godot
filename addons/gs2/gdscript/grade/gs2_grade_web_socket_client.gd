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
class_name Gs2GradeWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2GradeCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.change_grade_script != null:
        body["changeGradeScript"] = request.change_grade_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2GradeGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2GradeGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2GradeUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.change_grade_script != null:
        body["changeGradeScript"] = request.change_grade_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2GradeDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2GradeGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2GradeDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2GradeCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2GradeCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2GradeCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2GradePrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradePrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2GradeImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("grade", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2GradeCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("grade", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func get_status(request: Gs2GradeGetStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "getStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeGetStatusResult.from_dict(response.body), null)


func get_status_by_user_id(request: Gs2GradeGetStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "getStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeGetStatusByUserIdResult.from_dict(response.body), null)


func add_grade_by_user_id(request: Gs2GradeAddGradeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.grade_value != null:
        body["gradeValue"] = request.grade_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "addGradeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeAddGradeByUserIdResult.from_dict(response.body), null)


func sub_grade(request: Gs2GradeSubGradeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.grade_value != null:
        body["gradeValue"] = request.grade_value
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "subGrade", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeSubGradeResult.from_dict(response.body), null)


func sub_grade_by_user_id(request: Gs2GradeSubGradeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.grade_value != null:
        body["gradeValue"] = request.grade_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "subGradeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeSubGradeByUserIdResult.from_dict(response.body), null)


func set_grade_by_user_id(request: Gs2GradeSetGradeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.grade_value != null:
        body["gradeValue"] = request.grade_value
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "setGradeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeSetGradeByUserIdResult.from_dict(response.body), null)


func apply_rank_cap(request: Gs2GradeApplyRankCapRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "applyRankCap", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeApplyRankCapResult.from_dict(response.body), null)


func apply_rank_cap_by_user_id(request: Gs2GradeApplyRankCapByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
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
    var response = await session.send("grade", "status", "applyRankCapByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeApplyRankCapByUserIdResult.from_dict(response.body), null)


func delete_status_by_user_id(request: Gs2GradeDeleteStatusByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
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
    var response = await session.send("grade", "status", "deleteStatusByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeDeleteStatusByUserIdResult.from_dict(response.body), null)


func verify_grade(request: Gs2GradeVerifyGradeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.grade_value != null:
        body["gradeValue"] = request.grade_value
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
    var response = await session.send("grade", "status", "verifyGrade", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeVerifyGradeResult.from_dict(response.body), null)


func verify_grade_by_user_id(request: Gs2GradeVerifyGradeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.grade_value != null:
        body["gradeValue"] = request.grade_value
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
    var response = await session.send("grade", "status", "verifyGradeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeVerifyGradeByUserIdResult.from_dict(response.body), null)


func verify_grade_up_material(request: Gs2GradeVerifyGradeUpMaterialRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.material_property_id != null:
        body["materialPropertyId"] = request.material_property_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "verifyGradeUpMaterial", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeVerifyGradeUpMaterialResult.from_dict(response.body), null)


func verify_grade_up_material_by_user_id(request: Gs2GradeVerifyGradeUpMaterialByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.grade_name != null:
        body["gradeName"] = request.grade_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.property_id != null:
        body["propertyId"] = request.property_id
    if request.material_property_id != null:
        body["materialPropertyId"] = request.material_property_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "verifyGradeUpMaterialByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeVerifyGradeUpMaterialByUserIdResult.from_dict(response.body), null)


func add_grade_by_stamp_sheet(request: Gs2GradeAddGradeByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "addGradeByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeAddGradeByStampSheetResult.from_dict(response.body), null)


func apply_rank_cap_by_stamp_sheet(request: Gs2GradeApplyRankCapByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "status", "applyRankCapByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradeApplyRankCapByStampSheetResult.from_dict(response.body), null)


func pre_update_current_grade_master(request: Gs2GradePreUpdateCurrentGradeMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("grade", "currentGradeMaster", "preUpdateCurrentGradeMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GradePreUpdateCurrentGradeMasterResult.from_dict(response.body), null)