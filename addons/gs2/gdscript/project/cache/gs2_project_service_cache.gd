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
class_name Gs2ProjectServiceCache
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
    return null


# 一括取得で入れた kind の親キーに「リストが揃った印」を立てる（Describe のイテレータがサーバーへ出なくなる）。
static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "createAccount":
        Gs2ProjectCreateAccountMethodCache.put_cache(
            Gs2ProjectCreateAccountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectCreateAccountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verify":
        Gs2ProjectVerifyMethodCache.put_cache(
            Gs2ProjectVerifyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectVerifyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "signIn":
        Gs2ProjectSignInMethodCache.put_cache(
            Gs2ProjectSignInResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectSignInRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "forget":
        Gs2ProjectForgetMethodCache.put_cache(
            Gs2ProjectForgetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectForgetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "issuePassword":
        Gs2ProjectIssuePasswordMethodCache.put_cache(
            Gs2ProjectIssuePasswordResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectIssuePasswordRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateAccount":
        Gs2ProjectUpdateAccountMethodCache.put_cache(
            Gs2ProjectUpdateAccountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectUpdateAccountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "enableMfa":
        Gs2ProjectEnableMfaMethodCache.put_cache(
            Gs2ProjectEnableMfaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectEnableMfaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "challengeMfa":
        Gs2ProjectChallengeMfaMethodCache.put_cache(
            Gs2ProjectChallengeMfaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectChallengeMfaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "disableMfa":
        Gs2ProjectDisableMfaMethodCache.put_cache(
            Gs2ProjectDisableMfaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDisableMfaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteAccount":
        Gs2ProjectDeleteAccountMethodCache.put_cache(
            Gs2ProjectDeleteAccountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDeleteAccountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2ProjectGetServiceVersionMethodCache.put_cache(
            Gs2ProjectGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeProjects":
        Gs2ProjectDescribeProjectsMethodCache.put_cache(
            Gs2ProjectDescribeProjectsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeProjectsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createProject":
        Gs2ProjectCreateProjectMethodCache.put_cache(
            Gs2ProjectCreateProjectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectCreateProjectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProject":
        Gs2ProjectGetProjectMethodCache.put_cache(
            Gs2ProjectGetProjectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetProjectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProjectToken":
        Gs2ProjectGetProjectTokenMethodCache.put_cache(
            Gs2ProjectGetProjectTokenResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetProjectTokenRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProjectTokenByIdentifier":
        Gs2ProjectGetProjectTokenByIdentifierMethodCache.put_cache(
            Gs2ProjectGetProjectTokenByIdentifierResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetProjectTokenByIdentifierRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateProject":
        Gs2ProjectUpdateProjectMethodCache.put_cache(
            Gs2ProjectUpdateProjectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectUpdateProjectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "activateRegion":
        Gs2ProjectActivateRegionMethodCache.put_cache(
            Gs2ProjectActivateRegionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectActivateRegionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "waitActivateRegion":
        Gs2ProjectWaitActivateRegionMethodCache.put_cache(
            Gs2ProjectWaitActivateRegionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectWaitActivateRegionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteProject":
        Gs2ProjectDeleteProjectMethodCache.put_cache(
            Gs2ProjectDeleteProjectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDeleteProjectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBillingMethods":
        Gs2ProjectDescribeBillingMethodsMethodCache.put_cache(
            Gs2ProjectDescribeBillingMethodsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeBillingMethodsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createBillingMethod":
        Gs2ProjectCreateBillingMethodMethodCache.put_cache(
            Gs2ProjectCreateBillingMethodResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectCreateBillingMethodRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBillingMethod":
        Gs2ProjectGetBillingMethodMethodCache.put_cache(
            Gs2ProjectGetBillingMethodResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetBillingMethodRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateBillingMethod":
        Gs2ProjectUpdateBillingMethodMethodCache.put_cache(
            Gs2ProjectUpdateBillingMethodResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectUpdateBillingMethodRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBillingMethod":
        Gs2ProjectDeleteBillingMethodMethodCache.put_cache(
            Gs2ProjectDeleteBillingMethodResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDeleteBillingMethodRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceipts":
        Gs2ProjectDescribeReceiptsMethodCache.put_cache(
            Gs2ProjectDescribeReceiptsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeReceiptsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBillings":
        Gs2ProjectDescribeBillingsMethodCache.put_cache(
            Gs2ProjectDescribeBillingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeBillingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBillings":
        Gs2ProjectGetBillingsMethodCache.put_cache(
            Gs2ProjectGetBillingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetBillingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDumpProgresses":
        Gs2ProjectDescribeDumpProgressesMethodCache.put_cache(
            Gs2ProjectDescribeDumpProgressesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeDumpProgressesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDumpProgress":
        Gs2ProjectGetDumpProgressMethodCache.put_cache(
            Gs2ProjectGetDumpProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetDumpProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "waitDumpUserData":
        Gs2ProjectWaitDumpUserDataMethodCache.put_cache(
            Gs2ProjectWaitDumpUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectWaitDumpUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "archiveDumpUserData":
        Gs2ProjectArchiveDumpUserDataMethodCache.put_cache(
            Gs2ProjectArchiveDumpUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectArchiveDumpUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserData":
        Gs2ProjectDumpUserDataMethodCache.put_cache(
            Gs2ProjectDumpUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDumpUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDumpUserData":
        Gs2ProjectGetDumpUserDataMethodCache.put_cache(
            Gs2ProjectGetDumpUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetDumpUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCleanProgresses":
        Gs2ProjectDescribeCleanProgressesMethodCache.put_cache(
            Gs2ProjectDescribeCleanProgressesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeCleanProgressesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCleanProgress":
        Gs2ProjectGetCleanProgressMethodCache.put_cache(
            Gs2ProjectGetCleanProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetCleanProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "waitCleanUserData":
        Gs2ProjectWaitCleanUserDataMethodCache.put_cache(
            Gs2ProjectWaitCleanUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectWaitCleanUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserData":
        Gs2ProjectCleanUserDataMethodCache.put_cache(
            Gs2ProjectCleanUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectCleanUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeImportProgresses":
        Gs2ProjectDescribeImportProgressesMethodCache.put_cache(
            Gs2ProjectDescribeImportProgressesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeImportProgressesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getImportProgress":
        Gs2ProjectGetImportProgressMethodCache.put_cache(
            Gs2ProjectGetImportProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetImportProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "waitImportUserData":
        Gs2ProjectWaitImportUserDataMethodCache.put_cache(
            Gs2ProjectWaitImportUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectWaitImportUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserData":
        Gs2ProjectPrepareImportUserDataMethodCache.put_cache(
            Gs2ProjectPrepareImportUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectPrepareImportUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserData":
        Gs2ProjectImportUserDataMethodCache.put_cache(
            Gs2ProjectImportUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectImportUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeImportErrorLogs":
        Gs2ProjectDescribeImportErrorLogsMethodCache.put_cache(
            Gs2ProjectDescribeImportErrorLogsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectDescribeImportErrorLogsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getImportErrorLog":
        Gs2ProjectGetImportErrorLogMethodCache.put_cache(
            Gs2ProjectGetImportErrorLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ProjectGetImportErrorLogRequest.from_dict(_parse(request_payload))
        )
        return
    pass