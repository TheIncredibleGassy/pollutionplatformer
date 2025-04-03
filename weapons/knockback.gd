class_name Knockback
extends Object

var direction : Vector2
var stats : KnockbackStats
var body : PhysicsBody2D
var time_start_msecs : float

func _init(p_physics_body : PhysicsBody2D, p_hit_direction : Vector2, p_knockback_stats : KnockbackStats) -> void:
	body = p_physics_body
	direction = get_move_direction(p_hit_direction)
	stats = p_knockback_stats
	time_start_msecs = Time.get_ticks_msec()

## Gets the velocity at a moment in time_elapsed adjusted
## by a curve if one exists in the knockback stats
func get_velocity() -> Vector2:
	var velocity = direction * stats.force
	var time_elapsed_secs = (Time.get_ticks_msec() - time_start_msecs) / 1000
	var percentage_elapsed = time_elapsed_secs / stats.duration
	
	if stats.curve:
		var sample_value = stats.curve.sample(percentage_elapsed)
		velocity *= sample_value
		
	return velocity

func get_move_direction(p_hit_direction : Vector2) -> Vector2:
	var adjusted_direction = p_hit_direction
	
	if body is CharacterBody2D && body.is_on_floor:
		var sign_x = sign(p_hit_direction.x)
		
		if sign_x == 1:
			adjusted_direction = Vector2.RIGHT
		elif sign_x == -1:
			adjusted_direction = Vector2.LEFT
	
	return adjusted_direction
