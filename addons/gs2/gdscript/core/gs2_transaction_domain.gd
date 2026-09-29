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

class_name Gs2TransactionDomain
extends RefCounted


var gs2: Gs2Domain
var access_token: Gs2AuthAccessToken
var transaction_id: Variant = null
var job_name: Variant = null
var actions: Array = []
var _user_id: Variant = null
var user_id: Variant:
    get:
        return _user_id if access_token == null else access_token.user_id


func _init(
    gs2_: Gs2Domain,
    access_token_: Gs2AuthAccessToken,
    user_id_: Variant,
    actions_: Variant = null
):
    gs2 = gs2_
    access_token = access_token_
    _user_id = user_id_
    actions = actions_ if actions_ != null else []


func _time_offset():
    return access_token.time_offset if access_token != null else null


func _dispatch() -> Gs2AsyncResult:
    if access_token != null:
        return await gs2.dispatch(access_token)
    return await gs2.dispatch_by_user_id(_user_id)


func wait(all: bool = false) -> Gs2AsyncResult:
    if actions.size() == 0:
        return Gs2AsyncResult.new(null, null)
    var next_actions = []
    for action in actions:
        var inner = await action.wait(false)
        if inner.error != null:
            return inner
        if inner.result != null:
            next_actions.append(inner.result)
    var next = Gs2TransactionDomain.new(gs2, access_token, _user_id, next_actions)
    if not all:
        var dispatch_result = await _dispatch()
        if dispatch_result.error != null:
            return dispatch_result
        return Gs2AsyncResult.new(next, null)
    var wait_result = await next.wait(true)
    if wait_result.error != null:
        return wait_result
    var dispatch_result = await _dispatch()
    if dispatch_result.error != null:
        return dispatch_result
    return Gs2AsyncResult.new(null, null)


func run() -> Gs2AsyncResult:
    return await wait(false)


func _append_next_transactions(action_name, result_payload, next_transactions: Array) -> void:
    if result_payload == null or result_payload == "":
        return
    var result_json = JSON.parse_string(result_payload)
    if result_json == null or not (result_json is Dictionary):
        return
    if action_name == "Gs2JobQueue:PushByUserId":
        var push_result = Gs2JobQueuePushByUserIdResult.from_dict(result_json)
        if push_result != null:
            next_transactions.append(Gs2JobQueueJobDomainFactory.to_transaction(
                gs2,
                access_token,
                _user_id,
                push_result
            ))
    if result_json.has("autoRunStampSheet"):
        var next = Gs2TransactionDomainFactory.next_from_result_json(
            gs2,
            access_token,
            _user_id,
            result_json
        )
        if next != null:
            next_transactions.append(next)
