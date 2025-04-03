class_name InterruptOnHitAction
extends ActionLeaf

@export var hurtboxes : Array[Hurtbox2D]
@export var target_action : ActionLeaf

var actor : Node
var blackboard : Blackboard

func _ready() -> void:
	for hurtbox in hurtboxes:
		hurtbox.was_hit.connect(_on_was_hit)

func before_run(p_actor : Node, p_blackboard : Blackboard) -> void:
	actor = p_actor
	blackboard = p_blackboard
		
func tick(_p_actor : Node, _p_blackboard : Blackboard) -> int:
	return RUNNING

func _on_was_hit(_p_hit_data : HitData):
	target_action.interrupt(actor, blackboard)
