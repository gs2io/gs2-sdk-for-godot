# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
class_name Gs2LotteryDescribeDrawnPrizesIterator
extends RefCounted

var _gs2: Gs2Domain
var namespace_name: String


func _init(gs2: Gs2Domain, namespace_name_: String):
    _gs2 = gs2
    namespace_name = namespace_name_


func load() -> Gs2AsyncResult:
    var cached = _gs2.cache.try_get_list(
        "Gs2LotteryDrawnPrize",
        Gs2LotteryDrawnPrizeCache.cache_parent_key(namespace_name, null)
    )
    return Gs2AsyncResult.new(cached[0] if cached[1] and cached[0] != null else [], null)