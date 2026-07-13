# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
class_name Gs2LotteryEzListDrawnPrizesIterator
extends RefCounted


var _domain: Variant
var _connection: Gs2Connection
var _it: Variant


func _init(domain, connection):
    _domain = domain
    _connection = connection
    _it = _domain.drawn_prizes()


func load() -> Gs2AsyncResult:
    var async_result = await _connection.run(null, func(): return await _it.load())
    if async_result.error != null:
        return async_result
    var items = []
    for item in (async_result.result if async_result.result != null else []):
        items.append(Gs2LotteryEzDrawnPrize.from_model(item))
    return Gs2AsyncResult.new(items, null)
