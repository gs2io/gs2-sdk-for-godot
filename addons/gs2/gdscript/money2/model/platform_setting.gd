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
class_name Gs2Money2PlatformSetting
extends RefCounted


var apple_app_store = null
var google_play = null
var fake = null


func with_apple_app_store(v) -> Gs2Money2PlatformSetting:
    apple_app_store = v
    return self


func with_google_play(v) -> Gs2Money2PlatformSetting:
    google_play = v
    return self


func with_fake(v) -> Gs2Money2PlatformSetting:
    fake = v
    return self


static func from_dict(data) -> Gs2Money2PlatformSetting:
    if data == null:
        return null
    var ret = Gs2Money2PlatformSetting.new()
    ret.apple_app_store = null if data.get("appleAppStore") == null else Gs2Money2AppleAppStoreSetting.from_dict(data.get("appleAppStore"))
    ret.google_play = null if data.get("googlePlay") == null else Gs2Money2GooglePlaySetting.from_dict(data.get("googlePlay"))
    ret.fake = null if data.get("fake") == null else Gs2Money2FakeSetting.from_dict(data.get("fake"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["appleAppStore"] = null if apple_app_store == null else apple_app_store.to_dict()
    ret["googlePlay"] = null if google_play == null else google_play.to_dict()
    ret["fake"] = null if fake == null else fake.to_dict()
    return ret