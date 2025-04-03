extends Panel

@export var combat_state : CombatState :
	set(value):
		if is_instance_valid(combat_state):
			combat_state.enemies_died_changed.disconnect(_on_enemies_died_changed)
			combat_state.player_deaths_changed.disconnect(_on_player_deaths_changed)
		
		combat_state = value
		
		if is_instance_valid(combat_state):
			combat_state.enemies_died_changed.connect(_on_enemies_died_changed)
			combat_state.player_deaths_changed.connect(_on_player_deaths_changed)

@export var enemies_slain_label : Label
@export var player_deaths_label : Label

func _ready():
	set_enemies_slain_label(combat_state.enemies_died)
	set_player_deaths_label(combat_state.player_deaths)
	
func set_enemies_slain_label(p_new_count : int):
	enemies_slain_label.text = "Enemies Slain: %d" % p_new_count
	
func set_player_deaths_label(p_new_count : int):
	player_deaths_label.text = "Player Deaths: %d" % p_new_count

func _on_enemies_died_changed(p_new_count : int):
	set_enemies_slain_label(p_new_count)
	
func _on_player_deaths_changed(p_new_count : int):
	set_player_deaths_label(p_new_count)
