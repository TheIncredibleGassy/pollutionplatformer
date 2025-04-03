class_name Health
extends Node2D

signal is_alive_changed(value : bool)
signal health_changed(new : int, amount : int)

@export var stats : ObjectStats
@export var combat_state : CombatState

@export var current_health : int :
	set(value):
		if current_health == value:
			return
		
		var old = current_health
		current_health = min(value, stats.max_health)
		var amount_changed = current_health - old
		
		if ready_done:
			health_changed.emit(current_health, amount_changed)
			combat_state.health_changed.emit(self, current_health, amount_changed)
		
var is_alive = true :
	set(value):
		if is_alive == value:
			return
		
		is_alive = value
		is_alive_changed.emit(is_alive)
		
var ready_done = false
		
func _ready():
	current_health = stats.max_health
	health_changed.connect(_on_health_changed)
	ready.connect(_on_ready)

func _on_health_changed(_p_new : int, _p_amount : int):
	is_alive = current_health > 0

func _on_ready():
	ready_done = true
