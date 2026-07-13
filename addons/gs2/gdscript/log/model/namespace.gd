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
class_name Gs2LogNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var type = null
var gcp_credential_json = null
var big_query_dataset_name = null
var log_expire_days = null
var aws_region = null
var aws_access_key_id = null
var aws_secret_access_key = null
var firehose_stream_name = null
var firehose_compress_data = null
var status = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2LogNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2LogNamespace:
    name = v
    return self


func with_description(v) -> Gs2LogNamespace:
    description = v
    return self


func with_type(v) -> Gs2LogNamespace:
    type = v
    return self


func with_gcp_credential_json(v) -> Gs2LogNamespace:
    gcp_credential_json = v
    return self


func with_big_query_dataset_name(v) -> Gs2LogNamespace:
    big_query_dataset_name = v
    return self


func with_log_expire_days(v) -> Gs2LogNamespace:
    log_expire_days = v
    return self


func with_aws_region(v) -> Gs2LogNamespace:
    aws_region = v
    return self


func with_aws_access_key_id(v) -> Gs2LogNamespace:
    aws_access_key_id = v
    return self


func with_aws_secret_access_key(v) -> Gs2LogNamespace:
    aws_secret_access_key = v
    return self


func with_firehose_stream_name(v) -> Gs2LogNamespace:
    firehose_stream_name = v
    return self


func with_firehose_compress_data(v) -> Gs2LogNamespace:
    firehose_compress_data = v
    return self


func with_status(v) -> Gs2LogNamespace:
    status = v
    return self


func with_created_at(v) -> Gs2LogNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LogNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2LogNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2LogNamespace:
    if data == null:
        return null
    var ret = Gs2LogNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.gcp_credential_json = null if data.get("gcpCredentialJson") == null else str(data.get("gcpCredentialJson"))
    ret.big_query_dataset_name = null if data.get("bigQueryDatasetName") == null else str(data.get("bigQueryDatasetName"))
    ret.log_expire_days = null if data.get("logExpireDays") == null else int(data.get("logExpireDays"))
    ret.aws_region = null if data.get("awsRegion") == null else str(data.get("awsRegion"))
    ret.aws_access_key_id = null if data.get("awsAccessKeyId") == null else str(data.get("awsAccessKeyId"))
    ret.aws_secret_access_key = null if data.get("awsSecretAccessKey") == null else str(data.get("awsSecretAccessKey"))
    ret.firehose_stream_name = null if data.get("firehoseStreamName") == null else str(data.get("firehoseStreamName"))
    ret.firehose_compress_data = null if data.get("firehoseCompressData") == null else str(data.get("firehoseCompressData"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceId"] = namespace_id
    ret["name"] = name
    ret["description"] = description
    ret["type"] = type
    ret["gcpCredentialJson"] = gcp_credential_json
    ret["bigQueryDatasetName"] = big_query_dataset_name
    ret["logExpireDays"] = log_expire_days
    ret["awsRegion"] = aws_region
    ret["awsAccessKeyId"] = aws_access_key_id
    ret["awsSecretAccessKey"] = aws_secret_access_key
    ret["firehoseStreamName"] = firehose_stream_name
    ret["firehoseCompressData"] = firehose_compress_data
    ret["status"] = status
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret