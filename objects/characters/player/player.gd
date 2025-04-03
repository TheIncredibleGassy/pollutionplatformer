class_name Player
extends PlatformerCharacter2D

func _physics_process(delta: float) -> void:
	super(delta)

func walk():
	velocity.x = stats.walk_speed * direction.x
