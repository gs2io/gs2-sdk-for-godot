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
class_name Gs2GuildClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2GuildRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2GuildRestClient.new(connection.rest_session)


func get_guild_model(namespace_name, guild_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildGetGuildModelRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        return await _rest_client.get_guild_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzGetGuildModelResult.from_model(async_result.result), null)


func list_guild_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDescribeGuildModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_guild_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzListGuildModelsResult.from_model(async_result.result), null)


func assume(game_session, namespace_name, guild_model_name, guild_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildAssumeRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.guild_name = guild_name
        return await _rest_client.assume(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzAssumeResult.from_model(async_result.result), null)


func batch_update_guild_member_role(game_session, namespace_name, guild_model_name, members) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildBatchUpdateMemberRoleRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.members = null if members == null else members.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.batch_update_member_role(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzBatchUpdateGuildMemberRoleResult.from_model(async_result.result), null)


func create_guild(game_session, namespace_name, guild_model_name, display_name, join_policy, attribute1 = null, attribute2 = null, attribute3 = null, attribute4 = null, attribute5 = null, metadata = null, member_metadata = null, custom_roles = null, guild_member_default_role = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildCreateGuildRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.display_name = display_name
        request.attribute1 = attribute1
        request.attribute2 = attribute2
        request.attribute3 = attribute3
        request.attribute4 = attribute4
        request.attribute5 = attribute5
        request.metadata = metadata
        request.member_metadata = member_metadata
        request.join_policy = join_policy
        request.custom_roles = null if custom_roles == null else custom_roles.map(func(v): return null if v == null else v.to_model())
        request.guild_member_default_role = guild_member_default_role
        return await _rest_client.create_guild(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzCreateGuildResult.from_model(async_result.result), null)


func delete_guild(game_session, namespace_name, guild_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDeleteGuildRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        return await _rest_client.delete_guild(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzDeleteGuildResult.from_model(async_result.result), null)


func delete_member_from_guild(game_session, namespace_name, guild_model_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDeleteMemberRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.delete_member(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzDeleteMemberFromGuildResult.from_model(async_result.result), null)


func get_guild(game_session, namespace_name, guild_model_name, guild_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildGetGuildRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.guild_name = guild_name
        return await _rest_client.get_guild(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzGetGuildResult.from_model(async_result.result), null)


func list_guilds(game_session, namespace_name, display_name = null, attributes1 = null, attributes2 = null, attributes3 = null, attributes4 = null, attributes5 = null, join_policies = null, include_full_members_guild = null, order_by = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildSearchGuildsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.display_name = display_name
        request.attributes1 = null if attributes1 == null else attributes1.map(func(v): return v)
        request.attributes2 = null if attributes2 == null else attributes2.map(func(v): return v)
        request.attributes3 = null if attributes3 == null else attributes3.map(func(v): return v)
        request.attributes4 = null if attributes4 == null else attributes4.map(func(v): return v)
        request.attributes5 = null if attributes5 == null else attributes5.map(func(v): return v)
        request.join_policies = null if join_policies == null else join_policies.map(func(v): return v)
        request.include_full_members_guild = include_full_members_guild
        request.order_by = order_by
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.search_guilds(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzListGuildsResult.from_model(async_result.result), null)


func update_guild(game_session, namespace_name, guild_model_name, display_name, join_policy, attribute1 = null, attribute2 = null, attribute3 = null, attribute4 = null, attribute5 = null, metadata = null, custom_roles = null, guild_member_default_role = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildUpdateGuildRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.display_name = display_name
        request.attribute1 = attribute1
        request.attribute2 = attribute2
        request.attribute3 = attribute3
        request.attribute4 = attribute4
        request.attribute5 = attribute5
        request.metadata = metadata
        request.join_policy = join_policy
        request.custom_roles = null if custom_roles == null else custom_roles.map(func(v): return null if v == null else v.to_model())
        request.guild_member_default_role = guild_member_default_role
        return await _rest_client.update_guild(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzUpdateGuildResult.from_model(async_result.result), null)


func update_guild_member_role(game_session, namespace_name, guild_model_name, target_user_id, role_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildUpdateMemberRoleRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        request.role_name = role_name
        return await _rest_client.update_member_role(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzUpdateGuildMemberRoleResult.from_model(async_result.result), null)


func accept_request(game_session, namespace_name, guild_model_name, from_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildAcceptRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.from_user_id = from_user_id
        return await _rest_client.accept_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzAcceptRequestResult.from_model(async_result.result), null)


func get_receive_request(game_session, namespace_name, guild_model_name, from_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildGetReceiveRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.from_user_id = from_user_id
        return await _rest_client.get_receive_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzGetReceiveRequestResult.from_model(async_result.result), null)


func list_receive_requests(game_session, namespace_name, guild_model_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDescribeReceiveRequestsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_receive_requests(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzListReceiveRequestsResult.from_model(async_result.result), null)


func reject_request(game_session, namespace_name, guild_model_name, from_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildRejectRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.from_user_id = from_user_id
        return await _rest_client.reject_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzRejectRequestResult.from_model(async_result.result), null)


func cancel_request(game_session, namespace_name, guild_model_name, target_guild_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDeleteRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.target_guild_name = target_guild_name
        return await _rest_client.delete_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzCancelRequestResult.from_model(async_result.result), null)


func get_send_request(game_session, namespace_name, guild_model_name, target_guild_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildGetSendRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.target_guild_name = target_guild_name
        return await _rest_client.get_send_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzGetSendRequestResult.from_model(async_result.result), null)


func list_send_requests(game_session, namespace_name, guild_model_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDescribeSendRequestsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_send_requests(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzListSendRequestsResult.from_model(async_result.result), null)


func send_request(game_session, namespace_name, guild_model_name, target_guild_name, metadata = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildSendRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.target_guild_name = target_guild_name
        request.metadata = metadata
        return await _rest_client.send_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzSendRequestResult.from_model(async_result.result), null)


func get_joined_guild(game_session, namespace_name, guild_model_name, guild_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildGetJoinedGuildRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.guild_name = guild_name
        return await _rest_client.get_joined_guild(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzGetJoinedGuildResult.from_model(async_result.result), null)


func list_joined_guilds(game_session, namespace_name, guild_model_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDescribeJoinedGuildsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_joined_guilds(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzListJoinedGuildsResult.from_model(async_result.result), null)


func update_member_metadata(game_session, namespace_name, guild_model_name, guild_name = null, metadata = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildUpdateMemberMetadataRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.guild_name = guild_name
        request.access_token = game_session.access_token.token
        request.metadata = metadata
        return await _rest_client.update_member_metadata(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzUpdateMemberMetadataResult.from_model(async_result.result), null)


func withdraw_guild(game_session, namespace_name, guild_model_name, guild_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildWithdrawalRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.guild_model_name = guild_model_name
        request.guild_name = guild_name
        return await _rest_client.withdrawal(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzWithdrawGuildResult.from_model(async_result.result), null)


func add_ignore_user(game_session, namespace_name, guild_model_name, user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildAddIgnoreUserRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.user_id = user_id
        return await _rest_client.add_ignore_user(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzAddIgnoreUserResult.from_model(async_result.result), null)


func delete_ignore_user(game_session, namespace_name, guild_model_name, user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDeleteIgnoreUserRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.user_id = user_id
        return await _rest_client.delete_ignore_user(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzDeleteIgnoreUserResult.from_model(async_result.result), null)


func get_ignore_user(game_session, namespace_name, guild_model_name, user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildGetIgnoreUserRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.user_id = user_id
        return await _rest_client.get_ignore_user(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzGetIgnoreUserResult.from_model(async_result.result), null)


func list_ignore_users(game_session, namespace_name, guild_model_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildDescribeIgnoreUsersRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_ignore_users(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzListIgnoreUsersResult.from_model(async_result.result), null)


func get_last_guild_master_activity(game_session, namespace_name, guild_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildGetLastGuildMasterActivityRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_last_guild_master_activity(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzGetLastGuildMasterActivityResult.from_model(async_result.result), null)


func promote_senior_member(game_session, namespace_name, guild_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GuildPromoteSeniorMemberRequest.new()
        request.namespace_name = namespace_name
        request.guild_model_name = guild_model_name
        request.access_token = game_session.access_token.token
        return await _rest_client.promote_senior_member(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GuildEzPromoteSeniorMemberResult.from_model(async_result.result), null)