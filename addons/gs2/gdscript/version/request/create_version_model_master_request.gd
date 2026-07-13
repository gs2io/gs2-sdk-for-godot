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
class_name Gs2VersionCreateVersionModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var scope = null
var type = null
var current_version = null
var warning_version = null
var error_version = null
var schedule_versions = null
var need_signature = null
var signature_key_id = null
var approve_requirement = null


func with_namespace_name(v) -> Gs2VersionCreateVersionModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2VersionCreateVersionModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2VersionCreateVersionModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2VersionCreateVersionModelMasterRequest:
    metadata = v
    return self


func with_scope(v) -> Gs2VersionCreateVersionModelMasterRequest:
    scope = v
    return self


func with_type(v) -> Gs2VersionCreateVersionModelMasterRequest:
    type = v
    return self


func with_current_version(v) -> Gs2VersionCreateVersionModelMasterRequest:
    current_version = v
    return self


func with_warning_version(v) -> Gs2VersionCreateVersionModelMasterRequest:
    warning_version = v
    return self


func with_error_version(v) -> Gs2VersionCreateVersionModelMasterRequest:
    error_version = v
    return self


func with_schedule_versions(v) -> Gs2VersionCreateVersionModelMasterRequest:
    schedule_versions = v
    return self


func with_need_signature(v) -> Gs2VersionCreateVersionModelMasterRequest:
    need_signature = v
    return self


func with_signature_key_id(v) -> Gs2VersionCreateVersionModelMasterRequest:
    signature_key_id = v
    return self


func with_approve_requirement(v) -> Gs2VersionCreateVersionModelMasterRequest:
    approve_requirement = v
    return self


static func from_dict(data) -> Gs2VersionCreateVersionModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2VersionCreateVersionModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.scope = null if data.get("scope") == null else str(data.get("scope"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.current_version = null if data.get("currentVersion") == null else Gs2VersionVersion.from_dict(data.get("currentVersion"))
    ret.warning_version = null if data.get("warningVersion") == null else Gs2VersionVersion.from_dict(data.get("warningVersion"))
    ret.error_version = null if data.get("errorVersion") == null else Gs2VersionVersion.from_dict(data.get("errorVersion"))
    ret.schedule_versions = null if data.get("scheduleVersions") == null else data.get("scheduleVersions").map(func(v): return Gs2VersionScheduleVersion.from_dict(v))
    ret.need_signature = null if data.get("needSignature") == null else bool(data.get("needSignature"))
    ret.signature_key_id = null if data.get("signatureKeyId") == null else str(data.get("signatureKeyId"))
    ret.approve_requirement = null if data.get("approveRequirement") == null else str(data.get("approveRequirement"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["scope"] = scope
    ret["type"] = type
    ret["currentVersion"] = null if current_version == null else current_version.to_dict()
    ret["warningVersion"] = null if warning_version == null else warning_version.to_dict()
    ret["errorVersion"] = null if error_version == null else error_version.to_dict()
    ret["scheduleVersions"] = null if schedule_versions == null else schedule_versions.map(func(v): return null if v == null else v.to_dict())
    ret["needSignature"] = need_signature
    ret["signatureKeyId"] = signature_key_id
    ret["approveRequirement"] = approve_requirement
    return ret