extends Node

@export var blackboard : Blackboard
@export var health : Health :
	set(value):
		if is_instance_valid(health):
			health.is_alive_changed.disconnect(_on_is_alive_changed)

		health = value
		
		if is_instance_valid(health):
			health.is_alive_changed.connect(_on_is_alive_changed)
			
@export var hurtbox : Hurtbox2D :
	set(value):
		if is_instance_valid(hurtbox):
			hurtbox.was_hit.disconnect(_on_was_hit)
			
		hurtbox = value
		
		if is_instance_valid(hurtbox):
			hurtbox.was_hit.connect(_on_was_hit)

func _on_is_alive_changed(p_value : bool):
	blackboard.set_value(GlobalNames.keys.is_alive, p_value)

## Set the hit data on the blackboard to process only if the hit
## has a duration
func _on_was_hit(p_hit_data : HitData):
	blackboard.set_value(GlobalNames.keys.hit_data, p_hit_data)
