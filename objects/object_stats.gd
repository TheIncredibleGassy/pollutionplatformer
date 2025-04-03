class_name ObjectStats
extends Resource
## Statistics about an object

@export var max_health : int = 100
@export var knockback_multiplier : float = 1.0
@export var types : Array[GameObjectType] :
	set(value):
		if value.is_empty():
			return
			
		types = value
			
func _init() -> void:
	if not resource_local_to_scene:
		push_warning("Resource not local to scene %s" % resource_path)
