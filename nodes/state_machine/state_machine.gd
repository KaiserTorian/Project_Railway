class_name StateMachine
extends Node

## General State Machine for everything 
var parent: Node3D
@export var default_state: StatePrefab

var current_state: StatePrefab


func ready() -> void:
	if self.default_state == null:
		push_error("StateMachine has no default_state")
		return
	
	for state in self.get_children() as Array[StatePrefab]:
		state.parent = self.parent
		state.self_check()
		state.ready()
	
	set_state(default_state)


func set_state(new_state: StatePrefab) -> void:
	if not current_state == null:
		current_state.exit_state(new_state)
	new_state.enter_state()
	current_state = new_state


func process(_delta: float) -> void:
	current_state.process(_delta)


func physics_process(_delta: float) -> void:
	current_state.physics_process(_delta)
