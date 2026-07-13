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
# deny overwrite
class_name Gs2BuffBuffAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2BuffRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
# diff +++ start
var buff_entry_models: Variant = null
var new_context_stack: Variant = null
# diff +++ end


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2BuffRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func apply(
    request: Gs2BuffApplyBuffRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2BuffApplyBuffMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.apply_buff(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    # diff +++ start
    # C# deny は BuffEntryModels をドメインに保持し、newContextStack を持つ新しい Gs2 を返す。
    # GDScript では既存の gs2 のデフォルトコンテキストスタックを更新し、キャッシュをリセットすることで
    # 「新しい Gs2 (空キャッシュ + newContextStack)」に相当する状態へ切り替える。
    buff_entry_models = null if result == null else result.items
    new_context_stack = null if result == null else result.new_context_stack
    _gs2.default_context_stack = new_context_stack
    _gs2.clear_cache()
    # diff +++ end
    return Gs2AsyncResult.new(null if result == null else result.items, null)