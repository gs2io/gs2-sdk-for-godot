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
class_name Gs2CacheDatabase
extends RefCounted


const DEFAULT_CACHE_MINUTES = 15

# {type_name: {parent_key: {key: [obj, ttl]}}}
var _cache: Dictionary = {}
# {type_name: {parent_key: {key: {callback_id: [subscribe: Callable, re_fetch: Callable]}}}}
var _cache_update_callback: Dictionary = {}
# {type_name: {parent_key: true}}
var _list_cached: Dictionary = {}
# {type_name: {parent_key: {callback_id: [subscribe: Callable, re_fetch: Callable]}}}
var _list_cache_update_callback: Dictionary = {}
# {type_name: {parent_key: true}}
var _list_cache_update_required: Dictionary = {}
# {type_name: {parent_key: context}}
var _list_cache_contexts: Dictionary = {}

static var _next_callback_id: int = 1


static func now_ms() -> int:
    return int(Time.get_unix_time_from_system() * 1000.0)


static func default_ttl() -> int:
    return now_ms() + 1000 * 60 * DEFAULT_CACHE_MINUTES


static func stringify(v) -> String:
    if v == null:
        return ""
    return str(v)


static func _equals(a, b) -> bool:
    if a == null and b == null:
        return true
    if a == null or b == null:
        return false
    if a is Object and b is Object:
        if a.has_method("to_dict") and b.has_method("to_dict"):
            return a.to_dict() == b.to_dict()
        return a == b
    if a is Array and b is Array:
        if a.size() != b.size():
            return false
        for i in a.size():
            if not _equals(a[i], b[i]):
                return false
        return true
    return a == b


static func _call_subscribe(pair, arg) -> void:
    if pair[0] is Callable and pair[0].is_valid():
        pair[0].call(arg)


static func _call_re_fetch(pair) -> void:
    if pair[1] is Callable and pair[1].is_valid():
        pair[1].call()


func clear() -> void:
    _cache.clear()
    _list_cached.clear()
    _list_cache_contexts.clear()
    _list_cache_update_required.clear()
    for type_name in _cache_update_callback.keys():
        for parent_key in _cache_update_callback[type_name].keys():
            for key in _cache_update_callback[type_name][parent_key].keys():
                for pair in _cache_update_callback[type_name][parent_key][key].values():
                    _call_re_fetch(pair)


func clear_and_all_unsubscribe() -> void:
    _cache.clear()
    _list_cached.clear()
    _list_cache_contexts.clear()
    _list_cache_update_required.clear()
    _cache_update_callback.clear()
    _list_cache_update_callback.clear()


func set_list_cached(type_name: String, parent_key: String, list_cache_context = null) -> void:
    _list_cached.get_or_add(type_name, {})[parent_key] = true
    if _list_cache_update_required.has(type_name):
        _list_cache_update_required[type_name].erase(parent_key)
    if list_cache_context != null:
        _list_cache_contexts.get_or_add(type_name, {})[parent_key] = list_cache_context
    for pair in _list_cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).values():
        _call_subscribe(pair, list_cache(type_name, parent_key))


func clear_list_cache(type_name: String, parent_key: String) -> void:
    if _cache.has(type_name) and _cache[type_name].has(parent_key):
        _cache[type_name][parent_key].clear()
    if _list_cached.has(type_name):
        _list_cached[type_name].erase(parent_key)
    if _list_cache_update_required.has(type_name):
        _list_cache_update_required[type_name].erase(parent_key)
    if _list_cache_contexts.has(type_name):
        _list_cache_contexts[type_name].erase(parent_key)
    for pair in _list_cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).values():
        _call_re_fetch(pair)


func require_list_cache_update(type_name: String, parent_key: String) -> void:
    _list_cache_update_required.get_or_add(type_name, {})[parent_key] = true
    if _list_cache_contexts.get(type_name, {}).get(parent_key) == null:
        clear_list_cache(type_name, parent_key)
    else:
        for pair in _list_cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).values():
            _call_re_fetch(pair)


