class_name Projectile
extends RigidBody2D
## Moving object launched from some source that can collide with other objects
## within the scene

@export var remove_on_hit : bool = true
@export_range(0, 300, .2, "or_greater") var initial_velocity : float = 300.0
@export var hitbox : Hitbox2D :
	set(value):
		if is_instance_valid(hitbox):
			hitbox.hit.disconnect(_on_hit)
		
		hitbox = value
		
		if is_instance_valid(hitbox):
			hitbox.hit.connect(_on_hit)

func launch(p_move_direction : Vector2):
	linear_velocity = initial_velocity * p_move_direction

func _on_hit(_p_hit_data : HitData):
	queue_free()
