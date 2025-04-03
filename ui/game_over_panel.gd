extends Control

@export var visible_ui : Control
@export var animation_player : AnimationPlayer

@export var combat_state : CombatState :
	set(value):
		if is_instance_valid(combat_state):
			combat_state.game_over.disconnect(_on_game_over)
		
		combat_state = value

		if is_instance_valid(combat_state):
			combat_state.game_over.connect(_on_game_over)

func _ready() -> void:
	visible_ui.hide()

func _on_game_over():
	visible_ui.show()
	animation_player.play("show")
