# GS2-Realtime object synchronization sample (not part of the addon).
#
# Moves a paddle with WASD / the arrow keys or by dragging it with the mouse (Unity's
# PaddleMovement). It knows nothing of the network: the paddle's Gs2NetworkEntity lists this
# node in controlled_nodes, so it runs only while this client holds the paddle's lease, and the
# paddle's Gs2NetworkTransform2D sends the position it sets.
extends Node


## The paddle's half of the board, in pixels (the rules clamp to the same bounds).
@export var min_x := -555.0
@export var max_x := -45.0
@export var min_y := -275.0
@export var max_y := 275.0
## Pixels per second.
@export var speed := 900.0


func _process(delta: float) -> void:
    var keys := Vector2(_axis(KEY_D, KEY_A, "ui_right", "ui_left"), _axis(KEY_S, KEY_W, "ui_down", "ui_up"))
    if keys != Vector2.ZERO:
        move(keys.limit_length(1.0) * speed * delta)
    var paddle := get_parent() as Node2D
    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and paddle.get_viewport().gui_get_hovered_control() == null:
        move((paddle.get_global_mouse_position() - paddle.global_position).limit_length(speed * delta))


## Moves the paddle, kept inside its half (the buttons call it too).
func move(delta: Vector2) -> void:
    var paddle := get_parent() as Node2D
    var p := paddle.global_position + delta
    paddle.global_position = Vector2(clampf(p.x, min_x, max_x), clampf(p.y, min_y, max_y))


static func _axis(positive_key: Key, negative_key: Key, positive_action: StringName, negative_action: StringName) -> float:
    var value := 0.0
    if Input.is_physical_key_pressed(positive_key) or Input.is_action_pressed(positive_action):
        value += 1.0
    if Input.is_physical_key_pressed(negative_key) or Input.is_action_pressed(negative_action):
        value -= 1.0
    return value
