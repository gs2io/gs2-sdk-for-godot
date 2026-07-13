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
class_name Gs2NewsEzGetContentsUrlResult
extends RefCounted


var items = []
var browser_url = null
var zip_url = null


static func from_model(model) -> Gs2NewsEzGetContentsUrlResult:
    var ret = Gs2NewsEzGetContentsUrlResult.new()
    ret.items = [] if model.items == null else model.items.map(func(v): return Gs2NewsEzSetCookieRequestEntry.from_model(v))
    ret.browser_url = model.browser_url
    ret.zip_url = model.zip_url
    return ret