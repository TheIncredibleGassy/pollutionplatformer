class_name Hurtbox2D
extends Area2D
## Where an object can take damage

signal was_hit(hit_data : HitData)

## Stats of the active object that damage can be dealt to on hit
@export var health : Health
@export var body : CharacterBody2D
@export var invincible : bool

func get_hittable() -> bool:
	return health.current_health > 0 && not invincible

## Tests if the hurtbox is hittable before hitting the object
##
## Returns the hit data if hit was successful
func try_hit(p_hitbox : Hitbox2D, p_weapon_stats : WeaponStats) -> HitData:
	if not get_hittable():
		return null
		
	return _hit(p_hitbox, p_weapon_stats)

## Hits an object, creates a hit data from the hit, and returns it
func _hit(p_hitbox : Hitbox2D, p_weapon_stats : WeaponStats) -> HitData:
	var hit_data = HitData.new(p_hitbox, self, p_weapon_stats)
	var old = health.current_health
	health.current_health -= hit_data.amount
	var actual_change = -1 * (old - health.current_health)
	hit_data.actual_change = actual_change
	was_hit.emit(hit_data)
	return hit_data
