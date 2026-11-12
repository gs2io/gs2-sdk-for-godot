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
extends Gs2EzDomainCore


var gs2: Gs2Domain
var super_: Gs2Domain

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
    super(
        connection_,
        distributor_namespace_name,
        Gs2Domain.new(
            connection_.rest_session,
            connection_.web_socket_session,
            distributor_namespace_name
        )
    )
    gs2 = _gs2 as Gs2Domain
    super_ = gs2
    account = service_domain("Gs2AccountEzDomain")
    ad_reward = service_domain("Gs2AdRewardEzDomain")
    auth = service_domain("Gs2AuthEzDomain")
    buff = service_domain("Gs2BuffEzDomain")
    chat = service_domain("Gs2ChatEzDomain")
    datastore = service_domain("Gs2DatastoreEzDomain")
    dictionary = service_domain("Gs2DictionaryEzDomain")
    distributor = service_domain("Gs2DistributorEzDomain")
    enchant = service_domain("Gs2EnchantEzDomain")
    enhance = service_domain("Gs2EnhanceEzDomain")
    exchange = service_domain("Gs2ExchangeEzDomain")
    experience = service_domain("Gs2ExperienceEzDomain")
    formation = service_domain("Gs2FormationEzDomain")
    freeze = service_domain("Gs2FreezeEzDomain")
    friend = service_domain("Gs2FriendEzDomain")
    gateway = service_domain("Gs2GatewayEzDomain")
    grade = service_domain("Gs2GradeEzDomain")
    guard = service_domain("Gs2GuardEzDomain")
    guild = service_domain("Gs2GuildEzDomain")
    idle = service_domain("Gs2IdleEzDomain")
    inbox = service_domain("Gs2InboxEzDomain")
    inventory = service_domain("Gs2InventoryEzDomain")
    job_queue = service_domain("Gs2JobQueueEzDomain")
    limit = service_domain("Gs2LimitEzDomain")
    log = service_domain("Gs2LogEzDomain")
    login_reward = service_domain("Gs2LoginRewardEzDomain")
    lottery = service_domain("Gs2LotteryEzDomain")
    matchmaking = service_domain("Gs2MatchmakingEzDomain")
    mega_field = service_domain("Gs2MegaFieldEzDomain")
    mission = service_domain("Gs2MissionEzDomain")
    money = service_domain("Gs2MoneyEzDomain")
    money2 = service_domain("Gs2Money2EzDomain")
    news = service_domain("Gs2NewsEzDomain")
    quest = service_domain("Gs2QuestEzDomain")
    ranking = service_domain("Gs2RankingEzDomain")
    ranking2 = service_domain("Gs2Ranking2EzDomain")
    realtime = service_domain("Gs2RealtimeEzDomain")
    schedule = service_domain("Gs2ScheduleEzDomain")
    season_rating = service_domain("Gs2SeasonRatingEzDomain")
    serial_key = service_domain("Gs2SerialKeyEzDomain")
    showcase = service_domain("Gs2ShowcaseEzDomain")
    skill_tree = service_domain("Gs2SkillTreeEzDomain")
    stamina = service_domain("Gs2StaminaEzDomain")
    state_machine = service_domain("Gs2StateMachineEzDomain")
    version = service_domain("Gs2VersionEzDomain")
