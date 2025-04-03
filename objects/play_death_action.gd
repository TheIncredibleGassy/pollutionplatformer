class_name PlayDeathAction
extends ActionLeaf
## Plays a death animation and returns success when it is finished

var actor : Node

func before_run(p_actor: Node, _p_blackboard: Blackboard) -> void:
	actor = p_actor
	actor.velocity = Vector2.ZERO
	actor.sprite.play(GlobalNames.animations.death)
	actor.sprite.animation_finished.connect(_on_animation_finished)

func tick(_p_actor: Node, _blackboard: Blackboard) -> int:
	return RUNNING

func _on_animation_finished():
	actor.queue_free()
