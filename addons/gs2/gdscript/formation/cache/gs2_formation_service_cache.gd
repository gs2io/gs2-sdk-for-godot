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
class_name Gs2FormationServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


# Gs2Distributor:DescribeUserData（ユーザーの全データの一括取得）の 1 エントリを、kind に対応するモデルのキャッシュへ入れる。
# 戻り値は親キー（null は知らない kind ＝ SDK が古い / 対応表に無い）。呼び手は全ページを読み終えてから
# set_list_cached(cache, time_offset, kind, parent_key) を呼ぶ。対応表は sdk-gen の type/user_data_cache.py（kind → モデル）。
static func put_user_data(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    kind: String,
    payload
):
    if kind == "form":
        var item = Gs2FormationForm.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FormationFormCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "mold":
        var item = Gs2FormationMold.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FormationMoldCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "propertyForm":
        var item = Gs2FormationPropertyForm.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FormationPropertyFormCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    return null


# 一括取得で入れた kind の親キーに「リストが揃った印」を立てる（Describe のイテレータがサーバーへ出なくなる）。
static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    if kind == "form":
        cache.set_list_cached("Gs2FormationForm", parent_key)
        return true
    if kind == "mold":
        cache.set_list_cached("Gs2FormationMold", parent_key)
        return true
    if kind == "propertyForm":
        cache.set_list_cached("Gs2FormationPropertyForm", parent_key)
        return true
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2FormationDescribeNamespacesMethodCache.put_cache(
            Gs2FormationDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2FormationCreateNamespaceMethodCache.put_cache(
            Gs2FormationCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2FormationGetNamespaceStatusMethodCache.put_cache(
            Gs2FormationGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2FormationGetNamespaceMethodCache.put_cache(
            Gs2FormationGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2FormationUpdateNamespaceMethodCache.put_cache(
            Gs2FormationUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2FormationDeleteNamespaceMethodCache.put_cache(
            Gs2FormationDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2FormationGetServiceVersionMethodCache.put_cache(
            Gs2FormationGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2FormationDumpUserDataByUserIdMethodCache.put_cache(
            Gs2FormationDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2FormationCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2FormationCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2FormationCleanUserDataByUserIdMethodCache.put_cache(
            Gs2FormationCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2FormationCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2FormationCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2FormationPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2FormationPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2FormationImportUserDataByUserIdMethodCache.put_cache(
            Gs2FormationImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2FormationCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2FormationCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFormModel":
        Gs2FormationGetFormModelMethodCache.put_cache(
            Gs2FormationGetFormModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetFormModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeFormModelMasters":
        Gs2FormationDescribeFormModelMastersMethodCache.put_cache(
            Gs2FormationDescribeFormModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeFormModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createFormModelMaster":
        Gs2FormationCreateFormModelMasterMethodCache.put_cache(
            Gs2FormationCreateFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCreateFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFormModelMaster":
        Gs2FormationGetFormModelMasterMethodCache.put_cache(
            Gs2FormationGetFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateFormModelMaster":
        Gs2FormationUpdateFormModelMasterMethodCache.put_cache(
            Gs2FormationUpdateFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationUpdateFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteFormModelMaster":
        Gs2FormationDeleteFormModelMasterMethodCache.put_cache(
            Gs2FormationDeleteFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeleteFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMoldModels":
        Gs2FormationDescribeMoldModelsMethodCache.put_cache(
            Gs2FormationDescribeMoldModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeMoldModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMoldModel":
        Gs2FormationGetMoldModelMethodCache.put_cache(
            Gs2FormationGetMoldModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetMoldModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMoldModelMasters":
        Gs2FormationDescribeMoldModelMastersMethodCache.put_cache(
            Gs2FormationDescribeMoldModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeMoldModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createMoldModelMaster":
        Gs2FormationCreateMoldModelMasterMethodCache.put_cache(
            Gs2FormationCreateMoldModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCreateMoldModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMoldModelMaster":
        Gs2FormationGetMoldModelMasterMethodCache.put_cache(
            Gs2FormationGetMoldModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetMoldModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMoldModelMaster":
        Gs2FormationUpdateMoldModelMasterMethodCache.put_cache(
            Gs2FormationUpdateMoldModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationUpdateMoldModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMoldModelMaster":
        Gs2FormationDeleteMoldModelMasterMethodCache.put_cache(
            Gs2FormationDeleteMoldModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeleteMoldModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePropertyFormModels":
        Gs2FormationDescribePropertyFormModelsMethodCache.put_cache(
            Gs2FormationDescribePropertyFormModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribePropertyFormModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPropertyFormModel":
        Gs2FormationGetPropertyFormModelMethodCache.put_cache(
            Gs2FormationGetPropertyFormModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetPropertyFormModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePropertyFormModelMasters":
        Gs2FormationDescribePropertyFormModelMastersMethodCache.put_cache(
            Gs2FormationDescribePropertyFormModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribePropertyFormModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createPropertyFormModelMaster":
        Gs2FormationCreatePropertyFormModelMasterMethodCache.put_cache(
            Gs2FormationCreatePropertyFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationCreatePropertyFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPropertyFormModelMaster":
        Gs2FormationGetPropertyFormModelMasterMethodCache.put_cache(
            Gs2FormationGetPropertyFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetPropertyFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updatePropertyFormModelMaster":
        Gs2FormationUpdatePropertyFormModelMasterMethodCache.put_cache(
            Gs2FormationUpdatePropertyFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationUpdatePropertyFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePropertyFormModelMaster":
        Gs2FormationDeletePropertyFormModelMasterMethodCache.put_cache(
            Gs2FormationDeletePropertyFormModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeletePropertyFormModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2FormationExportMasterMethodCache.put_cache(
            Gs2FormationExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentFormMaster":
        Gs2FormationGetCurrentFormMasterMethodCache.put_cache(
            Gs2FormationGetCurrentFormMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetCurrentFormMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentFormMaster":
        Gs2FormationPreUpdateCurrentFormMasterMethodCache.put_cache(
            Gs2FormationPreUpdateCurrentFormMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationPreUpdateCurrentFormMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentFormMaster":
        Gs2FormationUpdateCurrentFormMasterMethodCache.put_cache(
            Gs2FormationUpdateCurrentFormMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationUpdateCurrentFormMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentFormMasterFromGitHub":
        Gs2FormationUpdateCurrentFormMasterFromGitHubMethodCache.put_cache(
            Gs2FormationUpdateCurrentFormMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationUpdateCurrentFormMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMolds":
        Gs2FormationDescribeMoldsMethodCache.put_cache(
            Gs2FormationDescribeMoldsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeMoldsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMoldsByUserId":
        Gs2FormationDescribeMoldsByUserIdMethodCache.put_cache(
            Gs2FormationDescribeMoldsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeMoldsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMold":
        Gs2FormationGetMoldMethodCache.put_cache(
            Gs2FormationGetMoldResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetMoldRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMoldByUserId":
        Gs2FormationGetMoldByUserIdMethodCache.put_cache(
            Gs2FormationGetMoldByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetMoldByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setMoldCapacityByUserId":
        Gs2FormationSetMoldCapacityByUserIdMethodCache.put_cache(
            Gs2FormationSetMoldCapacityByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSetMoldCapacityByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addMoldCapacityByUserId":
        Gs2FormationAddMoldCapacityByUserIdMethodCache.put_cache(
            Gs2FormationAddMoldCapacityByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationAddMoldCapacityByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subMoldCapacity":
        Gs2FormationSubMoldCapacityMethodCache.put_cache(
            Gs2FormationSubMoldCapacityResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSubMoldCapacityRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subMoldCapacityByUserId":
        Gs2FormationSubMoldCapacityByUserIdMethodCache.put_cache(
            Gs2FormationSubMoldCapacityByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSubMoldCapacityByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMold":
        Gs2FormationDeleteMoldMethodCache.put_cache(
            Gs2FormationDeleteMoldResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeleteMoldRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMoldByUserId":
        Gs2FormationDeleteMoldByUserIdMethodCache.put_cache(
            Gs2FormationDeleteMoldByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeleteMoldByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeForms":
        Gs2FormationDescribeFormsMethodCache.put_cache(
            Gs2FormationDescribeFormsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeFormsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeFormsByUserId":
        Gs2FormationDescribeFormsByUserIdMethodCache.put_cache(
            Gs2FormationDescribeFormsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribeFormsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getForm":
        Gs2FormationGetFormMethodCache.put_cache(
            Gs2FormationGetFormResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetFormRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFormByUserId":
        Gs2FormationGetFormByUserIdMethodCache.put_cache(
            Gs2FormationGetFormByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetFormByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFormWithSignature":
        Gs2FormationGetFormWithSignatureMethodCache.put_cache(
            Gs2FormationGetFormWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetFormWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFormWithSignatureByUserId":
        Gs2FormationGetFormWithSignatureByUserIdMethodCache.put_cache(
            Gs2FormationGetFormWithSignatureByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetFormWithSignatureByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setForm":
        Gs2FormationSetFormMethodCache.put_cache(
            Gs2FormationSetFormResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSetFormRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setFormByUserId":
        Gs2FormationSetFormByUserIdMethodCache.put_cache(
            Gs2FormationSetFormByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSetFormByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setFormWithSignature":
        Gs2FormationSetFormWithSignatureMethodCache.put_cache(
            Gs2FormationSetFormWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSetFormWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireActionsToFormProperties":
        Gs2FormationAcquireActionsToFormPropertiesMethodCache.put_cache(
            Gs2FormationAcquireActionsToFormPropertiesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationAcquireActionsToFormPropertiesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteForm":
        Gs2FormationDeleteFormMethodCache.put_cache(
            Gs2FormationDeleteFormResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeleteFormRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteFormByUserId":
        Gs2FormationDeleteFormByUserIdMethodCache.put_cache(
            Gs2FormationDeleteFormByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeleteFormByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePropertyForms":
        Gs2FormationDescribePropertyFormsMethodCache.put_cache(
            Gs2FormationDescribePropertyFormsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribePropertyFormsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePropertyFormsByUserId":
        Gs2FormationDescribePropertyFormsByUserIdMethodCache.put_cache(
            Gs2FormationDescribePropertyFormsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDescribePropertyFormsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPropertyForm":
        Gs2FormationGetPropertyFormMethodCache.put_cache(
            Gs2FormationGetPropertyFormResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetPropertyFormRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPropertyFormByUserId":
        Gs2FormationGetPropertyFormByUserIdMethodCache.put_cache(
            Gs2FormationGetPropertyFormByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetPropertyFormByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPropertyFormWithSignature":
        Gs2FormationGetPropertyFormWithSignatureMethodCache.put_cache(
            Gs2FormationGetPropertyFormWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetPropertyFormWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPropertyFormWithSignatureByUserId":
        Gs2FormationGetPropertyFormWithSignatureByUserIdMethodCache.put_cache(
            Gs2FormationGetPropertyFormWithSignatureByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationGetPropertyFormWithSignatureByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setPropertyForm":
        Gs2FormationSetPropertyFormMethodCache.put_cache(
            Gs2FormationSetPropertyFormResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSetPropertyFormRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setPropertyFormByUserId":
        Gs2FormationSetPropertyFormByUserIdMethodCache.put_cache(
            Gs2FormationSetPropertyFormByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSetPropertyFormByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setPropertyFormWithSignature":
        Gs2FormationSetPropertyFormWithSignatureMethodCache.put_cache(
            Gs2FormationSetPropertyFormWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationSetPropertyFormWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireActionsToPropertyFormProperties":
        Gs2FormationAcquireActionsToPropertyFormPropertiesMethodCache.put_cache(
            Gs2FormationAcquireActionsToPropertyFormPropertiesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationAcquireActionsToPropertyFormPropertiesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePropertyForm":
        Gs2FormationDeletePropertyFormMethodCache.put_cache(
            Gs2FormationDeletePropertyFormResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeletePropertyFormRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePropertyFormByUserId":
        Gs2FormationDeletePropertyFormByUserIdMethodCache.put_cache(
            Gs2FormationDeletePropertyFormByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FormationDeletePropertyFormByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass