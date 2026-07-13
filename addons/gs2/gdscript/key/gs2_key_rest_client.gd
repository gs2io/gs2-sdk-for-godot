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
class_name Gs2KeyRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2KeyDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2KeyDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2KeyCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2KeyGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/status"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2KeyGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2KeyGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2KeyGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2KeyUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2KeyDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2KeyDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2KeyGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2KeyGetServiceVersionResult.from_dict(response.body), null)


func describe_keys(request: Gs2KeyDescribeKeysRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/key"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2KeyDescribeKeysResult.from_dict(response.body), null)


func create_key(request: Gs2KeyCreateKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/key"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyCreateKeyResult.from_dict(response.body), null)


func update_key(request: Gs2KeyUpdateKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/key/{keyName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{keyName}", "null" if (request.key_name == null or str(request.key_name) == "") else str(request.key_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyUpdateKeyResult.from_dict(response.body), null)


func get_key(request: Gs2KeyGetKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/key/{keyName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{keyName}", "null" if (request.key_name == null or str(request.key_name) == "") else str(request.key_name))
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
    return Gs2AsyncResult.new(Gs2KeyGetKeyResult.from_dict(response.body), null)


func delete_key(request: Gs2KeyDeleteKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/key/{keyName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{keyName}", "null" if (request.key_name == null or str(request.key_name) == "") else str(request.key_name))
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
    return Gs2AsyncResult.new(Gs2KeyDeleteKeyResult.from_dict(response.body), null)


func encrypt(request: Gs2KeyEncryptRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/key/{keyName}/encrypt"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{keyName}", "null" if (request.key_name == null or str(request.key_name) == "") else str(request.key_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data != null:
        body["data"] = request.data
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyEncryptResult.from_dict(response.body), null)


func decrypt(request: Gs2KeyDecryptRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/key/{keyName}/decrypt"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{keyName}", "null" if (request.key_name == null or str(request.key_name) == "") else str(request.key_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data != null:
        body["data"] = request.data
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyDecryptResult.from_dict(response.body), null)


func describe_git_hub_api_keys(request: Gs2KeyDescribeGitHubApiKeysRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/github"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2KeyDescribeGitHubApiKeysResult.from_dict(response.body), null)


func create_git_hub_api_key(request: Gs2KeyCreateGitHubApiKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/github"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.api_key != null:
        body["apiKey"] = request.api_key
    if request.encryption_key_name != null:
        body["encryptionKeyName"] = request.encryption_key_name
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyCreateGitHubApiKeyResult.from_dict(response.body), null)


func update_git_hub_api_key(request: Gs2KeyUpdateGitHubApiKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/github/{apiKeyName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{apiKeyName}", "null" if (request.api_key_name == null or str(request.api_key_name) == "") else str(request.api_key_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.api_key != null:
        body["apiKey"] = request.api_key
    if request.encryption_key_name != null:
        body["encryptionKeyName"] = request.encryption_key_name
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2KeyUpdateGitHubApiKeyResult.from_dict(response.body), null)


func get_git_hub_api_key(request: Gs2KeyGetGitHubApiKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/github/{apiKeyName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{apiKeyName}", "null" if (request.api_key_name == null or str(request.api_key_name) == "") else str(request.api_key_name))
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
    return Gs2AsyncResult.new(Gs2KeyGetGitHubApiKeyResult.from_dict(response.body), null)


func delete_git_hub_api_key(request: Gs2KeyDeleteGitHubApiKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "key").replace("{region}", session.region) + "/{namespaceName}/github/{apiKeyName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{apiKeyName}", "null" if (request.api_key_name == null or str(request.api_key_name) == "") else str(request.api_key_name))
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
    return Gs2AsyncResult.new(Gs2KeyDeleteGitHubApiKeyResult.from_dict(response.body), null)