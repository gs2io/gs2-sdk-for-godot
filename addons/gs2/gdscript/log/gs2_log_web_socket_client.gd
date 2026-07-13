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
class_name Gs2LogWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2LogCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.type != null:
        body["type"] = request.type
    if request.gcp_credential_json != null:
        body["gcpCredentialJson"] = request.gcp_credential_json
    if request.big_query_dataset_name != null:
        body["bigQueryDatasetName"] = request.big_query_dataset_name
    if request.log_expire_days != null:
        body["logExpireDays"] = request.log_expire_days
    if request.aws_region != null:
        body["awsRegion"] = request.aws_region
    if request.aws_access_key_id != null:
        body["awsAccessKeyId"] = request.aws_access_key_id
    if request.aws_secret_access_key != null:
        body["awsSecretAccessKey"] = request.aws_secret_access_key
    if request.firehose_stream_name != null:
        body["firehoseStreamName"] = request.firehose_stream_name
    if request.firehose_compress_data != null:
        body["firehoseCompressData"] = request.firehose_compress_data
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2LogGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2LogGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2LogUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.type != null:
        body["type"] = request.type
    if request.gcp_credential_json != null:
        body["gcpCredentialJson"] = request.gcp_credential_json
    if request.big_query_dataset_name != null:
        body["bigQueryDatasetName"] = request.big_query_dataset_name
    if request.log_expire_days != null:
        body["logExpireDays"] = request.log_expire_days
    if request.aws_region != null:
        body["awsRegion"] = request.aws_region
    if request.aws_access_key_id != null:
        body["awsAccessKeyId"] = request.aws_access_key_id
    if request.aws_secret_access_key != null:
        body["awsSecretAccessKey"] = request.aws_secret_access_key
    if request.firehose_stream_name != null:
        body["firehoseStreamName"] = request.firehose_stream_name
    if request.firehose_compress_data != null:
        body["firehoseCompressData"] = request.firehose_compress_data
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2LogDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2LogGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogGetServiceVersionResult.from_dict(response.body), null)


func create_insight(request: Gs2LogCreateInsightRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "insight", "createInsight", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCreateInsightResult.from_dict(response.body), null)


func get_insight(request: Gs2LogGetInsightRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.insight_name != null:
        body["insightName"] = request.insight_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "insight", "getInsight", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogGetInsightResult.from_dict(response.body), null)


func delete_insight(request: Gs2LogDeleteInsightRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.insight_name != null:
        body["insightName"] = request.insight_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "insight", "deleteInsight", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogDeleteInsightResult.from_dict(response.body), null)


func create_facet_model(request: Gs2LogCreateFacetModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.field != null:
        body["field"] = request.field
    if request.type != null:
        body["type"] = request.type
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.order != null:
        body["order"] = request.order
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "facetModel", "createFacetModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCreateFacetModelResult.from_dict(response.body), null)


func get_facet_model(request: Gs2LogGetFacetModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.field != null:
        body["field"] = request.field
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "facetModel", "getFacetModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogGetFacetModelResult.from_dict(response.body), null)


func update_facet_model(request: Gs2LogUpdateFacetModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.field != null:
        body["field"] = request.field
    if request.type != null:
        body["type"] = request.type
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.order != null:
        body["order"] = request.order
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "facetModel", "updateFacetModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogUpdateFacetModelResult.from_dict(response.body), null)


func delete_facet_model(request: Gs2LogDeleteFacetModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.field != null:
        body["field"] = request.field
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("log", "facetModel", "deleteFacetModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogDeleteFacetModelResult.from_dict(response.body), null)