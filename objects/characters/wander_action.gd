class_name WanderAction
extends ActionLeaf
## Randomly move PlatformerCharacter2D left and right after timer expires

@export var timer : Timer
@export var sprite : AnimatedSprite2D

@onready var random_gen = RandomNumberGenerator.new()
var character : PlatformerCharacter2D

func before_run(p_actor: Node, _blackboard: Blackboard) -> void:
	character = p_actor as PlatformerCharacter2D
	sprite.play(GlobalNames.animations.walk)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	randomize_wandering()
	
func after_run(_actor: Node, _blackboard: Blackboard) -> void:
	timer.timeout.disconnect(_on_timer_timeout)

func tick(_p_actor: Node, p_blackboard : Blackboard) -> int:
	var is_alive = p_blackboard.get_value(GlobalNames.keys.is_alive)
	var hit_data : HitData = p_blackboard.get_value(GlobalNames.keys.hit_data)
	
	if is_alive == false || is_instance_valid(hit_data):
		return FAILURE
	
	return RUNNING
		
func randomize_wandering():
	var random_int = random_gen.randi()
	
	if random_int % 2 == 1:
		character.direction = Vector2.LEFT
	else:
		character.direction = Vector2.RIGHT
		
	character.velocity = character.direction * character.stats.walk_speed

func _on_timer_timeout():
	randomize_wandering()
	timer.start()
