class_name StateMashine
extends Node

## State Mashine
## TODO: Code the advanced state mashine with paralles states the state schould self regulate?
## Possible issues: there is no state active for a moment (solution a fallback state?)


@export var parent: Node3D
@export var default_state: State

var current_state: State


func _init() -> void:
	if self.parent == null or self.default_state == null:
		push_error("StateMashine has no Parents or default_state")
		return
	
	for state in self.get_children():
		state.parent = self.parent
		state.init()
	
	current_state = default_state


func _process(delta: float) -> void:
	if self.current_state != null:
		current_state.process(delta)
	pass


func _physics_process(delta: float) -> void:
	if self.current_state != null:
		current_state.physics_process(delta)
	pass
