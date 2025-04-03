class_name IsHitCondition
extends ConditionLeaf

func tick(_p_actor : Node, p_blackboard : Blackboard):
	var hit_data = p_blackboard.get_value(GlobalNames.keys.hit_data)
	
	if hit_data:
		return SUCCESS
	else:
		return FAILURE
