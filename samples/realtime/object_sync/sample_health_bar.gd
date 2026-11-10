# GS2-Realtime object synchronization sample (not part of the addon).
#
# The enemy's health bar (Unity's SampleHealthBar). The Enemy prefab's Gs2NetworkEntity binds
# its Health field (EnemyState.realtimeschema: 0..1) to set_health with a property binding.
extends Node3D


## The latest health shown.
var health := 1.0


func set_health(value: float) -> void:
    health = value
    # A zero scale has no inverse; hide the bar instead.
    visible = value > 0.0
    scale = Vector3(maxf(value, 0.001), 1, 1)
