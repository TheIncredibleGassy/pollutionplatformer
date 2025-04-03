class_name PlatformerCharacter2D
extends CharacterBody2D

signal direction_changed(direction : Vector2)

@export var stats : CharacterStats
@export var sprite : CanvasItem
@export var health : Health :
	set(value):
		if is_instance_valid(health):
			health.is_alive_changed.disconnect(_on_is_alive_changed)
		
		health = value
		
		if is_instance_valid(health):
			health.is_alive_changed.connect(_on_is_alive_changed)
			
@export var combat_state : CombatState

var direction : Vector2 :
	set(value):
		if direction == value:
			return
		
		direction = value
		direction_changed.emit(direction)

func _ready() -> void:
	if stats.types.is_empty():
		push_warning("No game object type assigned to %s stats." % name)

func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	move_and_slide()

## Makes the character jump if possible
##
## Returns true if jump successful or false if failed
func try_jump() -> bool:
	if stats.can_ground_jump && is_on_floor():
		_jump()
		return true
	
	return false
		
## Execute a ground jump
func _jump():
	velocity.y -= stats.jump_force

func _apply_gravity(delta : float):
	var gravity = get_gravity()
	velocity.x += gravity.x * delta
	velocity.y += gravity.y * delta

func _on_is_alive_changed(p_is_alive : bool):
	if not p_is_alive:
		combat_state.report_death(self)
