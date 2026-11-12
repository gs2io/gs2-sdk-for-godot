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
class_name Gs2Ranking2
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2Ranking2RestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2Ranking2CreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2CreateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2NamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2Ranking2DumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2DumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_dump_user_data(
    request: Gs2Ranking2CheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2CheckDumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func clean_user_data(
    request: Gs2Ranking2CleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2CleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_clean_user_data(
    request: Gs2Ranking2CheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2CheckCleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_import_user_data(
    request: Gs2Ranking2PrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2PrepareImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.prepare_import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.upload_token = null if result == null else result.upload_token
    domain.upload_token = self.upload_token
    self.upload_url = null if result == null else result.upload_url
    domain.upload_url = self.upload_url
    return Gs2AsyncResult.new(domain, null)


func import_user_data(
    request: Gs2Ranking2ImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2ImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_import_user_data(
    request: Gs2Ranking2CheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Ranking2CheckImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func namespaces(
    name_prefix = null
) -> Gs2Ranking2DescribeNamespacesIterator:
    return Gs2Ranking2DescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2Namespace",
        Gs2Ranking2NamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2Namespace",
        Gs2Ranking2NamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2Namespace",
        Gs2Ranking2NamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2Ranking2NamespaceDomain:
    return Gs2Ranking2NamespaceDomain.new(
        _gs2,
        namespace_name
    )


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


static var create_global_ranking_received_reward_by_user_id_complete_callbacks: Array = []


static var create_cluster_ranking_received_reward_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "CreateGlobalRankingReceivedRewardByUserId":
        var request_model = Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in create_global_ranking_received_reward_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "CreateClusterRankingReceivedRewardByUserId":
        var request_model = Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in create_cluster_ranking_received_reward_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "VerifyGlobalRankingScoreByUserId":
        if result == null:
            return
        var request_model = Gs2Ranking2VerifyGlobalRankingScoreByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Ranking2VerifyGlobalRankingScoreByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Ranking2VerifyGlobalRankingScoreByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
    if method == "VerifyClusterRankingScoreByUserId":
        if result == null:
            return
        var request_model = Gs2Ranking2VerifyClusterRankingScoreByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Ranking2VerifyClusterRankingScoreByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Ranking2VerifyClusterRankingScoreByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
    if method == "VerifySubscribeRankingScoreByUserId":
        if result == null:
            return
        var request_model = Gs2Ranking2VerifySubscribeRankingScoreByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Ranking2VerifySubscribeRankingScoreByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Ranking2VerifySubscribeRankingScoreByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    pass