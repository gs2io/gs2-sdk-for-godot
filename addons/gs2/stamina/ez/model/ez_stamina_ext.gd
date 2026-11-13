class_name Gs2StaminaEzStaminaExt
extends RefCounted


# now_unix_ms uses the session clock: UTC plus the access token's time offset.
# Predict on a copy so the cached server response remains authoritative.
static func predict_recovery(stamina: Gs2StaminaEzStamina, now_unix_ms: int) -> Gs2StaminaEzStamina:
    if next_recovery_at(stamina) == 0 or now_unix_ms < stamina.next_recover_at:
        return stamina
    var interval_ms: int = stamina.recover_interval_minutes * 60000
    var steps: int = 1 + (now_unix_ms - stamina.next_recover_at) / interval_ms
    if stamina.recover_value > 0:
        var steps_to_full: int = (stamina.max_value - stamina.value + stamina.recover_value - 1) / stamina.recover_value
        steps = mini(steps, steps_to_full)
    var predicted := Gs2StaminaEzStamina.from_model(stamina.to_model())
    predicted.value = mini(stamina.max_value, stamina.value + steps * stamina.recover_value)
    predicted.next_recover_at = 0 if predicted.value >= stamina.max_value else stamina.next_recover_at + steps * interval_ms
    return predicted


static func next_recovery_at(stamina: Gs2StaminaEzStamina) -> int:
    if stamina == null or stamina.next_recover_at <= 0 or stamina.value >= stamina.max_value or stamina.recover_interval_minutes <= 0:
        return 0
    return stamina.next_recover_at
