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
class_name Gs2SeasonRatingCreateMatchSessionRequest
extends Gs2Request


var namespace_name = null
var session_name = null
var ttl_seconds = null


func with_namespace_name(v) -> Gs2SeasonRatingCreateMatchSessionRequest:
    namespace_name = v
    return self


func with_session_name(v) -> Gs2SeasonRatingCreateMatchSessionRequest:
    session_name = v
    return self


func with_ttl_seconds(v) -> Gs2SeasonRatingCreateMatchSessionRequest:
    ttl_seconds = v
    return self


static func from_dict(data) -> Gs2SeasonRatingCreateMatchSessionRequest:
    if data == null:
        return null
    var ret = Gs2SeasonRatingCreateMatchSessionRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.session_name = null if data.get("sessionName") == null else str(data.get("sessionName"))
    ret.ttl_seconds = null if data.get("ttlSeconds") == null else int(data.get("ttlSeconds"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["sessionName"] = session_name
    ret["ttlSeconds"] = ttl_seconds
    return ret