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
class_name Gs2ExchangeEzAwait
extends RefCounted


var user_id = null
var rate_name = null
var name = null
var skip_seconds = 0
var config = []
var exchanged_at = 0
var acquirable_at = 0


func with_user_id(v) -> Gs2ExchangeEzAwait:
    user_id = v
    return self


func with_rate_name(v) -> Gs2ExchangeEzAwait:
    rate_name = v
    return self


func with_name(v) -> Gs2ExchangeEzAwait:
    name = v
    return self


func with_skip_seconds(v) -> Gs2ExchangeEzAwait:
    skip_seconds = v
    return self


func with_config(v) -> Gs2ExchangeEzAwait:
    config = v
    return self


func with_exchanged_at(v) -> Gs2ExchangeEzAwait:
    exchanged_at = v
    return self


func with_acquirable_at(v) -> Gs2ExchangeEzAwait:
    acquirable_at = v
    return self


func to_model() -> Gs2ExchangeAwait:
    var ret = Gs2ExchangeAwait.new()
    ret.user_id = user_id
    ret.rate_name = rate_name
    ret.name = name
    ret.skip_seconds = skip_seconds
    ret.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
    ret.exchanged_at = exchanged_at
    ret.acquirable_at = acquirable_at
    return ret


static func from_model(model) -> Gs2ExchangeEzAwait:
    var ret = Gs2ExchangeEzAwait.new()
    ret.user_id = model.user_id
    ret.rate_name = model.rate_name
    ret.name = model.name
    ret.skip_seconds = 0 if model.skip_seconds == null else model.skip_seconds
    ret.config = [] if model.config == null else model.config.map(func(v): return Gs2ExchangeEzConfig.from_model(v))
    ret.exchanged_at = 0 if model.exchanged_at == null else model.exchanged_at
    ret.acquirable_at = 0 if model.acquirable_at == null else model.acquirable_at
    return ret