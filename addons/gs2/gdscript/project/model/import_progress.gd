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
class_name Gs2ProjectImportProgress
extends RefCounted


var import_progress_id = null
var transaction_id = null
var user_id = null
var imported = null
var microservice_count = null
var created_at = null
var updated_at = null
var revision = null


func with_import_progress_id(v) -> Gs2ProjectImportProgress:
    import_progress_id = v
    return self


func with_transaction_id(v) -> Gs2ProjectImportProgress:
    transaction_id = v
    return self


func with_user_id(v) -> Gs2ProjectImportProgress:
    user_id = v
    return self


func with_imported(v) -> Gs2ProjectImportProgress:
    imported = v
    return self


func with_microservice_count(v) -> Gs2ProjectImportProgress:
    microservice_count = v
    return self


func with_created_at(v) -> Gs2ProjectImportProgress:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ProjectImportProgress:
    updated_at = v
    return self


func with_revision(v) -> Gs2ProjectImportProgress:
    revision = v
    return self


static func get_account_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):import:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("accountName")


static func get_project_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):import:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("projectName")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):import:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func from_dict(data) -> Gs2ProjectImportProgress:
    if data == null:
        return null
    var ret = Gs2ProjectImportProgress.new()
    ret.import_progress_id = null if data.get("importProgressId") == null else str(data.get("importProgressId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.imported = null if data.get("imported") == null else int(data.get("imported"))
    ret.microservice_count = null if data.get("microserviceCount") == null else int(data.get("microserviceCount"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["importProgressId"] = import_progress_id
    ret["transactionId"] = transaction_id
    ret["userId"] = user_id
    ret["imported"] = imported
    ret["microserviceCount"] = microservice_count
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret