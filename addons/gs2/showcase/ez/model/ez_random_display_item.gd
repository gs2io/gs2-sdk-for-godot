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
class_name Gs2ShowcaseEzRandomDisplayItem
extends RefCounted


var name = null
var metadata = null
var verify_actions = []
var consume_actions = []
var acquire_actions = []
var current_purchase_count = 0
var maximum_purchase_count = 0


func with_name(v) -> Gs2ShowcaseEzRandomDisplayItem:
    name = v
    return self


func with_metadata(v) -> Gs2ShowcaseEzRandomDisplayItem:
    metadata = v
    return self


func with_verify_actions(v) -> Gs2ShowcaseEzRandomDisplayItem:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ShowcaseEzRandomDisplayItem:
    consume_actions = v
    return self


func with_acquire_actions(v) -> Gs2ShowcaseEzRandomDisplayItem:
    acquire_actions = v
    return self


func with_current_purchase_count(v) -> Gs2ShowcaseEzRandomDisplayItem:
    current_purchase_count = v
    return self


func with_maximum_purchase_count(v) -> Gs2ShowcaseEzRandomDisplayItem:
    maximum_purchase_count = v
    return self


func to_model() -> Gs2ShowcaseRandomDisplayItem:
    var ret = Gs2ShowcaseRandomDisplayItem.new()
    ret.name = name
    ret.metadata = metadata
    ret.verify_actions = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_model())
    ret.consume_actions = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_model())
    ret.acquire_actions = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_model())
    ret.current_purchase_count = current_purchase_count
    ret.maximum_purchase_count = maximum_purchase_count
    return ret


static func from_model(model) -> Gs2ShowcaseEzRandomDisplayItem:
    var ret = Gs2ShowcaseEzRandomDisplayItem.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.verify_actions = [] if model.verify_actions == null else model.verify_actions.map(func(v): return Gs2EzVerifyAction.from_model(v))
    ret.consume_actions = [] if model.consume_actions == null else model.consume_actions.map(func(v): return Gs2EzConsumeAction.from_model(v))
    ret.acquire_actions = [] if model.acquire_actions == null else model.acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    ret.current_purchase_count = 0 if model.current_purchase_count == null else model.current_purchase_count
    ret.maximum_purchase_count = 0 if model.maximum_purchase_count == null else model.maximum_purchase_count
    return ret