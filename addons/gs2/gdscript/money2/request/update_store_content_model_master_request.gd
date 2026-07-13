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
class_name Gs2Money2UpdateStoreContentModelMasterRequest
extends Gs2Request


var namespace_name = null
var content_name = null
var description = null
var metadata = null
var apple_app_store = null
var google_play = null


func with_namespace_name(v) -> Gs2Money2UpdateStoreContentModelMasterRequest:
    namespace_name = v
    return self


func with_content_name(v) -> Gs2Money2UpdateStoreContentModelMasterRequest:
    content_name = v
    return self


func with_description(v) -> Gs2Money2UpdateStoreContentModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2Money2UpdateStoreContentModelMasterRequest:
    metadata = v
    return self


func with_apple_app_store(v) -> Gs2Money2UpdateStoreContentModelMasterRequest:
    apple_app_store = v
    return self


func with_google_play(v) -> Gs2Money2UpdateStoreContentModelMasterRequest:
    google_play = v
    return self


static func from_dict(data) -> Gs2Money2UpdateStoreContentModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2Money2UpdateStoreContentModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.content_name = null if data.get("contentName") == null else str(data.get("contentName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.apple_app_store = null if data.get("appleAppStore") == null else Gs2Money2AppleAppStoreContent.from_dict(data.get("appleAppStore"))
    ret.google_play = null if data.get("googlePlay") == null else Gs2Money2GooglePlayContent.from_dict(data.get("googlePlay"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["contentName"] = content_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["appleAppStore"] = null if apple_app_store == null else apple_app_store.to_dict()
    ret["googlePlay"] = null if google_play == null else google_play.to_dict()
    return ret