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
class_name Gs2DeployRestClient
extends Gs2AbstractRestClient


func describe_stacks(request: Gs2DeployDescribeStacksRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.name_prefix != null:
        query_strings["namePrefix"] = request.name_prefix
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployDescribeStacksResult.from_dict(response.body), null)


func pre_create_stack(request: Gs2DeployPreCreateStackRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/pre"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreCreateStackResult.from_dict(response.body), null)


func create_stack(request: Gs2DeployCreateStackRequest) -> Gs2AsyncResult:
    if request.template != null:
        var pre_request = Gs2DeployPreCreateStackRequest.new()
        pre_request.context_stack = request.context_stack
        var pre_async_result = await pre_create_stack(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.template)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.template = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.mode != null:
        body["mode"] = request.mode
    if request.template != null:
        body["template"] = request.template
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployCreateStackResult.from_dict(response.body), null)


func create_stack_from_git_hub(request: Gs2DeployCreateStackFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/from_git_hub"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.checkout_setting != null:
        body["checkoutSetting"] = request.checkout_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployCreateStackFromGitHubResult.from_dict(response.body), null)


func pre_validate(request: Gs2DeployPreValidateRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/validate/pre"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreValidateResult.from_dict(response.body), null)


func validate(request: Gs2DeployValidateRequest) -> Gs2AsyncResult:
    if request.template != null:
        var pre_request = Gs2DeployPreValidateRequest.new()
        pre_request.context_stack = request.context_stack
        var pre_async_result = await pre_validate(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.template)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.template = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/validate"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.mode != null:
        body["mode"] = request.mode
    if request.template != null:
        body["template"] = request.template
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployValidateResult.from_dict(response.body), null)


func get_stack_status(request: Gs2DeployGetStackStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/status"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployGetStackStatusResult.from_dict(response.body), null)


func get_stack(request: Gs2DeployGetStackRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployGetStackResult.from_dict(response.body), null)


func pre_update_stack(request: Gs2DeployPreUpdateStackRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/pre"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreUpdateStackResult.from_dict(response.body), null)


func update_stack(request: Gs2DeployUpdateStackRequest) -> Gs2AsyncResult:
    if request.template != null:
        var pre_request = Gs2DeployPreUpdateStackRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.stack_name = request.stack_name
        var pre_async_result = await pre_update_stack(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.template)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.template = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.mode != null:
        body["mode"] = request.mode
    if request.template != null:
        body["template"] = request.template
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployUpdateStackResult.from_dict(response.body), null)


func pre_change_set(request: Gs2DeployPreChangeSetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/pre"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreChangeSetResult.from_dict(response.body), null)


func change_set(request: Gs2DeployChangeSetRequest) -> Gs2AsyncResult:
    if request.template != null:
        var pre_request = Gs2DeployPreChangeSetRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.stack_name = request.stack_name
        var pre_async_result = await pre_change_set(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.template)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.template = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.mode != null:
        body["mode"] = request.mode
    if request.template != null:
        body["template"] = request.template
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployChangeSetResult.from_dict(response.body), null)


func update_stack_from_git_hub(request: Gs2DeployUpdateStackFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/from_git_hub"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.checkout_setting != null:
        body["checkoutSetting"] = request.checkout_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployUpdateStackFromGitHubResult.from_dict(response.body), null)


func delete_stack(request: Gs2DeployDeleteStackRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployDeleteStackResult.from_dict(response.body), null)


func force_delete_stack(request: Gs2DeployForceDeleteStackRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/force"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployForceDeleteStackResult.from_dict(response.body), null)


func delete_stack_resources(request: Gs2DeployDeleteStackResourcesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/resources"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployDeleteStackResourcesResult.from_dict(response.body), null)


func delete_stack_entity(request: Gs2DeployDeleteStackEntityRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/entity"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployDeleteStackEntityResult.from_dict(response.body), null)


func get_service_version(request: Gs2DeployGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/system/version"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployGetServiceVersionResult.from_dict(response.body), null)


func describe_resources(request: Gs2DeployDescribeResourcesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/resource"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployDescribeResourcesResult.from_dict(response.body), null)


func get_resource(request: Gs2DeployGetResourceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/resource/{resourceName}"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    url = url.replace("{resourceName}", "null" if (request.resource_name == null or str(request.resource_name) == "") else str(request.resource_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployGetResourceResult.from_dict(response.body), null)


func describe_events(request: Gs2DeployDescribeEventsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/event"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployDescribeEventsResult.from_dict(response.body), null)


func get_event(request: Gs2DeployGetEventRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/event/{eventName}"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    url = url.replace("{eventName}", "null" if (request.event_name == null or str(request.event_name) == "") else str(request.event_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployGetEventResult.from_dict(response.body), null)


func describe_outputs(request: Gs2DeployDescribeOutputsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/output"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployDescribeOutputsResult.from_dict(response.body), null)


func get_output(request: Gs2DeployGetOutputRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "deploy").replace("{region}", session.region) + "/stack/{stackName}/output/{outputName}"
    url = url.replace("{stackName}", "null" if (request.stack_name == null or str(request.stack_name) == "") else str(request.stack_name))
    url = url.replace("{outputName}", "null" if (request.output_name == null or str(request.output_name) == "") else str(request.output_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployGetOutputResult.from_dict(response.body), null)