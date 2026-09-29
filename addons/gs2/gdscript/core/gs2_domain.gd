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

class_name Gs2Domain
extends RefCounted


signal notification_received(message: Gs2NotificationMessage)

var cache: Gs2CacheDatabase
var rest_session: Gs2RestSession
var web_socket_session: Gs2WebSocketSession
var default_context_stack: Variant = null
var transaction_configuration: Gs2TransactionConfiguration
var job_queue_domain: Gs2JobQueueExecutor
var _last_ping_at: int = 0

var account: Gs2Account
var ad_reward: Gs2AdReward
var auth: Gs2Auth
var buff: Gs2Buff
var chat: Gs2Chat
var datastore: Gs2Datastore
var deploy: Gs2Deploy
var dictionary: Gs2Dictionary
var distributor: Gs2Distributor
var enchant: Gs2Enchant
var enhance: Gs2Enhance
var exchange: Gs2Exchange
var experience: Gs2Experience
var formation: Gs2Formation
var freeze: Gs2Freeze
var friend: Gs2Friend
var gateway: Gs2Gateway
var grade: Gs2Grade
var guard: Gs2Guard
var guild: Gs2Guild
var identifier: Gs2Identifier
var idle: Gs2Idle
var inbox: Gs2Inbox
var inventory: Gs2Inventory
var job_queue: Gs2JobQueue
var key: Gs2Key
var limit: Gs2Limit
var lock: Gs2Lock
var log: Gs2Log
var login_reward: Gs2LoginReward
var lottery: Gs2Lottery
var matchmaking: Gs2Matchmaking
var mega_field: Gs2MegaField
var mission: Gs2Mission
var money: Gs2Money
var money2: Gs2Money2
var news: Gs2News
var quest: Gs2Quest
var ranking: Gs2Ranking
var ranking2: Gs2Ranking2
var realtime: Gs2Realtime
var schedule: Gs2Schedule
var script_: Gs2Script
var season_rating: Gs2SeasonRating
var serial_key: Gs2SerialKey
var showcase: Gs2Showcase
var skill_tree: Gs2SkillTree
var stamina: Gs2Stamina
var state_machine: Gs2StateMachine
var version: Gs2Version


func _init(
    session: Gs2RestSession,
    wssession: Gs2WebSocketSession = null,
    distributor_namespace_name = null
):
    rest_session = session
    web_socket_session = wssession
    cache = Gs2CacheDatabase.new()
    transaction_configuration = Gs2TransactionConfiguration.new()
    transaction_configuration.namespace_name = distributor_namespace_name
    transaction_configuration.verify_action_event_handler = update_cache_from_consume_action
    transaction_configuration.consume_action_event_handler = update_cache_from_consume_action
    transaction_configuration.acquire_action_event_handler = update_cache_from_acquire_action
    job_queue_domain = Gs2JobQueueExecutor.new(self)
    _last_ping_at = Gs2CacheDatabase.now_ms()
    account = Gs2Account.new(self)
    ad_reward = Gs2AdReward.new(self)
    auth = Gs2Auth.new(self)
    buff = Gs2Buff.new(self)
    chat = Gs2Chat.new(self)
    datastore = Gs2Datastore.new(self)
    deploy = Gs2Deploy.new(self)
    dictionary = Gs2Dictionary.new(self)
    distributor = Gs2Distributor.new(self)
    enchant = Gs2Enchant.new(self)
    enhance = Gs2Enhance.new(self)
    exchange = Gs2Exchange.new(self)
    experience = Gs2Experience.new(self)
    formation = Gs2Formation.new(self)
    freeze = Gs2Freeze.new(self)
    friend = Gs2Friend.new(self)
    gateway = Gs2Gateway.new(self)
    grade = Gs2Grade.new(self)
    guard = Gs2Guard.new(self)
    guild = Gs2Guild.new(self)
    identifier = Gs2Identifier.new(self)
    idle = Gs2Idle.new(self)
    inbox = Gs2Inbox.new(self)
    inventory = Gs2Inventory.new(self)
    job_queue = Gs2JobQueue.new(self)
    key = Gs2Key.new(self)
    limit = Gs2Limit.new(self)
    lock = Gs2Lock.new(self)
    log = Gs2Log.new(self)
    login_reward = Gs2LoginReward.new(self)
    lottery = Gs2Lottery.new(self)
    matchmaking = Gs2Matchmaking.new(self)
    mega_field = Gs2MegaField.new(self)
    mission = Gs2Mission.new(self)
    money = Gs2Money.new(self)
    money2 = Gs2Money2.new(self)
    news = Gs2News.new(self)
    quest = Gs2Quest.new(self)
    ranking = Gs2Ranking.new(self)
    ranking2 = Gs2Ranking2.new(self)
    realtime = Gs2Realtime.new(self)
    schedule = Gs2Schedule.new(self)
    script_ = Gs2Script.new(self)
    season_rating = Gs2SeasonRating.new(self)
    serial_key = Gs2SerialKey.new(self)
    showcase = Gs2Showcase.new(self)
    skill_tree = Gs2SkillTree.new(self)
    stamina = Gs2Stamina.new(self)
    state_machine = Gs2StateMachine.new(self)
    version = Gs2Version.new(self)
    if wssession != null:
        wssession.notification_received.connect(_on_notification)


func service_domain(service_class_name: String):
    var property_name = service_class_name.trim_prefix("Gs2").to_snake_case().replace("_2", "2")
    if property_name == "script":
        property_name = "script_"
    for property in get_property_list():
        if property.name == property_name:
            var initialized_domain = get(property_name)
            if initialized_domain != null:
                return initialized_domain
            break
    var script = Gs2ClassRegistry.resolve(service_class_name)
    if script == null:
        return null
    return script.new(self)


