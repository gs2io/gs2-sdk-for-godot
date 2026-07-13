# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights Reserved.
class_name Gs2StateMachineSharedRandom
extends RefCounted


const ROUNDS = 10
const U32_MASK = 0xffffffff
const ROUND_CONSTANT_0 = 0xD2511F53
const ROUND_CONSTANT_1 = 0xCD9E8D57
const WEYL_CONSTANT = 0x9E3779B9
const WEYL_INCREMENT = 0xBB67AE85


var _seed = [0, 0]
var _counter = [0, 0]


func _init(seed: int, category: int) -> void:
    _seed = [seed & U32_MASK, category & U32_MASK]


func set_counter(counter: int) -> void:
    _counter[0] = counter & U32_MASK


func next() -> int:
    var counter = _counter.duplicate()
    var key = _seed.duplicate()
    for _round in ROUNDS:
        counter = _round_function(counter, key)
        key = _key_schedule(key)
    _counter[0] = (_counter[0] + 1) & U32_MASK
    if _counter[0] == 0:
        _counter[1] = (_counter[1] + 1) & U32_MASK
    return counter[0]


func _round_function(value: Array, key: Array) -> Array:
    return [
        (_multiply_u32(ROUND_CONSTANT_0, value[0]) ^ value[1] ^ key[0]) & U32_MASK,
        (_multiply_u32(ROUND_CONSTANT_1, value[1]) ^ key[1]) & U32_MASK,
    ]


func _key_schedule(key: Array) -> Array:
    return [
        (key[0] + WEYL_CONSTANT) & U32_MASK,
        (key[1] + WEYL_INCREMENT) & U32_MASK,
    ]


# Splitting the product avoids signed 64-bit overflow before applying uint32 wraparound.
func _multiply_u32(left: int, right: int) -> int:
    var left_low = left & 0xffff
    var left_high = (left >> 16) & 0xffff
    var right_low = right & 0xffff
    var right_high = (right >> 16) & 0xffff
    return (left_low * right_low + ((left_high * right_low + left_low * right_high) << 16)) & U32_MASK
