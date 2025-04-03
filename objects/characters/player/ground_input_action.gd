class_name GroundInputAction
extends ActionLeaf
## Gives player controls for ground state input

@export var shooter : Shooter
@export var actions : PlayerInputActions

var active = false
var player : Player

func before_run(p_actor: Node, _p_blackboard: Blackboard) -> void:
	p_actor.sprite.play(GlobalNames.animations.run)
	active = true
	player = p_actor as Player
	
func after_run(_p_actor: Node, _p_blackboard: Blackboard) -> void:
	active = false

func tick(_p_actor: Node, _p_blackboard: Blackboard) -> int:
	if not active:
		return FAILURE
	
	if player.velocity.x == 0:
		player.sprite.stop()
	else:
		player.sprite.play(GlobalNames.animations.run)
	
	player.direction = Input.get_vector(actions.left, actions.right, actions.up, actions.down)
	player.walk()
	
	return RUNNING
	
func interrupt(_p_actor : Node, _p_blackboard : Blackboard) -> void:
	active = false
	
func _unhandled_input(event: InputEvent) -> void:
	if not active:
		return
		
	if event.is_action_pressed(actions.jump):
		player.try_jump()

	if event.is_action_pressed(actions.shoot):
		shooter.try_shoot()
