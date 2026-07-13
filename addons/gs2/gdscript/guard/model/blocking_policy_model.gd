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
class_name Gs2GuardBlockingPolicyModel
extends RefCounted


var pass_services = null
var default_restriction = null
var location_detection = null
var locations = null
var location_restriction = null
var anonymous_ip_detection = null
var anonymous_ip_restriction = null
var hosting_provider_ip_detection = null
var hosting_provider_ip_restriction = null
var reputation_ip_detection = null
var reputation_ip_restriction = null
var ip_addresses_detection = null
var ip_addresses = null
var ip_address_restriction = null


func with_pass_services(v) -> Gs2GuardBlockingPolicyModel:
    pass_services = v
    return self


func with_default_restriction(v) -> Gs2GuardBlockingPolicyModel:
    default_restriction = v
    return self


func with_location_detection(v) -> Gs2GuardBlockingPolicyModel:
    location_detection = v
    return self


func with_locations(v) -> Gs2GuardBlockingPolicyModel:
    locations = v
    return self


func with_location_restriction(v) -> Gs2GuardBlockingPolicyModel:
    location_restriction = v
    return self


func with_anonymous_ip_detection(v) -> Gs2GuardBlockingPolicyModel:
    anonymous_ip_detection = v
    return self


func with_anonymous_ip_restriction(v) -> Gs2GuardBlockingPolicyModel:
    anonymous_ip_restriction = v
    return self


func with_hosting_provider_ip_detection(v) -> Gs2GuardBlockingPolicyModel:
    hosting_provider_ip_detection = v
    return self


func with_hosting_provider_ip_restriction(v) -> Gs2GuardBlockingPolicyModel:
    hosting_provider_ip_restriction = v
    return self


func with_reputation_ip_detection(v) -> Gs2GuardBlockingPolicyModel:
    reputation_ip_detection = v
    return self


func with_reputation_ip_restriction(v) -> Gs2GuardBlockingPolicyModel:
    reputation_ip_restriction = v
    return self


func with_ip_addresses_detection(v) -> Gs2GuardBlockingPolicyModel:
    ip_addresses_detection = v
    return self


func with_ip_addresses(v) -> Gs2GuardBlockingPolicyModel:
    ip_addresses = v
    return self


func with_ip_address_restriction(v) -> Gs2GuardBlockingPolicyModel:
    ip_address_restriction = v
    return self


static func from_dict(data) -> Gs2GuardBlockingPolicyModel:
    if data == null:
        return null
    var ret = Gs2GuardBlockingPolicyModel.new()
    ret.pass_services = null if data.get("passServices") == null else data.get("passServices").map(func(v): return str(v))
    ret.default_restriction = null if data.get("defaultRestriction") == null else str(data.get("defaultRestriction"))
    ret.location_detection = null if data.get("locationDetection") == null else str(data.get("locationDetection"))
    ret.locations = null if data.get("locations") == null else data.get("locations").map(func(v): return str(v))
    ret.location_restriction = null if data.get("locationRestriction") == null else str(data.get("locationRestriction"))
    ret.anonymous_ip_detection = null if data.get("anonymousIpDetection") == null else str(data.get("anonymousIpDetection"))
    ret.anonymous_ip_restriction = null if data.get("anonymousIpRestriction") == null else str(data.get("anonymousIpRestriction"))
    ret.hosting_provider_ip_detection = null if data.get("hostingProviderIpDetection") == null else str(data.get("hostingProviderIpDetection"))
    ret.hosting_provider_ip_restriction = null if data.get("hostingProviderIpRestriction") == null else str(data.get("hostingProviderIpRestriction"))
    ret.reputation_ip_detection = null if data.get("reputationIpDetection") == null else str(data.get("reputationIpDetection"))
    ret.reputation_ip_restriction = null if data.get("reputationIpRestriction") == null else str(data.get("reputationIpRestriction"))
    ret.ip_addresses_detection = null if data.get("ipAddressesDetection") == null else str(data.get("ipAddressesDetection"))
    ret.ip_addresses = null if data.get("ipAddresses") == null else data.get("ipAddresses").map(func(v): return str(v))
    ret.ip_address_restriction = null if data.get("ipAddressRestriction") == null else str(data.get("ipAddressRestriction"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["passServices"] = pass_services
    ret["defaultRestriction"] = default_restriction
    ret["locationDetection"] = location_detection
    ret["locations"] = locations
    ret["locationRestriction"] = location_restriction
    ret["anonymousIpDetection"] = anonymous_ip_detection
    ret["anonymousIpRestriction"] = anonymous_ip_restriction
    ret["hostingProviderIpDetection"] = hosting_provider_ip_detection
    ret["hostingProviderIpRestriction"] = hosting_provider_ip_restriction
    ret["reputationIpDetection"] = reputation_ip_detection
    ret["reputationIpRestriction"] = reputation_ip_restriction
    ret["ipAddressesDetection"] = ip_addresses_detection
    ret["ipAddresses"] = ip_addresses
    ret["ipAddressRestriction"] = ip_address_restriction
    return ret