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
class_name Gs2LotteryEzDescribeBoxesIterator
extends RefCounted


var _domain: Variant
var _game_session: Variant
var _connection: Gs2Connection
var _it: Variant


func _init(
    domain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
    _it = _domain.boxes(
    )


# 全ページを読み込んで Array を返す (Gs2AsyncResult.result = Array of Gs2LotteryEzBoxItems)
func load() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _it.load()
    )
    if async_result.error != null:
        return async_result
    var items = []
    for item in (async_result.result if async_result.result != null else []):
        items.append(Gs2LotteryEzBoxItems.from_model(item))
    return Gs2AsyncResult.new(items, null)