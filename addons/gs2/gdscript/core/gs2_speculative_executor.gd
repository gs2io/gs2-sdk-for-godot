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

## 投機的実行のコア。consume/acquire アクション列を各サービスの
## SpeculativeExecutorIndex に振り分けて実行する。
## C# の Core/Domain/SpeculativeExecutor/SpeculativeExecutor.cs のサービス列挙は
## フラット命名 + 動的クラス解決で置き換えている。
class_name Gs2SpeculativeExecutor
extends RefCounted


static func _index_for(action, suffix: String):
    if action == null or not (action is String) or not action.contains(":"):
        return null
    var service = action.substr(0, action.find(":"))
    return Gs2ClassRegistry.resolve(service + suffix)


# 戻り値: Gs2AsyncResult (result = コミット用 Callable)
static func execute(
    gs2,
    access_token,
    consume_actions,
    acquire_actions,
    rate_value = 1.0
) -> Gs2AsyncResult:
    var commits = []
    for consume_action in (consume_actions if consume_actions != null else []):
        var index = _index_for(consume_action.action, "ConsumeActionSpeculativeExecutorIndex")
        if index == null:
            push_warning("Speculative execution not supported on this action: " + str(consume_action.action))
            continue
        var commit_result = await index.execute(gs2, access_token, consume_action, rate_value)
        if commit_result.error != null:
            return commit_result
        if commit_result.result is Callable:
            commits.append(commit_result.result)
        else:
            push_warning("Speculative execution not supported on this action: " + str(consume_action.action))
    for acquire_action in (acquire_actions if acquire_actions != null else []):
        var index = _index_for(acquire_action.action, "AcquireActionSpeculativeExecutorIndex")
        if index == null:
            push_warning("Speculative execution not supported on this action: " + str(acquire_action.action))
            continue
        var commit_result = await index.execute(gs2, access_token, acquire_action, rate_value)
        if commit_result.error != null:
            return commit_result
        if commit_result.result is Callable:
            commits.append(commit_result.result)
        else:
            push_warning("Speculative execution not supported on this action: " + str(acquire_action.action))
    var commit = func():
        for c in commits:
            if c is Callable and c.is_valid():
                c.call()
    return Gs2AsyncResult.new(commit, null)