func _on_notification(message: Gs2NotificationMessage) -> void:
    if message == null or message.subject == null or not (message.subject is String) or not message.subject.contains(":"):
        return
    var service = message.subject.substr(0, message.subject.find(":"))
    var method = message.subject.substr(message.subject.find(":") + 1)
    var domain = service_domain(service)
    if domain != null and domain.has_method("handle_notification"):
        domain.handle_notification(method, message.payload)
    notification_received.emit(message)


func clear_cache() -> void:
    cache.clear()


func clear_cache_and_all_unsubscribe() -> void:
    cache.clear_and_all_unsubscribe()


func dispatch(access_token) -> Gs2AsyncResult:
    if Gs2CacheDatabase.now_ms() - _last_ping_at > 5 * 60 * 1000:
        if web_socket_session != null and web_socket_session.has_method("ping"):
            web_socket_session.ping()
        _last_ping_at = Gs2CacheDatabase.now_ms()
    var distributor = Gs2ClassRegistry.resolve("Gs2Distributor")
    if distributor != null:
        var distributor_result = await distributor.dispatch(self, access_token)
        if distributor_result.error != null:
            return distributor_result
    var job_queue = Gs2ClassRegistry.resolve("Gs2JobQueue")
    if job_queue != null:
        var job_queue_result = await job_queue.dispatch(self, access_token)
        if job_queue_result.error != null:
            return job_queue_result
    while true:
        var run_result = await job_queue_domain.run(access_token)
        if run_result.error != null:
            return run_result
        if run_result.result:
            break
    return Gs2AsyncResult.new(null, null)


func load_user_data(access_token) -> Gs2AsyncResult:
    assert(access_token != null)
    return await distributor.load_user_data(access_token)


static func user_data_service_class_prefix(service: String) -> String:
    var prefix = "Gs2"
    for part in service.split("_"):
        if part == "":
            continue
        prefix += part.substr(0, 1).to_upper() + part.substr(1)
    return prefix


func put_user_data(service, namespace_name, user_id, time_offset, kind, payload):
    if service == null or kind == null:
        return null
    var service_cache = Gs2ClassRegistry.resolve(user_data_service_class_prefix(service) + "ServiceCache")
    if service_cache == null or not _script_has_method(service_cache, "put_user_data"):
        return null
    return service_cache.put_user_data(cache, namespace_name, user_id, time_offset, kind, payload)


func set_list_cached(service, time_offset, kind, parent_key) -> bool:
    if service == null or kind == null or parent_key == null:
        return false
    var service_cache = Gs2ClassRegistry.resolve(user_data_service_class_prefix(service) + "ServiceCache")
    if service_cache == null or not _script_has_method(service_cache, "set_list_cached"):
        return false
    return service_cache.set_list_cached(cache, time_offset, kind, parent_key)


static func _script_has_method(script, method_name: String) -> bool:
    if script == null:
        return false
    for m in script.get_script_method_list():
        if m.name == method_name:
            return true
    return false


func dispatch_by_user_id(user_id) -> Gs2AsyncResult:
    if Gs2CacheDatabase.now_ms() - _last_ping_at > 5 * 60 * 1000:
        if web_socket_session != null and web_socket_session.has_method("ping"):
            web_socket_session.ping()
        _last_ping_at = Gs2CacheDatabase.now_ms()
    while true:
        var run_result = await job_queue_domain.run_by_user_id(user_id)
        if run_result.error != null:
            return run_result
        if run_result.result:
            break
    return Gs2AsyncResult.new(null, null)


func update_cache_from_acquire_action(cache_, transaction_id, time_offset, action, request, result) -> void:
    if result == null:
        return
    if action == null or not (action is String) or not action.contains(":"):
        return
    var service = action.substr(0, action.find(":"))
    var method = action.substr(action.find(":") + 1)
    var domain = service_domain(service)
    if domain != null and domain.has_method("update_cache_from_stamp_sheet"):
        domain.update_cache_from_stamp_sheet(transaction_id, time_offset, method, request, result)


func update_cache_from_consume_action(cache_, transaction_id, time_offset, action, request, result) -> void:
    if action == null or not (action is String) or not action.contains(":"):
        return
    var service = action.substr(0, action.find(":"))
    var method = action.substr(action.find(":") + 1)
    var domain = service_domain(service)
    if domain != null and domain.has_method("update_cache_from_stamp_task"):
        domain.update_cache_from_stamp_task(transaction_id, time_offset, method, request, result)


func push_job_queue(namespace_name) -> void:
    job_queue_domain.push(namespace_name)


func update_cache_from_job_result(job, result, time_offset = null) -> void:
    if job == null or job.script_id == null:
        return
    var parts = job.script_id.split(":")
    if parts.size() > 4 and parts[3] == "system":
        var script_name = job.script_id.substr(job.script_id.rfind(":") + 1)
        if script_name.begins_with("execute_"):
            var script_name_temp = script_name.replace("execute_", "")
            var service = script_name_temp.split("_")[0]
            var method = script_name_temp.substr(script_name_temp.find("_") + 1)
            var domain = service_domain("Gs2" + service.to_pascal_case())
            if domain != null and domain.has_method("update_cache_from_job_result"):
                domain.update_cache_from_job_result(method, time_offset, job, result)


static func yield_frame() -> void:
    var loop = Engine.get_main_loop()
    if loop is SceneTree:
        await loop.process_frame


static func wait_ms(ms) -> void:
    var deadline = Gs2CacheDatabase.now_ms() + ms
    while Gs2CacheDatabase.now_ms() < deadline:
        await yield_frame()
