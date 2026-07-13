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
class_name Gs2ShowcaseEzSalesItem
extends RefCounted


var name = null
var metadata = null
var verify_actions = []
var consume_actions = []
var acquire_actions = []


func with_name(v) -> Gs2ShowcaseEzSalesItem:
    name = v
    return self


func with_metadata(v) -> Gs2ShowcaseEzSalesItem:
    metadata = v
    return self


func with_verify_actions(v) -> Gs2ShowcaseEzSalesItem:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ShowcaseEzSalesItem:
    consume_actions = v
    return self


func with_acquire_actions(v) -> Gs2ShowcaseEzSalesItem:
    acquire_actions = v
    return self


func to_model() -> Gs2ShowcaseSalesItem:
    var ret = Gs2ShowcaseSalesItem.new()
    ret.name = name
    ret.metadata = metadata
    ret.verify_actions = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_model())
    ret.consume_actions = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_model())
    ret.acquire_actions = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2ShowcaseEzSalesItem:
    var ret = Gs2ShowcaseEzSalesItem.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.verify_actions = [] if model.verify_actions == null else model.verify_actions.map(func(v): return Gs2EzVerifyAction.from_model(v))
    ret.consume_actions = [] if model.consume_actions == null else model.consume_actions.map(func(v): return Gs2EzConsumeAction.from_model(v))
    ret.acquire_actions = [] if model.acquire_actions == null else model.acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    return ret