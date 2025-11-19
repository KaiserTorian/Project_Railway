@abstract
class_name StatePrefab
extends Node

@export var blacklist: bool = true
@export var state_list: Array[StatePrefab] = []

@export var identifier: String
var parent: Node3D

func self_check() -> void:
	if identifier == null:
		push_error("identifier in ", self, " is null")
		return
	if not parent is Node3D:
		push_error("parent in ", self, " is not Node3D")
		return


func ready() -> void:
	pass


func check_condition() -> void:
	pass


func process(_delta: float) -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


func enter_state() -> void:
	pass

func exit_state(_new_state: StatePrefab) -> void:
	pass
