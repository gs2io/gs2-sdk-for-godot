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
class_name Gs2GuildRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2GuildDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2GuildDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2GuildCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/"
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
    if request.change_notification != null:
        body["changeNotification"] = request.change_notification.to_dict()
    if request.join_notification != null:
        body["joinNotification"] = request.join_notification.to_dict()
    if request.leave_notification != null:
        body["leaveNotification"] = request.leave_notification.to_dict()
    if request.change_member_notification != null:
        body["changeMemberNotification"] = request.change_member_notification.to_dict()
    if request.change_member_notification_ignore_change_metadata != null:
        body["changeMemberNotificationIgnoreChangeMetadata"] = request.change_member_notification_ignore_change_metadata
    if request.receive_request_notification != null:
        body["receiveRequestNotification"] = request.receive_request_notification.to_dict()
    if request.remove_request_notification != null:
        body["removeRequestNotification"] = request.remove_request_notification.to_dict()
    if request.create_guild_script != null:
        body["createGuildScript"] = request.create_guild_script.to_dict()
    if request.update_guild_script != null:
        body["updateGuildScript"] = request.update_guild_script.to_dict()
    if request.join_guild_script != null:
        body["joinGuildScript"] = request.join_guild_script.to_dict()
    if request.receive_join_request_script != null:
        body["receiveJoinRequestScript"] = request.receive_join_request_script.to_dict()
    if request.leave_guild_script != null:
        body["leaveGuildScript"] = request.leave_guild_script.to_dict()
    if request.change_role_script != null:
        body["changeRoleScript"] = request.change_role_script.to_dict()
    if request.delete_guild_script != null:
        body["deleteGuildScript"] = request.delete_guild_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2GuildGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/status"
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
    return Gs2AsyncResult.new(Gs2GuildGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2GuildGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2GuildGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2GuildUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.change_notification != null:
        body["changeNotification"] = request.change_notification.to_dict()
    if request.join_notification != null:
        body["joinNotification"] = request.join_notification.to_dict()
    if request.leave_notification != null:
        body["leaveNotification"] = request.leave_notification.to_dict()
    if request.change_member_notification != null:
        body["changeMemberNotification"] = request.change_member_notification.to_dict()
    if request.change_member_notification_ignore_change_metadata != null:
        body["changeMemberNotificationIgnoreChangeMetadata"] = request.change_member_notification_ignore_change_metadata
    if request.receive_request_notification != null:
        body["receiveRequestNotification"] = request.receive_request_notification.to_dict()
    if request.remove_request_notification != null:
        body["removeRequestNotification"] = request.remove_request_notification.to_dict()
    if request.create_guild_script != null:
        body["createGuildScript"] = request.create_guild_script.to_dict()
    if request.update_guild_script != null:
        body["updateGuildScript"] = request.update_guild_script.to_dict()
    if request.join_guild_script != null:
        body["joinGuildScript"] = request.join_guild_script.to_dict()
    if request.receive_join_request_script != null:
        body["receiveJoinRequestScript"] = request.receive_join_request_script.to_dict()
    if request.leave_guild_script != null:
        body["leaveGuildScript"] = request.leave_guild_script.to_dict()
    if request.change_role_script != null:
        body["changeRoleScript"] = request.change_role_script.to_dict()
    if request.delete_guild_script != null:
        body["deleteGuildScript"] = request.delete_guild_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2GuildDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2GuildDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2GuildGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2GuildGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2GuildDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2GuildDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2GuildCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2GuildCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2GuildCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2GuildCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2GuildCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2GuildCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2GuildPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
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
    return Gs2AsyncResult.new(Gs2GuildPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2GuildImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/import/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2GuildImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2GuildCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
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
    return Gs2AsyncResult.new(Gs2GuildCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_guild_model_masters(request: Gs2GuildDescribeGuildModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master/model"
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
    return Gs2AsyncResult.new(Gs2GuildDescribeGuildModelMastersResult.from_dict(response.body), null)


func create_guild_model_master(request: Gs2GuildCreateGuildModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master/model"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.default_maximum_member_count != null:
        body["defaultMaximumMemberCount"] = request.default_maximum_member_count
    if request.maximum_member_count != null:
        body["maximumMemberCount"] = request.maximum_member_count
    if request.inactivity_period_days != null:
        body["inactivityPeriodDays"] = request.inactivity_period_days
    if request.roles != null:
        body["roles"] = request.roles.map(func(v): return null if v == null else v.to_dict())
    if request.guild_master_role != null:
        body["guildMasterRole"] = request.guild_master_role
    if request.guild_member_default_role != null:
        body["guildMemberDefaultRole"] = request.guild_member_default_role
    if request.rejoin_cool_time_minutes != null:
        body["rejoinCoolTimeMinutes"] = request.rejoin_cool_time_minutes
    if request.max_concurrent_join_guilds != null:
        body["maxConcurrentJoinGuilds"] = request.max_concurrent_join_guilds
    if request.max_concurrent_guild_master_count != null:
        body["maxConcurrentGuildMasterCount"] = request.max_concurrent_guild_master_count
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildCreateGuildModelMasterResult.from_dict(response.body), null)


func get_guild_model_master(request: Gs2GuildGetGuildModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master/model/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetGuildModelMasterResult.from_dict(response.body), null)


func update_guild_model_master(request: Gs2GuildUpdateGuildModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master/model/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.default_maximum_member_count != null:
        body["defaultMaximumMemberCount"] = request.default_maximum_member_count
    if request.maximum_member_count != null:
        body["maximumMemberCount"] = request.maximum_member_count
    if request.inactivity_period_days != null:
        body["inactivityPeriodDays"] = request.inactivity_period_days
    if request.roles != null:
        body["roles"] = request.roles.map(func(v): return null if v == null else v.to_dict())
    if request.guild_master_role != null:
        body["guildMasterRole"] = request.guild_master_role
    if request.guild_member_default_role != null:
        body["guildMemberDefaultRole"] = request.guild_member_default_role
    if request.rejoin_cool_time_minutes != null:
        body["rejoinCoolTimeMinutes"] = request.rejoin_cool_time_minutes
    if request.max_concurrent_join_guilds != null:
        body["maxConcurrentJoinGuilds"] = request.max_concurrent_join_guilds
    if request.max_concurrent_guild_master_count != null:
        body["maxConcurrentGuildMasterCount"] = request.max_concurrent_guild_master_count
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildUpdateGuildModelMasterResult.from_dict(response.body), null)


func delete_guild_model_master(request: Gs2GuildDeleteGuildModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master/model/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildDeleteGuildModelMasterResult.from_dict(response.body), null)


func describe_guild_models(request: Gs2GuildDescribeGuildModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/model"
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
    return Gs2AsyncResult.new(Gs2GuildDescribeGuildModelsResult.from_dict(response.body), null)


func get_guild_model(request: Gs2GuildGetGuildModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/model/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetGuildModelResult.from_dict(response.body), null)


func search_guilds(request: Gs2GuildSearchGuildsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/guild/{guildModelName}/search"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.attributes1 != null:
        body["attributes1"] = request.attributes1
    if request.attributes2 != null:
        body["attributes2"] = request.attributes2
    if request.attributes3 != null:
        body["attributes3"] = request.attributes3
    if request.attributes4 != null:
        body["attributes4"] = request.attributes4
    if request.attributes5 != null:
        body["attributes5"] = request.attributes5
    if request.join_policies != null:
        body["joinPolicies"] = request.join_policies
    if request.include_full_members_guild != null:
        body["includeFullMembersGuild"] = request.include_full_members_guild
    if request.order_by != null:
        body["orderBy"] = request.order_by
    if request.page_token != null:
        body["pageToken"] = request.page_token
    if request.limit != null:
        body["limit"] = request.limit
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
    return Gs2AsyncResult.new(Gs2GuildSearchGuildsResult.from_dict(response.body), null)


func search_guilds_by_user_id(request: Gs2GuildSearchGuildsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/guild/{guildModelName}/search"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.attributes1 != null:
        body["attributes1"] = request.attributes1
    if request.attributes2 != null:
        body["attributes2"] = request.attributes2
    if request.attributes3 != null:
        body["attributes3"] = request.attributes3
    if request.attributes4 != null:
        body["attributes4"] = request.attributes4
    if request.attributes5 != null:
        body["attributes5"] = request.attributes5
    if request.join_policies != null:
        body["joinPolicies"] = request.join_policies
    if request.include_full_members_guild != null:
        body["includeFullMembersGuild"] = request.include_full_members_guild
    if request.order_by != null:
        body["orderBy"] = request.order_by
    if request.page_token != null:
        body["pageToken"] = request.page_token
    if request.limit != null:
        body["limit"] = request.limit
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
    return Gs2AsyncResult.new(Gs2GuildSearchGuildsByUserIdResult.from_dict(response.body), null)


func create_guild(request: Gs2GuildCreateGuildRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/guild/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.attribute1 != null:
        body["attribute1"] = request.attribute1
    if request.attribute2 != null:
        body["attribute2"] = request.attribute2
    if request.attribute3 != null:
        body["attribute3"] = request.attribute3
    if request.attribute4 != null:
        body["attribute4"] = request.attribute4
    if request.attribute5 != null:
        body["attribute5"] = request.attribute5
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.member_metadata != null:
        body["memberMetadata"] = request.member_metadata
    if request.join_policy != null:
        body["joinPolicy"] = request.join_policy
    if request.custom_roles != null:
        body["customRoles"] = request.custom_roles.map(func(v): return null if v == null else v.to_dict())
    if request.guild_member_default_role != null:
        body["guildMemberDefaultRole"] = request.guild_member_default_role
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
    return Gs2AsyncResult.new(Gs2GuildCreateGuildResult.from_dict(response.body), null)


func create_guild_by_user_id(request: Gs2GuildCreateGuildByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/guild/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.attribute1 != null:
        body["attribute1"] = request.attribute1
    if request.attribute2 != null:
        body["attribute2"] = request.attribute2
    if request.attribute3 != null:
        body["attribute3"] = request.attribute3
    if request.attribute4 != null:
        body["attribute4"] = request.attribute4
    if request.attribute5 != null:
        body["attribute5"] = request.attribute5
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.member_metadata != null:
        body["memberMetadata"] = request.member_metadata
    if request.join_policy != null:
        body["joinPolicy"] = request.join_policy
    if request.custom_roles != null:
        body["customRoles"] = request.custom_roles.map(func(v): return null if v == null else v.to_dict())
    if request.guild_member_default_role != null:
        body["guildMemberDefaultRole"] = request.guild_member_default_role
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
    return Gs2AsyncResult.new(Gs2GuildCreateGuildByUserIdResult.from_dict(response.body), null)


func get_guild(request: Gs2GuildGetGuildRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/guild/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetGuildResult.from_dict(response.body), null)


func get_guild_by_user_id(request: Gs2GuildGetGuildByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/guild/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetGuildByUserIdResult.from_dict(response.body), null)


func update_guild(request: Gs2GuildUpdateGuildRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.attribute1 != null:
        body["attribute1"] = request.attribute1
    if request.attribute2 != null:
        body["attribute2"] = request.attribute2
    if request.attribute3 != null:
        body["attribute3"] = request.attribute3
    if request.attribute4 != null:
        body["attribute4"] = request.attribute4
    if request.attribute5 != null:
        body["attribute5"] = request.attribute5
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.join_policy != null:
        body["joinPolicy"] = request.join_policy
    if request.custom_roles != null:
        body["customRoles"] = request.custom_roles.map(func(v): return null if v == null else v.to_dict())
    if request.guild_member_default_role != null:
        body["guildMemberDefaultRole"] = request.guild_member_default_role
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
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildUpdateGuildResult.from_dict(response.body), null)


func update_guild_by_guild_name(request: Gs2GuildUpdateGuildByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.attribute1 != null:
        body["attribute1"] = request.attribute1
    if request.attribute2 != null:
        body["attribute2"] = request.attribute2
    if request.attribute3 != null:
        body["attribute3"] = request.attribute3
    if request.attribute4 != null:
        body["attribute4"] = request.attribute4
    if request.attribute5 != null:
        body["attribute5"] = request.attribute5
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.join_policy != null:
        body["joinPolicy"] = request.join_policy
    if request.custom_roles != null:
        body["customRoles"] = request.custom_roles.map(func(v): return null if v == null else v.to_dict())
    if request.guild_member_default_role != null:
        body["guildMemberDefaultRole"] = request.guild_member_default_role
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildUpdateGuildByGuildNameResult.from_dict(response.body), null)


func delete_member(request: Gs2GuildDeleteMemberRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/member/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
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
        if response.error.has_error_code("guild.member.master.require"):
            return Gs2AsyncResult.new(null, Gs2GuildGuildMasterRequiredException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildDeleteMemberResult.from_dict(response.body), null)


func delete_member_by_guild_name(request: Gs2GuildDeleteMemberByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/member/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        if response.error.has_error_code("guild.member.master.require"):
            return Gs2AsyncResult.new(null, Gs2GuildGuildMasterRequiredException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildDeleteMemberByGuildNameResult.from_dict(response.body), null)


func update_member_role(request: Gs2GuildUpdateMemberRoleRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/member/{targetUserId}/role"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.role_name != null:
        body["roleName"] = request.role_name
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
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildUpdateMemberRoleResult.from_dict(response.body), null)


func update_member_role_by_guild_name(request: Gs2GuildUpdateMemberRoleByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/member/{targetUserId}/role"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.role_name != null:
        body["roleName"] = request.role_name
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildUpdateMemberRoleByGuildNameResult.from_dict(response.body), null)


func batch_update_member_role(request: Gs2GuildBatchUpdateMemberRoleRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/batch/member/role"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.members != null:
        body["members"] = request.members.map(func(v): return null if v == null else v.to_dict())
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
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildBatchUpdateMemberRoleResult.from_dict(response.body), null)


func batch_update_member_role_by_guild_name(request: Gs2GuildBatchUpdateMemberRoleByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/batch/member/role"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.members != null:
        body["members"] = request.members.map(func(v): return null if v == null else v.to_dict())
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildBatchUpdateMemberRoleByGuildNameResult.from_dict(response.body), null)


func delete_guild(request: Gs2GuildDeleteGuildRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildDeleteGuildResult.from_dict(response.body), null)


func delete_guild_by_guild_name(request: Gs2GuildDeleteGuildByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildDeleteGuildByGuildNameResult.from_dict(response.body), null)


func increase_maximum_current_maximum_member_count_by_guild_name(request: Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/currentMaximumMemberCount/increase"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.value != null:
        body["value"] = request.value
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(response.body), null)


func decrease_maximum_current_maximum_member_count(request: Gs2GuildDecreaseMaximumCurrentMaximumMemberCountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/currentMaximumMemberCount/decrease"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.value != null:
        body["value"] = request.value
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
    return Gs2AsyncResult.new(Gs2GuildDecreaseMaximumCurrentMaximumMemberCountResult.from_dict(response.body), null)


func decrease_maximum_current_maximum_member_count_by_guild_name(request: Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/currentMaximumMemberCount/decrease"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.value != null:
        body["value"] = request.value
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(response.body), null)


func verify_current_maximum_member_count(request: Gs2GuildVerifyCurrentMaximumMemberCountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/currentMaximumMemberCount/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
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
    return Gs2AsyncResult.new(Gs2GuildVerifyCurrentMaximumMemberCountResult.from_dict(response.body), null)


func verify_current_maximum_member_count_by_guild_name(request: Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/currentMaximumMemberCount/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.value != null:
        body["value"] = request.value
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameResult.from_dict(response.body), null)


func verify_include_member(request: Gs2GuildVerifyIncludeMemberRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/member/me/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
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
    return Gs2AsyncResult.new(Gs2GuildVerifyIncludeMemberResult.from_dict(response.body), null)


func verify_include_member_by_user_id(request: Gs2GuildVerifyIncludeMemberByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/member/{userId}/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
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
    return Gs2AsyncResult.new(Gs2GuildVerifyIncludeMemberByUserIdResult.from_dict(response.body), null)


func set_maximum_current_maximum_member_count_by_guild_name(request: Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/currentMaximumMemberCount"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.value != null:
        body["value"] = request.value
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(response.body), null)


func assume(request: Gs2GuildAssumeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/guild/{guildModelName}/{guildName}/assume"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
        if response.error.has_error_code("guild.member.notFound"):
            return Gs2AsyncResult.new(null, Gs2GuildNotIncludedGuildMemberException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildAssumeResult.from_dict(response.body), null)


func assume_by_user_id(request: Gs2GuildAssumeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/guild/{guildModelName}/{guildName}/assume"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
        if response.error.has_error_code("guild.member.notFound"):
            return Gs2AsyncResult.new(null, Gs2GuildNotIncludedGuildMemberException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildAssumeByUserIdResult.from_dict(response.body), null)


func increase_maximum_current_maximum_member_count_by_stamp_sheet(request: Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByStampSheetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/stamp/guild/currentMaximumMemberCount/add"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByStampSheetResult.from_dict(response.body), null)


func decrease_maximum_current_maximum_member_count_by_stamp_task(request: Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/stamp/guild/currentMaximumMemberCount/sub"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_task != null:
        body["stampTask"] = request.stamp_task
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByStampTaskResult.from_dict(response.body), null)


func set_maximum_current_maximum_member_count_by_stamp_sheet(request: Gs2GuildSetMaximumCurrentMaximumMemberCountByStampSheetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/stamp/guild/currentMaximumMemberCount/set"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildSetMaximumCurrentMaximumMemberCountByStampSheetResult.from_dict(response.body), null)


func verify_current_maximum_member_count_by_stamp_task(request: Gs2GuildVerifyCurrentMaximumMemberCountByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/stamp/guild/currentMaximumMemberCount/verify"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_task != null:
        body["stampTask"] = request.stamp_task
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildVerifyCurrentMaximumMemberCountByStampTaskResult.from_dict(response.body), null)


func verify_include_member_by_stamp_task(request: Gs2GuildVerifyIncludeMemberByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/stamp/guild/member/verify"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_task != null:
        body["stampTask"] = request.stamp_task
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildVerifyIncludeMemberByStampTaskResult.from_dict(response.body), null)


func describe_joined_guilds(request: Gs2GuildDescribeJoinedGuildsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/joined"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.guild_model_name != null:
        query_strings["guildModelName"] = request.guild_model_name
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
    return Gs2AsyncResult.new(Gs2GuildDescribeJoinedGuildsResult.from_dict(response.body), null)


func describe_joined_guilds_by_user_id(request: Gs2GuildDescribeJoinedGuildsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/joined"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.guild_model_name != null:
        query_strings["guildModelName"] = request.guild_model_name
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
    return Gs2AsyncResult.new(Gs2GuildDescribeJoinedGuildsByUserIdResult.from_dict(response.body), null)


func get_joined_guild(request: Gs2GuildGetJoinedGuildRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/joined/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetJoinedGuildResult.from_dict(response.body), null)


func get_joined_guild_by_user_id(request: Gs2GuildGetJoinedGuildByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/joined/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetJoinedGuildByUserIdResult.from_dict(response.body), null)


func update_member_metadata(request: Gs2GuildUpdateMemberMetadataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/guild/{guildName}/member/me/metadata"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.metadata != null:
        body["metadata"] = request.metadata
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
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildUpdateMemberMetadataResult.from_dict(response.body), null)


func update_member_metadata_by_user_id(request: Gs2GuildUpdateMemberMetadataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/guild/{guildName}/member/{userId}/metadata"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.metadata != null:
        body["metadata"] = request.metadata
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
    return Gs2AsyncResult.new(Gs2GuildUpdateMemberMetadataByUserIdResult.from_dict(response.body), null)


func withdrawal(request: Gs2GuildWithdrawalRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/joined/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
        if response.error.has_error_code("guild.member.master.require"):
            return Gs2AsyncResult.new(null, Gs2GuildGuildMasterRequiredException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildWithdrawalResult.from_dict(response.body), null)


func withdrawal_by_user_id(request: Gs2GuildWithdrawalByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/joined/{guildModelName}/{guildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
        if response.error.has_error_code("guild.member.master.require"):
            return Gs2AsyncResult.new(null, Gs2GuildGuildMasterRequiredException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildWithdrawalByUserIdResult.from_dict(response.body), null)


func get_last_guild_master_activity(request: Gs2GuildGetLastGuildMasterActivityRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/activity/guildMaster/last"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetLastGuildMasterActivityResult.from_dict(response.body), null)


func get_last_guild_master_activity_by_guild_name(request: Gs2GuildGetLastGuildMasterActivityByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/activity/guildMaster/last"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetLastGuildMasterActivityByGuildNameResult.from_dict(response.body), null)


func promote_senior_member(request: Gs2GuildPromoteSeniorMemberRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/promote"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildPromoteSeniorMemberResult.from_dict(response.body), null)


func promote_senior_member_by_guild_name(request: Gs2GuildPromoteSeniorMemberByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/promote"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildPromoteSeniorMemberByGuildNameResult.from_dict(response.body), null)


func export_master(request: Gs2GuildExportMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master/export"
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
    return Gs2AsyncResult.new(Gs2GuildExportMasterResult.from_dict(response.body), null)


func get_current_guild_master(request: Gs2GuildGetCurrentGuildMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2GuildGetCurrentGuildMasterResult.from_dict(response.body), null)


func pre_update_current_guild_master(request: Gs2GuildPreUpdateCurrentGuildMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2GuildPreUpdateCurrentGuildMasterResult.from_dict(response.body), null)


func update_current_guild_master(request: Gs2GuildUpdateCurrentGuildMasterRequest) -> Gs2AsyncResult:
    if request.settings != null:
        var pre_request = Gs2GuildPreUpdateCurrentGuildMasterRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.namespace_name = request.namespace_name
        var pre_async_result = await pre_update_current_guild_master(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.settings)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.settings = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2GuildUpdateCurrentGuildMasterResult.from_dict(response.body), null)


func update_current_guild_master_from_git_hub(request: Gs2GuildUpdateCurrentGuildMasterFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/master/from_git_hub"
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
    return Gs2AsyncResult.new(Gs2GuildUpdateCurrentGuildMasterFromGitHubResult.from_dict(response.body), null)


func describe_receive_requests(request: Gs2GuildDescribeReceiveRequestsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/inbox"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildDescribeReceiveRequestsResult.from_dict(response.body), null)


func describe_receive_requests_by_guild_name(request: Gs2GuildDescribeReceiveRequestsByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/inbox"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildDescribeReceiveRequestsByGuildNameResult.from_dict(response.body), null)


func get_receive_request(request: Gs2GuildGetReceiveRequestRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/inbox/{fromUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{fromUserId}", "null" if (request.from_user_id == null or str(request.from_user_id) == "") else str(request.from_user_id))
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
    return Gs2AsyncResult.new(Gs2GuildGetReceiveRequestResult.from_dict(response.body), null)


func get_receive_request_by_guild_name(request: Gs2GuildGetReceiveRequestByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/inbox/{fromUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{fromUserId}", "null" if (request.from_user_id == null or str(request.from_user_id) == "") else str(request.from_user_id))
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
    return Gs2AsyncResult.new(Gs2GuildGetReceiveRequestByGuildNameResult.from_dict(response.body), null)


func accept_request(request: Gs2GuildAcceptRequestRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/inbox/{fromUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{fromUserId}", "null" if (request.from_user_id == null or str(request.from_user_id) == "") else str(request.from_user_id))
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
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        if response.error.has_error_code("user.joinedGuild.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumJoinedGuildsReachedException.new(response.error))
        if response.error.has_error_code("guild.members.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumMembersReachedException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildAcceptRequestResult.from_dict(response.body), null)


func accept_request_by_guild_name(request: Gs2GuildAcceptRequestByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/inbox/{fromUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{fromUserId}", "null" if (request.from_user_id == null or str(request.from_user_id) == "") else str(request.from_user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        if response.error.has_error_code("user.joinedGuild.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumJoinedGuildsReachedException.new(response.error))
        if response.error.has_error_code("guild.members.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumMembersReachedException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildAcceptRequestByGuildNameResult.from_dict(response.body), null)


func reject_request(request: Gs2GuildRejectRequestRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/inbox/{fromUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{fromUserId}", "null" if (request.from_user_id == null or str(request.from_user_id) == "") else str(request.from_user_id))
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
    return Gs2AsyncResult.new(Gs2GuildRejectRequestResult.from_dict(response.body), null)


func reject_request_by_guild_name(request: Gs2GuildRejectRequestByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/inbox/{fromUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
    url = url.replace("{fromUserId}", "null" if (request.from_user_id == null or str(request.from_user_id) == "") else str(request.from_user_id))
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
    return Gs2AsyncResult.new(Gs2GuildRejectRequestByGuildNameResult.from_dict(response.body), null)


func describe_send_requests(request: Gs2GuildDescribeSendRequestsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/sendBox/guild/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildDescribeSendRequestsResult.from_dict(response.body), null)


func describe_send_requests_by_user_id(request: Gs2GuildDescribeSendRequestsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/sendBox/guild/{guildModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildDescribeSendRequestsByUserIdResult.from_dict(response.body), null)


func get_send_request(request: Gs2GuildGetSendRequestRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/sendBox/guild/{guildModelName}/{targetGuildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetGuildName}", "null" if (request.target_guild_name == null or str(request.target_guild_name) == "") else str(request.target_guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetSendRequestResult.from_dict(response.body), null)


func get_send_request_by_user_id(request: Gs2GuildGetSendRequestByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/sendBox/guild/{guildModelName}/{targetGuildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetGuildName}", "null" if (request.target_guild_name == null or str(request.target_guild_name) == "") else str(request.target_guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetSendRequestByUserIdResult.from_dict(response.body), null)


func send_request(request: Gs2GuildSendRequestRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/sendBox/guild/{guildModelName}/{targetGuildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetGuildName}", "null" if (request.target_guild_name == null or str(request.target_guild_name) == "") else str(request.target_guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.metadata != null:
        body["metadata"] = request.metadata
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
        if response.error.has_error_code("guild.members.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumMembersReachedException.new(response.error))
        if response.error.has_error_code("user.joinedGuild.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumJoinedGuildsReachedException.new(response.error))
        if response.error.has_error_code("guild.receiveRequests.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumReceiveRequestsReachedException.new(response.error))
        if response.error.has_error_code("guild.sendRequests.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumSendRequestsReachedException.new(response.error))
        if response.error.has_error_code("guild.sendRequests.notMeetJoinRequirements"):
            return Gs2AsyncResult.new(null, Gs2GuildDotMeetJoinRequirementsException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildSendRequestResult.from_dict(response.body), null)


func send_request_by_user_id(request: Gs2GuildSendRequestByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/sendBox/guild/{guildModelName}/{targetGuildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetGuildName}", "null" if (request.target_guild_name == null or str(request.target_guild_name) == "") else str(request.target_guild_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.metadata != null:
        body["metadata"] = request.metadata
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
        if response.error.has_error_code("guild.members.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumMembersReachedException.new(response.error))
        if response.error.has_error_code("user.joinedGuild.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumJoinedGuildsReachedException.new(response.error))
        if response.error.has_error_code("guild.receiveRequests.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumReceiveRequestsReachedException.new(response.error))
        if response.error.has_error_code("guild.sendRequests.tooMany"):
            return Gs2AsyncResult.new(null, Gs2GuildMaximumSendRequestsReachedException.new(response.error))
        if response.error.has_error_code("guild.sendRequests.notMeetJoinRequirements"):
            return Gs2AsyncResult.new(null, Gs2GuildDotMeetJoinRequirementsException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildSendRequestByUserIdResult.from_dict(response.body), null)


func delete_request(request: Gs2GuildDeleteRequestRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/me/sendBox/guild/{guildModelName}/{targetGuildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetGuildName}", "null" if (request.target_guild_name == null or str(request.target_guild_name) == "") else str(request.target_guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildDeleteRequestResult.from_dict(response.body), null)


func delete_request_by_user_id(request: Gs2GuildDeleteRequestByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/sendBox/guild/{guildModelName}/{targetGuildName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{targetGuildName}", "null" if (request.target_guild_name == null or str(request.target_guild_name) == "") else str(request.target_guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildDeleteRequestByUserIdResult.from_dict(response.body), null)


func describe_ignore_users(request: Gs2GuildDescribeIgnoreUsersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/ignore/user"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
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
    return Gs2AsyncResult.new(Gs2GuildDescribeIgnoreUsersResult.from_dict(response.body), null)


func describe_ignore_users_by_guild_name(request: Gs2GuildDescribeIgnoreUsersByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/ignore/user"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildDescribeIgnoreUsersByGuildNameResult.from_dict(response.body), null)


func get_ignore_user(request: Gs2GuildGetIgnoreUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/ignore/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
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
    return Gs2AsyncResult.new(Gs2GuildGetIgnoreUserResult.from_dict(response.body), null)


func get_ignore_user_by_guild_name(request: Gs2GuildGetIgnoreUserByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/ignore/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildGetIgnoreUserByGuildNameResult.from_dict(response.body), null)


func add_ignore_user(request: Gs2GuildAddIgnoreUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/ignore/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
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
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildAddIgnoreUserResult.from_dict(response.body), null)


func add_ignore_user_by_guild_name(request: Gs2GuildAddIgnoreUserByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/ignore/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2GuildAddIgnoreUserByGuildNameResult.from_dict(response.body), null)


func delete_ignore_user(request: Gs2GuildDeleteIgnoreUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/me/ignore/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
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
    return Gs2AsyncResult.new(Gs2GuildDeleteIgnoreUserResult.from_dict(response.body), null)


func delete_ignore_user_by_guild_name(request: Gs2GuildDeleteIgnoreUserByGuildNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "guild").replace("{region}", session.region) + "/{namespaceName}/guild/{guildModelName}/{guildName}/ignore/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{guildModelName}", "null" if (request.guild_model_name == null or str(request.guild_model_name) == "") else str(request.guild_model_name))
    url = url.replace("{guildName}", "null" if (request.guild_name == null or str(request.guild_name) == "") else str(request.guild_name))
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
    return Gs2AsyncResult.new(Gs2GuildDeleteIgnoreUserByGuildNameResult.from_dict(response.body), null)