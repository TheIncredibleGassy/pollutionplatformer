class_name HitData
extends Object
## Data properties concerning when a hurtbox is hit by a hitbox move, attack, or action

## The hitbox which hit the hurtbox with a move or attack
var hitbox 				: Hitbox2D

## The receiving hurtbox of the move or attack
var hurtbox 			: Hurtbox2D

## The amount of health change expected on the target
var amount 				: int

## The actual amount of health change that resulted on the target
var actual_change		: int

## The force and duration of an expected knockback on the hurtbox's character
var knockback : Knockback

func _init(p_hitbox : Hitbox2D, p_hurtbox : Hurtbox2D, p_weapon_stats : WeaponStats) -> void:
		hitbox = p_hitbox
		hurtbox = p_hurtbox
		amount = p_weapon_stats.damage
		
		if p_weapon_stats.knockback_stats:
			var hit_direction = hitbox.global_position.direction_to(hurtbox.body.global_position)
			knockback = Knockback.new(p_hurtbox.body, hit_direction, p_weapon_stats.knockback_stats)
