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
class_name Gs2Money2StoreContentModelMaster
extends RefCounted


var store_content_model_id = null
var name = null
var description = null
var metadata = null
var apple_app_store = null
var google_play = null
var created_at = null
var updated_at = null
var revision = null


func with_store_content_model_id(v) -> Gs2Money2StoreContentModelMaster:
    store_content_model_id = v
    return self


func with_name(v) -> Gs2Money2StoreContentModelMaster:
    name = v
    return self


func with_description(v) -> Gs2Money2StoreContentModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2Money2StoreContentModelMaster:
    metadata = v
    return self


func with_apple_app_store(v) -> Gs2Money2StoreContentModelMaster:
    apple_app_store = v
    return self


func with_google_play(v) -> Gs2Money2StoreContentModelMaster:
    google_play = v
    return self


func with_created_at(v) -> Gs2Money2StoreContentModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Money2StoreContentModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2Money2StoreContentModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_content_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):master:content:(?<contentName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("contentName")


static func from_dict(data) -> Gs2Money2StoreContentModelMaster:
    if data == null:
        return null
    var ret = Gs2Money2StoreContentModelMaster.new()
    ret.store_content_model_id = null if data.get("storeContentModelId") == null else str(data.get("storeContentModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.apple_app_store = null if data.get("appleAppStore") == null else Gs2Money2AppleAppStoreContent.from_dict(data.get("appleAppStore"))
    ret.google_play = null if data.get("googlePlay") == null else Gs2Money2GooglePlayContent.from_dict(data.get("googlePlay"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["storeContentModelId"] = store_content_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["appleAppStore"] = null if apple_app_store == null else apple_app_store.to_dict()
    ret["googlePlay"] = null if google_play == null else google_play.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret