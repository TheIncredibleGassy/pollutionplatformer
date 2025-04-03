class_name CharacterStats
extends ObjectStats

@export_range(0, 100, .2, "or_greater") var walk_speed 	: float = 60.0
@export_range(0, 100, .2, "or_greater") var run_speed	: float = 120.0

@export var can_ground_jump : bool = false
@export_range(0, 100, .2, "or_greater") var jump_force : float = 350.0
