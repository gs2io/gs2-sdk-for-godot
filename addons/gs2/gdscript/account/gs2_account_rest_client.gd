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
class_name Gs2AccountRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2AccountDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2AccountDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2AccountCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.change_password_if_take_over != null:
        body["changePasswordIfTakeOver"] = request.change_password_if_take_over
    if request.different_user_id_for_login_and_data_retention != null:
        body["differentUserIdForLoginAndDataRetention"] = request.different_user_id_for_login_and_data_retention
    if request.create_account_script != null:
        body["createAccountScript"] = request.create_account_script.to_dict()
    if request.authentication_script != null:
        body["authenticationScript"] = request.authentication_script.to_dict()
    if request.create_take_over_script != null:
        body["createTakeOverScript"] = request.create_take_over_script.to_dict()
    if request.do_take_over_script != null:
        body["doTakeOverScript"] = request.do_take_over_script.to_dict()
    if request.ban_script != null:
        body["banScript"] = request.ban_script.to_dict()
    if request.un_ban_script != null:
        body["unBanScript"] = request.un_ban_script.to_dict()
    if request.account_deletion_setting != null:
        body["accountDeletionSetting"] = request.account_deletion_setting.to_dict()
    if request.request_deletion_script != null:
        body["requestDeletionScript"] = request.request_deletion_script.to_dict()
    if request.cancel_deletion_script != null:
        body["cancelDeletionScript"] = request.cancel_deletion_script.to_dict()
    if request.execute_deletion_script != null:
        body["executeDeletionScript"] = request.execute_deletion_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2AccountGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/status"
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
    return Gs2AsyncResult.new(Gs2AccountGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2AccountGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2AccountGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2AccountUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.change_password_if_take_over != null:
        body["changePasswordIfTakeOver"] = request.change_password_if_take_over
    if request.create_account_script != null:
        body["createAccountScript"] = request.create_account_script.to_dict()
    if request.authentication_script != null:
        body["authenticationScript"] = request.authentication_script.to_dict()
    if request.create_take_over_script != null:
        body["createTakeOverScript"] = request.create_take_over_script.to_dict()
    if request.do_take_over_script != null:
        body["doTakeOverScript"] = request.do_take_over_script.to_dict()
    if request.ban_script != null:
        body["banScript"] = request.ban_script.to_dict()
    if request.un_ban_script != null:
        body["unBanScript"] = request.un_ban_script.to_dict()
    if request.account_deletion_setting != null:
        body["accountDeletionSetting"] = request.account_deletion_setting.to_dict()
    if request.request_deletion_script != null:
        body["requestDeletionScript"] = request.request_deletion_script.to_dict()
    if request.cancel_deletion_script != null:
        body["cancelDeletionScript"] = request.cancel_deletion_script.to_dict()
    if request.execute_deletion_script != null:
        body["executeDeletionScript"] = request.execute_deletion_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2AccountDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2AccountDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2AccountGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2AccountGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2AccountDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/dump/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2AccountCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/dump/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2AccountCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/clean/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2AccountCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/clean/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2AccountPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2AccountImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/import/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2AccountCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{uploadToken}", "null" if (request.upload_token == null or str(request.upload_token) == "") else str(request.upload_token))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_accounts(request: Gs2AccountDescribeAccountsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account"
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
    return Gs2AsyncResult.new(Gs2AccountDescribeAccountsResult.from_dict(response.body), null)


func create_account(request: Gs2AccountCreateAccountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2AccountCreateAccountResult.from_dict(response.body), null)


func update_time_offset(request: Gs2AccountUpdateTimeOffsetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/time_offset"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.time_offset != null:
        body["timeOffset"] = request.time_offset
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountUpdateTimeOffsetResult.from_dict(response.body), null)


func update_banned(request: Gs2AccountUpdateBannedRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/banned"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.banned != null:
        body["banned"] = request.banned
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountUpdateBannedResult.from_dict(response.body), null)


func add_ban(request: Gs2AccountAddBanRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/ban"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.ban_status != null:
        body["banStatus"] = request.ban_status.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountAddBanResult.from_dict(response.body), null)


func remove_ban(request: Gs2AccountRemoveBanRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/ban/{banStatusName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{banStatusName}", "null" if (request.ban_status_name == null or str(request.ban_status_name) == "") else str(request.ban_status_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountRemoveBanResult.from_dict(response.body), null)


func get_account(request: Gs2AccountGetAccountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.include_last_authenticated_at != null:
        query_strings["includeLastAuthenticatedAt"] = request.include_last_authenticated_at
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountGetAccountResult.from_dict(response.body), null)


func delete_account(request: Gs2AccountDeleteAccountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeleteAccountResult.from_dict(response.body), null)


func authentication(request: Gs2AccountAuthenticationRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("Authentication", response.error))
    return Gs2AsyncResult.new(Gs2AccountAuthenticationResult.from_dict(response.body), null)


func preview_take_over(request: Gs2AccountPreviewTakeOverRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/takeover/type/{type}/preview"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.user_identifier != null:
        body["userIdentifier"] = request.user_identifier
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("PreviewTakeOver", response.error))
    return Gs2AsyncResult.new(Gs2AccountPreviewTakeOverResult.from_dict(response.body), null)


func preview_take_over_open_id_connect(request: Gs2AccountPreviewTakeOverOpenIdConnectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/takeover/type/{type}/openIdConnect/preview"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.id_token != null:
        body["idToken"] = request.id_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("PreviewTakeOverOpenIdConnect", response.error))
    return Gs2AsyncResult.new(Gs2AccountPreviewTakeOverOpenIdConnectResult.from_dict(response.body), null)


func request_deletion(request: Gs2AccountRequestDeletionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/deletion"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountRequestDeletionResult.from_dict(response.body), null)


func request_deletion_by_user_id(request: Gs2AccountRequestDeletionByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/deletion"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountRequestDeletionByUserIdResult.from_dict(response.body), null)


func cancel_deletion(request: Gs2AccountCancelDeletionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/deletion/cancel"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("CancelDeletion", response.error))
    return Gs2AsyncResult.new(Gs2AccountCancelDeletionResult.from_dict(response.body), null)


func cancel_deletion_by_user_id(request: Gs2AccountCancelDeletionByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/deletion"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCancelDeletionByUserIdResult.from_dict(response.body), null)


func execute_deletion_by_user_id(request: Gs2AccountExecuteDeletionByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/deletion/execute"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountExecuteDeletionByUserIdResult.from_dict(response.body), null)


func describe_take_overs(request: Gs2AccountDescribeTakeOversRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/takeover"
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
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDescribeTakeOversResult.from_dict(response.body), null)


func describe_take_overs_by_user_id(request: Gs2AccountDescribeTakeOversByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/takeover"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
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
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDescribeTakeOversByUserIdResult.from_dict(response.body), null)


func create_take_over(request: Gs2AccountCreateTakeOverRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/takeover"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.user_identifier != null:
        body["userIdentifier"] = request.user_identifier
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("CreateTakeOver", response.error))
    return Gs2AsyncResult.new(Gs2AccountCreateTakeOverResult.from_dict(response.body), null)


func create_take_over_by_user_id(request: Gs2AccountCreateTakeOverByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/takeover"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.user_identifier != null:
        body["userIdentifier"] = request.user_identifier
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("CreateTakeOverByUserId", response.error))
    return Gs2AsyncResult.new(Gs2AccountCreateTakeOverByUserIdResult.from_dict(response.body), null)


func create_take_over_open_id_connect(request: Gs2AccountCreateTakeOverOpenIdConnectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/takeover/openIdConnect"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.id_token != null:
        body["idToken"] = request.id_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("CreateTakeOverOpenIdConnect", response.error))
    return Gs2AsyncResult.new(Gs2AccountCreateTakeOverOpenIdConnectResult.from_dict(response.body), null)


func create_take_over_open_id_connect_and_by_user_id(request: Gs2AccountCreateTakeOverOpenIdConnectAndByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/takeover/openIdConnect"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.id_token != null:
        body["idToken"] = request.id_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("CreateTakeOverOpenIdConnectAndByUserId", response.error))
    return Gs2AsyncResult.new(Gs2AccountCreateTakeOverOpenIdConnectAndByUserIdResult.from_dict(response.body), null)


func get_take_over(request: Gs2AccountGetTakeOverRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/takeover/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountGetTakeOverResult.from_dict(response.body), null)


func get_take_over_by_user_id(request: Gs2AccountGetTakeOverByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/takeover/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountGetTakeOverByUserIdResult.from_dict(response.body), null)


func update_take_over(request: Gs2AccountUpdateTakeOverRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/takeover/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.old_password != null:
        body["oldPassword"] = request.old_password
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("UpdateTakeOver", response.error))
    return Gs2AsyncResult.new(Gs2AccountUpdateTakeOverResult.from_dict(response.body), null)


func update_take_over_by_user_id(request: Gs2AccountUpdateTakeOverByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/takeover/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.old_password != null:
        body["oldPassword"] = request.old_password
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("UpdateTakeOverByUserId", response.error))
    return Gs2AsyncResult.new(Gs2AccountUpdateTakeOverByUserIdResult.from_dict(response.body), null)


func delete_take_over(request: Gs2AccountDeleteTakeOverRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/takeover/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeleteTakeOverResult.from_dict(response.body), null)


func delete_take_over_by_user_identifier(request: Gs2AccountDeleteTakeOverByUserIdentifierRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/takeover/type/{type}/userIdentifier/{userIdentifier}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    url = url.replace("{userIdentifier}", "null" if (request.user_identifier == null or str(request.user_identifier) == "") else str(request.user_identifier))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeleteTakeOverByUserIdentifierResult.from_dict(response.body), null)


func delete_take_over_by_user_id(request: Gs2AccountDeleteTakeOverByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/takeover/type/{type}/takeover"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeleteTakeOverByUserIdResult.from_dict(response.body), null)


func do_take_over(request: Gs2AccountDoTakeOverRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/takeover/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.user_identifier != null:
        body["userIdentifier"] = request.user_identifier
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2AccountErrorResolver.resolve("DoTakeOver", response.error))
    return Gs2AsyncResult.new(Gs2AccountDoTakeOverResult.from_dict(response.body), null)


func do_take_over_open_id_connect(request: Gs2AccountDoTakeOverOpenIdConnectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/takeover/type/{type}/openIdConnect"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.id_token != null:
        body["idToken"] = request.id_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDoTakeOverOpenIdConnectResult.from_dict(response.body), null)


func get_authorization_url(request: Gs2AccountGetAuthorizationUrlRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/type/{type}/authorization/url"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
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
    return Gs2AsyncResult.new(Gs2AccountGetAuthorizationUrlResult.from_dict(response.body), null)


func describe_platform_ids(request: Gs2AccountDescribePlatformIdsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/platformId"
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
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDescribePlatformIdsResult.from_dict(response.body), null)


func describe_platform_ids_by_user_id(request: Gs2AccountDescribePlatformIdsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/platformId"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
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
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDescribePlatformIdsByUserIdResult.from_dict(response.body), null)


func create_platform_id(request: Gs2AccountCreatePlatformIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/platformId"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.user_identifier != null:
        body["userIdentifier"] = request.user_identifier
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCreatePlatformIdResult.from_dict(response.body), null)


func create_platform_id_by_user_id(request: Gs2AccountCreatePlatformIdByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/platformId"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.user_identifier != null:
        body["userIdentifier"] = request.user_identifier
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCreatePlatformIdByUserIdResult.from_dict(response.body), null)


func get_platform_id(request: Gs2AccountGetPlatformIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/platformId/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountGetPlatformIdResult.from_dict(response.body), null)


func get_platform_id_by_user_id(request: Gs2AccountGetPlatformIdByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/platformId/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountGetPlatformIdByUserIdResult.from_dict(response.body), null)


func find_platform_id(request: Gs2AccountFindPlatformIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/platformId/type/{type}/userIdentifier/{userIdentifier}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    url = url.replace("{userIdentifier}", "null" if (request.user_identifier == null or str(request.user_identifier) == "") else str(request.user_identifier))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountFindPlatformIdResult.from_dict(response.body), null)


func find_platform_id_by_user_id(request: Gs2AccountFindPlatformIdByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/platformId/type/{type}/userIdentifier/{userIdentifier}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    url = url.replace("{userIdentifier}", "null" if (request.user_identifier == null or str(request.user_identifier) == "") else str(request.user_identifier))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.dont_resolve_data_owner != null:
        query_strings["dontResolveDataOwner"] = request.dont_resolve_data_owner
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountFindPlatformIdByUserIdResult.from_dict(response.body), null)


func delete_platform_id(request: Gs2AccountDeletePlatformIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/me/platformId/type/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.user_identifier != null:
        query_strings["userIdentifier"] = request.user_identifier
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeletePlatformIdResult.from_dict(response.body), null)


func delete_platform_id_by_user_identifier(request: Gs2AccountDeletePlatformIdByUserIdentifierRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/platformId/type/{type}/userIdentifier/{userIdentifier}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    url = url.replace("{userIdentifier}", "null" if (request.user_identifier == null or str(request.user_identifier) == "") else str(request.user_identifier))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeletePlatformIdByUserIdentifierResult.from_dict(response.body), null)


func delete_platform_id_by_user_id(request: Gs2AccountDeletePlatformIdByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/platformId/type/{type}/platformId"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeletePlatformIdByUserIdResult.from_dict(response.body), null)


func get_data_owner_by_user_id(request: Gs2AccountGetDataOwnerByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/dataOwner"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountGetDataOwnerByUserIdResult.from_dict(response.body), null)


func update_data_owner_by_user_id(request: Gs2AccountUpdateDataOwnerByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/dataOwner"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data_owner_name != null:
        body["dataOwnerName"] = request.data_owner_name
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountUpdateDataOwnerByUserIdResult.from_dict(response.body), null)


func delete_data_owner_by_user_id(request: Gs2AccountDeleteDataOwnerByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/account/{userId}/dataOwner"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountDeleteDataOwnerByUserIdResult.from_dict(response.body), null)


func describe_take_over_type_models(request: Gs2AccountDescribeTakeOverTypeModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/model"
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
    return Gs2AsyncResult.new(Gs2AccountDescribeTakeOverTypeModelsResult.from_dict(response.body), null)


func get_take_over_type_model(request: Gs2AccountGetTakeOverTypeModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/model/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
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
    return Gs2AsyncResult.new(Gs2AccountGetTakeOverTypeModelResult.from_dict(response.body), null)


func describe_take_over_type_model_masters(request: Gs2AccountDescribeTakeOverTypeModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master/model"
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
    return Gs2AsyncResult.new(Gs2AccountDescribeTakeOverTypeModelMastersResult.from_dict(response.body), null)


func create_take_over_type_model_master(request: Gs2AccountCreateTakeOverTypeModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master/model"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.open_id_connect_setting != null:
        body["openIdConnectSetting"] = request.open_id_connect_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountCreateTakeOverTypeModelMasterResult.from_dict(response.body), null)


func get_take_over_type_model_master(request: Gs2AccountGetTakeOverTypeModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master/model/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
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
    return Gs2AsyncResult.new(Gs2AccountGetTakeOverTypeModelMasterResult.from_dict(response.body), null)


func update_take_over_type_model_master(request: Gs2AccountUpdateTakeOverTypeModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master/model/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.open_id_connect_setting != null:
        body["openIdConnectSetting"] = request.open_id_connect_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountUpdateTakeOverTypeModelMasterResult.from_dict(response.body), null)


func delete_take_over_type_model_master(request: Gs2AccountDeleteTakeOverTypeModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master/model/{type}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{type}", "null" if (request.type == null or str(request.type) == "") else str(request.type))
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
    return Gs2AsyncResult.new(Gs2AccountDeleteTakeOverTypeModelMasterResult.from_dict(response.body), null)


func export_master(request: Gs2AccountExportMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master/export"
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
    return Gs2AsyncResult.new(Gs2AccountExportMasterResult.from_dict(response.body), null)


func get_current_model_master(request: Gs2AccountGetCurrentModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2AccountGetCurrentModelMasterResult.from_dict(response.body), null)


func pre_update_current_model_master(request: Gs2AccountPreUpdateCurrentModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2AccountPreUpdateCurrentModelMasterResult.from_dict(response.body), null)


func update_current_model_master(request: Gs2AccountUpdateCurrentModelMasterRequest) -> Gs2AsyncResult:
    if request.settings != null:
        var pre_request = Gs2AccountPreUpdateCurrentModelMasterRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.namespace_name = request.namespace_name
        var pre_async_result = await pre_update_current_model_master(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.settings)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.settings = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.mode != null:
        body["mode"] = request.mode
    if request.settings != null:
        body["settings"] = request.settings
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountUpdateCurrentModelMasterResult.from_dict(response.body), null)


func update_current_model_master_from_git_hub(request: Gs2AccountUpdateCurrentModelMasterFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "account").replace("{region}", session.region) + "/{namespaceName}/master/from_git_hub"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.checkout_setting != null:
        body["checkoutSetting"] = request.checkout_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AccountUpdateCurrentModelMasterFromGitHubResult.from_dict(response.body), null)