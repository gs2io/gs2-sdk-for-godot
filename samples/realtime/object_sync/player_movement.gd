# GS2-Realtime object synchronization sample (not part of the addon).
#
# Moves this client's own player with WASD / the arrow keys. The Player prefab's
# Gs2NetworkEntity lists this node in controlled_nodes, so it runs only for the player's owner;
# the prefab's Gs2NetworkTransform3D sends the position it sets.
extends Node


## Metres per second.
@export var speed := 3.0


func _process(delta: float) -> void:
    var move := Vector2(_axis(KEY_D, KEY_A, "ui_right", "ui_left"), _axis(KEY_S, KEY_W, "ui_down", "ui_up"))
    if move != Vector2.ZERO:
        step(Vector3(move.x, 0, move.y).limit_length(1.0) * speed * delta)


## Moves the player (the buttons call it too).
func step(delta: Vector3) -> void:
    var player := get_parent() as Node3D
    player.position += delta


static func _axis(positive_key: Key, negative_key: Key, positive_action: StringName, negative_action: StringName) -> float:
    var value := 0.0
    if Input.is_physical_key_pressed(positive_key) or Input.is_action_pressed(positive_action):
        value += 1.0
    if Input.is_physical_key_pressed(negative_key) or Input.is_action_pressed(negative_action):
        value -= 1.0
    return value
