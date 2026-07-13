# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
class_name Gs2LotteryEzDrawnPrizeDomain
extends RefCounted


var _domain: Gs2LotteryDrawnPrizeDomain
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var index: Variant:
    get:
        return 0 if _domain == null else _domain.index


func _init(domain, connection):
    _domain = domain
    _connection = connection


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(null, func(): return await _domain.model())
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LotteryEzDrawnPrize.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(func(item): callback.call(null if item == null else Gs2LotteryEzDrawnPrize.from_model(item)))


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)
