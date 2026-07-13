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
class_name Gs2ProjectImportErrorLog
extends RefCounted


var dump_progress_id = null
var name = null
var microservice_name = null
var message = null
var created_at = null
var revision = null


func with_dump_progress_id(v) -> Gs2ProjectImportErrorLog:
    dump_progress_id = v
    return self


func with_name(v) -> Gs2ProjectImportErrorLog:
    name = v
    return self


func with_microservice_name(v) -> Gs2ProjectImportErrorLog:
    microservice_name = v
    return self


func with_message(v) -> Gs2ProjectImportErrorLog:
    message = v
    return self


func with_created_at(v) -> Gs2ProjectImportErrorLog:
    created_at = v
    return self


func with_revision(v) -> Gs2ProjectImportErrorLog:
    revision = v
    return self


static func get_account_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):import:(?<transactionId>.+):log:(?<errorLogName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("accountName")


static func get_project_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):import:(?<transactionId>.+):log:(?<errorLogName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("projectName")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):import:(?<transactionId>.+):log:(?<errorLogName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func get_error_log_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):import:(?<transactionId>.+):log:(?<errorLogName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("errorLogName")


static func from_dict(data) -> Gs2ProjectImportErrorLog:
    if data == null:
        return null
    var ret = Gs2ProjectImportErrorLog.new()
    ret.dump_progress_id = null if data.get("dumpProgressId") == null else str(data.get("dumpProgressId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.microservice_name = null if data.get("microserviceName") == null else str(data.get("microserviceName"))
    ret.message = null if data.get("message") == null else str(data.get("message"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["dumpProgressId"] = dump_progress_id
    ret["name"] = name
    ret["microserviceName"] = microservice_name
    ret["message"] = message
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret