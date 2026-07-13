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
class_name Gs2DictionaryEzEntry
extends RefCounted


var entry_id = null
var user_id = null
var name = null
var acquired_at = 0


func with_entry_id(v) -> Gs2DictionaryEzEntry:
    entry_id = v
    return self


func with_user_id(v) -> Gs2DictionaryEzEntry:
    user_id = v
    return self


func with_name(v) -> Gs2DictionaryEzEntry:
    name = v
    return self


func with_acquired_at(v) -> Gs2DictionaryEzEntry:
    acquired_at = v
    return self


func to_model() -> Gs2DictionaryEntry:
    var ret = Gs2DictionaryEntry.new()
    ret.entry_id = entry_id
    ret.user_id = user_id
    ret.name = name
    ret.acquired_at = acquired_at
    return ret


static func from_model(model) -> Gs2DictionaryEzEntry:
    var ret = Gs2DictionaryEzEntry.new()
    ret.entry_id = model.entry_id
    ret.user_id = model.user_id
    ret.name = model.name
    ret.acquired_at = 0 if model.acquired_at == null else model.acquired_at
    return ret