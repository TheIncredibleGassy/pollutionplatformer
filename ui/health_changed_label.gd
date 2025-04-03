class_name HealthChangedLabel
extends Label

@export var timer : Timer
@export var move_speed = Vector2(0, -75)
@export var game_colors : GameColors

func _ready() -> void:
	timer.timeout.connect(_on_timeout)
	
func _process(delta: float) -> void:
	global_position += move_speed * delta

func set_health_text(p_health_change : int):
	text = str(p_health_change)

	if p_health_change < 0:
		self_modulate = game_colors.negative_health
	else:
		self_modulate = game_colors.positive_health

func _on_timeout():
	queue_free()
