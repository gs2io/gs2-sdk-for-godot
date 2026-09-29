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

##   var ez = Gs2EzDomain.new(connection)
##   var result = await ez.account.namespace_("game-0001").me(game_session).account().model()
class_name Gs2EzDomain
extends RefCounted


var gs2: Gs2Domain
var super_: Gs2Domain
var connection: Gs2Connection

var account: Gs2AccountEzDomain
var ad_reward: Gs2AdRewardEzDomain
var auth: Gs2AuthEzDomain
var buff: Gs2BuffEzDomain
var chat: Gs2ChatEzDomain
var datastore: Gs2DatastoreEzDomain
var dictionary: Gs2DictionaryEzDomain
var distributor: Gs2DistributorEzDomain
var enchant: Gs2EnchantEzDomain
var enhance: Gs2EnhanceEzDomain
var exchange: Gs2ExchangeEzDomain
var experience: Gs2ExperienceEzDomain
var formation: Gs2FormationEzDomain
var freeze: Gs2FreezeEzDomain
var friend: Gs2FriendEzDomain
var gateway: Gs2GatewayEzDomain
var grade: Gs2GradeEzDomain
var guard: Gs2GuardEzDomain
var guild: Gs2GuildEzDomain
var idle: Gs2IdleEzDomain
var inbox: Gs2InboxEzDomain
var inventory: Gs2InventoryEzDomain
var job_queue: Gs2JobQueueEzDomain
var limit: Gs2LimitEzDomain
var log: Gs2LogEzDomain
var login_reward: Gs2LoginRewardEzDomain
var lottery: Gs2LotteryEzDomain
var matchmaking: Gs2MatchmakingEzDomain
var mega_field: Gs2MegaFieldEzDomain
var mission: Gs2MissionEzDomain
var money: Gs2MoneyEzDomain
var money2: Gs2Money2EzDomain
var news: Gs2NewsEzDomain
var quest: Gs2QuestEzDomain
var ranking: Gs2RankingEzDomain
var ranking2: Gs2Ranking2EzDomain
var realtime: Gs2RealtimeEzDomain
var schedule: Gs2ScheduleEzDomain
var season_rating: Gs2SeasonRatingEzDomain
var serial_key: Gs2SerialKeyEzDomain
var showcase: Gs2ShowcaseEzDomain
var skill_tree: Gs2SkillTreeEzDomain
var stamina: Gs2StaminaEzDomain
var state_machine: Gs2StateMachineEzDomain
var version: Gs2VersionEzDomain


func _init(connection_: Gs2Connection, distributor_namespace_name = null):
    connection = connection_
    gs2 = Gs2Domain.new(
        connection_.rest_session,
        connection_.web_socket_session,
        distributor_namespace_name
    )
    super_ = gs2
    account = Gs2AccountEzDomain.new(self)
    ad_reward = Gs2AdRewardEzDomain.new(self)
    auth = Gs2AuthEzDomain.new(self)
    buff = Gs2BuffEzDomain.new(self)
    chat = Gs2ChatEzDomain.new(self)
    datastore = Gs2DatastoreEzDomain.new(self)
    dictionary = Gs2DictionaryEzDomain.new(self)
    distributor = Gs2DistributorEzDomain.new(self)
    enchant = Gs2EnchantEzDomain.new(self)
    enhance = Gs2EnhanceEzDomain.new(self)
    exchange = Gs2ExchangeEzDomain.new(self)
    experience = Gs2ExperienceEzDomain.new(self)
    formation = Gs2FormationEzDomain.new(self)
    freeze = Gs2FreezeEzDomain.new(self)
    friend = Gs2FriendEzDomain.new(self)
    gateway = Gs2GatewayEzDomain.new(self)
    grade = Gs2GradeEzDomain.new(self)
    guard = Gs2GuardEzDomain.new(self)
    guild = Gs2GuildEzDomain.new(self)
    idle = Gs2IdleEzDomain.new(self)
    inbox = Gs2InboxEzDomain.new(self)
    inventory = Gs2InventoryEzDomain.new(self)
    job_queue = Gs2JobQueueEzDomain.new(self)
    limit = Gs2LimitEzDomain.new(self)
    log = Gs2LogEzDomain.new(self)
    login_reward = Gs2LoginRewardEzDomain.new(self)
    lottery = Gs2LotteryEzDomain.new(self)
    matchmaking = Gs2MatchmakingEzDomain.new(self)
    mega_field = Gs2MegaFieldEzDomain.new(self)
    mission = Gs2MissionEzDomain.new(self)
    money = Gs2MoneyEzDomain.new(self)
    money2 = Gs2Money2EzDomain.new(self)
    news = Gs2NewsEzDomain.new(self)
    quest = Gs2QuestEzDomain.new(self)
    ranking = Gs2RankingEzDomain.new(self)
    ranking2 = Gs2Ranking2EzDomain.new(self)
    realtime = Gs2RealtimeEzDomain.new(self)
    schedule = Gs2ScheduleEzDomain.new(self)
    season_rating = Gs2SeasonRatingEzDomain.new(self)
    serial_key = Gs2SerialKeyEzDomain.new(self)
    showcase = Gs2ShowcaseEzDomain.new(self)
    skill_tree = Gs2SkillTreeEzDomain.new(self)
    stamina = Gs2StaminaEzDomain.new(self)
    state_machine = Gs2StateMachineEzDomain.new(self)
    version = Gs2VersionEzDomain.new(self)


func dispatch(game_session) -> Gs2AsyncResult:
    return await gs2.dispatch(game_session.access_token)


func load_user_data(game_session) -> Gs2AsyncResult:
    return await gs2.load_user_data(game_session.access_token)


func clear_cache() -> void:
    gs2.clear_cache()
