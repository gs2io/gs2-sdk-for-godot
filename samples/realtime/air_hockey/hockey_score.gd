# GS2-Realtime object synchronization sample (not part of the addon).
#
# The puck's scores as plain presentation state (Unity's HockeyScore): the Puck prefab's
# Gs2NetworkEntity sets them with property bindings of the PuckState fields.
extends Node


var blue := 0
var red := 0
## 0: paused, 1: playing, 2: serving after a goal.
var phase := 0
var hits := 0


func set_blue(value: int) -> void:
    blue = value


func set_red(value: int) -> void:
    red = value


func set_phase(value: int) -> void:
    phase = value


func set_hits(value: int) -> void:
    hits = value
