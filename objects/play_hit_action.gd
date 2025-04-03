class_name PlayHitAction
extends ActionLeaf

@export var object_stats : ObjectStats

@onready var hit_timer = Timer.new()

var is_playing = false
var hit_data : HitData
var character : CharacterBody2D

func _ready() -> void:
	add_child(hit_timer)
	hit_timer.timeout.connect(_on_timeout)

func before_run(p_actor: Node, p_blackboard: Blackboard) -> void:
	character = p_actor as CharacterBody2D
	
	if character == null:
		push_error("Actor is not a CharacterBody2D")
	
	hit_data = p_blackboard.get_value(GlobalNames.keys.hit_data)
	assert(is_instance_valid(hit_data), "Hit data must be set for the play hit action to run.")
	
	if hit_data.knockback:
		p_actor.sprite.play(GlobalNames.animations.hit)
		hit_timer.start(hit_data.knockback.stats.duration)
		is_playing = true
		character.velocity = hit_data.knockback.get_velocity() * object_stats.knockback_multiplier
		prints(character.velocity)
	else:
		is_playing = false
		interrupt(p_actor, p_blackboard)
		
func after_run(_p_actor : Node, p_blackboard : Blackboard) -> void:
	hit_timer.stop()
	p_blackboard.set_value(GlobalNames.keys.hit_data, null)
	character.velocity = Vector2.ZERO

func tick(_p_actor: Node, _p_blackboard: Blackboard) -> int:
	if hit_data.knockback:
		character.velocity = hit_data.knockback.get_velocity() * object_stats.knockback_multiplier
	
	if is_playing:
		return RUNNING
	else:
		return SUCCESS

func interrupt(_p_actor : Node, _p_blackboard : Blackboard):
	return SUCCESS

func _on_timeout():
	is_playing = false
