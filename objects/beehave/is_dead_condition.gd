class_name IsDeadCondition
extends ConditionLeaf

func tick(_p_actor : Node, p_blackboard : Blackboard):
	var is_dead = not p_blackboard.get_value(GlobalNames.keys.is_alive, true)
	
	if is_dead:
		return SUCCESS
	else:
		return FAILURE
