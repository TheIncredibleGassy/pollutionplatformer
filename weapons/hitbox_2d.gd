class_name Hitbox2D
extends Area2D
## Area where on enter, can do damage to the object of a hurtbox

signal hit(hit_data : HitData)

@export var weapon_stats : WeaponStats

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(p_area : Area2D):
	var hurtbox = p_area as Hurtbox2D
	
	if not hurtbox:
		return
	
	var hit_data = hurtbox.try_hit(self, weapon_stats)
	
	if hit_data:
		hit.emit(hit_data)
