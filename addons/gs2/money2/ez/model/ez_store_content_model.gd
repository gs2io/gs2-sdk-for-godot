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
class_name Gs2Money2EzStoreContentModel
extends RefCounted


var name = null
var metadata = null
var apple_app_store = null
var google_play = null


func with_name(v) -> Gs2Money2EzStoreContentModel:
    name = v
    return self


func with_metadata(v) -> Gs2Money2EzStoreContentModel:
    metadata = v
    return self


func with_apple_app_store(v) -> Gs2Money2EzStoreContentModel:
    apple_app_store = v
    return self


func with_google_play(v) -> Gs2Money2EzStoreContentModel:
    google_play = v
    return self


func to_model() -> Gs2Money2StoreContentModel:
    var ret = Gs2Money2StoreContentModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.apple_app_store = null if apple_app_store == null else apple_app_store.to_model()
    ret.google_play = null if google_play == null else google_play.to_model()
    return ret


static func from_model(model) -> Gs2Money2EzStoreContentModel:
    var ret = Gs2Money2EzStoreContentModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.apple_app_store = null if model.apple_app_store == null else Gs2Money2EzAppleAppStoreContent.from_model(model.apple_app_store)
    ret.google_play = null if model.google_play == null else Gs2Money2EzGooglePlayContent.from_model(model.google_play)
    return ret