func is_list_cached(type_name: String, parent_key: String) -> bool:
    return _list_cached.get(type_name, {}).get(parent_key, false) == true


func _is_list_cache_update_required(type_name: String, parent_key: String) -> bool:
    return _list_cache_update_required.get(type_name, {}).get(parent_key, false) == true


func put(type_name: String, parent_key: String, key: String, obj, ttl: int = 0) -> void:
    if ttl == 0:
        ttl = default_ttl()
    var parent = _cache.get_or_add(type_name, {}).get_or_add(parent_key, {})
    var exists = parent.has(key)
    var changed = not exists or parent[key][0] == null or not _equals(parent[key][0], obj)
    parent[key] = [obj, ttl]
    if changed:
        for pair in _cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).get_or_add(key, {}).values():
            _call_subscribe(pair, obj)
        for pair in _list_cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).values():
            _call_subscribe(pair, list_cache(type_name, parent_key))


func delete(type_name: String, parent_key: String, key: String) -> void:
    if _cache.has(type_name) and _cache[type_name].has(parent_key):
        _cache[type_name][parent_key].erase(key)
    for pair in _list_cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).values():
        _call_subscribe(pair, list_cache(type_name, parent_key))
    for pair in _cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).get_or_add(key, {}).values():
        _call_re_fetch(pair)


func subscribe(type_name: String, parent_key: String, key: String, subscribe_callback: Callable, re_fetch: Callable = Callable()) -> int:
    var callback_id = _next_callback_id
    _next_callback_id += 1
    _cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).get_or_add(key, {})[callback_id] = [subscribe_callback, re_fetch]
    return callback_id


func unsubscribe(type_name: String, parent_key: String, key: String, callback_id: int) -> void:
    _cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).get_or_add(key, {}).erase(callback_id)


func list_subscribe(type_name: String, parent_key: String, subscribe_callback: Callable, re_fetch: Callable = Callable()) -> int:
    var callback_id = _next_callback_id
    _next_callback_id += 1
    _list_cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {})[callback_id] = [subscribe_callback, re_fetch]
    return callback_id


func list_unsubscribe(type_name: String, parent_key: String, callback_id: int) -> void:
    _list_cache_update_callback.get_or_add(type_name, {}).get_or_add(parent_key, {}).erase(callback_id)


# 戻り値: [value, find]
func get_cache(type_name: String, parent_key: String, key: String) -> Array:
    var parent = _cache.get(type_name, {}).get(parent_key)
    if parent != null and parent.has(key):
        var obj = parent[key][0]
        var ttl = parent[key][1]
        if ttl >= now_ms():
            return [obj, true]
        clear_list_cache(type_name, parent_key)
        delete(type_name, parent_key, key)
    return [null, false]


func list_cache(type_name: String, parent_key: String) -> Array:
    var result = try_get_list(type_name, parent_key)
    return result[0] if result[1] else []


# 戻り値: [list, find, list_cache_context]
# list_cache_context は require_list_cache_update() が呼ばれたあとのみ値が入ります
func try_get_list(type_name: String, parent_key: String) -> Array:
    if not is_list_cached(type_name, parent_key):
        return [null, false, null]
    var result = try_get_list_force(type_name, parent_key)
    if not result[1]:
        return [null, false, null]
    var context = null
    if _is_list_cache_update_required(type_name, parent_key):
        context = _list_cache_contexts.get(type_name, {}).get(parent_key)
    return [result[0], true, context]


func list_cache_force(type_name: String, parent_key: String) -> Array:
    var result = try_get_list_force(type_name, parent_key)
    return result[0] if result[1] else []


# 戻り値: [list, find]
func try_get_list_force(type_name: String, parent_key: String) -> Array:
    var now = now_ms()
    var values = _cache.get_or_add(type_name, {}).get_or_add(parent_key, {}).values()
    for pair in values:
        if pair[1] < now:
            clear_list_cache(type_name, parent_key)
            return [null, false]
    var list = []
    for pair in values:
        if pair[1] >= now and pair[0] != null:
            list.append(pair[0])
    return [list, true]
