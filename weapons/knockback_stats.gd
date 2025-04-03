class_name KnockbackStats
extends Resource

@export var force 		: float = 100.0
@export var duration 	: float = 0.25

## [Optional] - Where X is time elapsed of duration and Y is a multiplier for the force at the given time
@export var curve		: Curve
