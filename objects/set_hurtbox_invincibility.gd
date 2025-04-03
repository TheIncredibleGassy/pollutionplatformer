class_name SetHurtboxInvincibility
extends ActionLeaf

@export var hurtboxes : Array[Hurtbox2D]
@export var invincible : bool

func tick(_p_actor : Node, _p_blackboard : Blackboard) -> int:
	# Start here
	for hurtbox in hurtboxes:
		if hurtbox.invincible != invincible:
			hurtbox.invincible = invincible
			print("Hurtbox Invincible: %s" % hurtbox.invincible)
	
	return SUCCESS
