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
class_name Gs2FriendClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2FriendRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2FriendRestClient.new(connection.rest_session)


func get_profile(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendGetProfileRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_profile(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzGetProfileResult.from_model(async_result.result), null)


func get_public_profile(namespace_name, user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendGetPublicProfileRequest.new()
        request.namespace_name = namespace_name
        request.user_id = user_id
        return await _rest_client.get_public_profile(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzGetPublicProfileResult.from_model(async_result.result), null)


func update_profile(game_session, namespace_name, public_profile = null, follower_profile = null, friend_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendUpdateProfileRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.public_profile = public_profile
        request.follower_profile = follower_profile
        request.friend_profile = friend_profile
        return await _rest_client.update_profile(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzUpdateProfileResult.from_model(async_result.result), null)


func describe_follow_users(game_session, namespace_name, with_profile = null, limit = null, page_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendDescribeFollowsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.with_profile = with_profile
        request.limit = limit
        request.page_token = page_token
        return await _rest_client.describe_follows(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzDescribeFollowUsersResult.from_model(async_result.result), null)


func follow(game_session, namespace_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendFollowRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.follow(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzFollowResult.from_model(async_result.result), null)


func get_follow_user(game_session, namespace_name, target_user_id, with_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendGetFollowRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.with_profile = with_profile
        request.target_user_id = target_user_id
        return await _rest_client.get_follow(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzGetFollowUserResult.from_model(async_result.result), null)


func unfollow(game_session, namespace_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendUnfollowRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.unfollow(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzUnfollowResult.from_model(async_result.result), null)


func delete_friend(game_session, namespace_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendDeleteFriendRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.delete_friend(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzDeleteFriendResult.from_model(async_result.result), null)


func describe_friends(game_session, namespace_name, with_profile = null, limit = null, page_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendDescribeFriendsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.with_profile = with_profile
        request.limit = limit
        request.page_token = page_token
        return await _rest_client.describe_friends(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzDescribeFriendsResult.from_model(async_result.result), null)


func get_friend(game_session, namespace_name, target_user_id, with_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendGetFriendRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        request.with_profile = with_profile
        return await _rest_client.get_friend(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzGetFriendResult.from_model(async_result.result), null)


func delete_request(game_session, namespace_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendDeleteRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.delete_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzDeleteRequestResult.from_model(async_result.result), null)


func describe_send_requests(game_session, namespace_name, with_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendDescribeSendRequestsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.with_profile = with_profile
        return await _rest_client.describe_send_requests(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzDescribeSendRequestsResult.from_model(async_result.result), null)


func get_send_request(game_session, namespace_name, target_user_id, with_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendGetSendRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        request.with_profile = with_profile
        return await _rest_client.get_send_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzGetSendRequestResult.from_model(async_result.result), null)


func send_request(game_session, namespace_name, target_user_id, with_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendSendRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        request.with_profile = with_profile
        return await _rest_client.send_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzSendRequestResult.from_model(async_result.result), null)


func accept(game_session, namespace_name, from_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendAcceptRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.from_user_id = from_user_id
        return await _rest_client.accept_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzAcceptResult.from_model(async_result.result), null)


func describe_receive_requests(game_session, namespace_name, with_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendDescribeReceiveRequestsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.with_profile = with_profile
        return await _rest_client.describe_receive_requests(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzDescribeReceiveRequestsResult.from_model(async_result.result), null)


func get_receive_request(game_session, namespace_name, from_user_id, with_profile = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendGetReceiveRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.from_user_id = from_user_id
        request.with_profile = with_profile
        return await _rest_client.get_receive_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzGetReceiveRequestResult.from_model(async_result.result), null)


func reject(game_session, namespace_name, from_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendRejectRequestRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.from_user_id = from_user_id
        return await _rest_client.reject_request(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzRejectResult.from_model(async_result.result), null)


func get_black_list(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendDescribeBlackListRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.describe_black_list(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzGetBlackListResult.from_model(async_result.result), null)


func register_black_list(game_session, namespace_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendRegisterBlackListRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.register_black_list(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzRegisterBlackListResult.from_model(async_result.result), null)


func unregister_black_list(game_session, namespace_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FriendUnregisterBlackListRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.unregister_black_list(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FriendEzUnregisterBlackListResult.from_model(async_result.result), null)