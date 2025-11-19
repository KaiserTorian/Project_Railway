@abstract
class_name ComponentPrefab
extends Node

@export var is_active: bool = true
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

func process(_delta: float) -> void:
	pass

func physics_process(_delta: float) -> void:
	pass

func on_activate() -> void:
	pass

func on_deactivate() -> void:
	pass
