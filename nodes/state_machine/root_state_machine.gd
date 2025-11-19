class_name RootStateMachine
extends Node


@export var parent: Node3D 
var state_machines: Array = []
var active_states: Array = []


func _ready() -> void:
	for state_machine in self.get_children() as Array[StateMachine]:
		state_machine.parent = self.parent
		state_machine.ready()
		


func _process(_delta: float) -> void:
	for state_machine in self.get_children() as Array[StateMachine]:
		state_machine.process(_delta)


func _physics_process(_delta: float) -> void:
	for state_machine in self.get_children() as Array[StateMachine]:
		state_machine.physics_process(_delta)
