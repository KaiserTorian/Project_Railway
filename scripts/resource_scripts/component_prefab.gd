@abstract
class_name ComponentPrefab
extends Resource

@export var identifier: String
@export var component_name: String
@export_multiline var component_description:String

func self_check() -> void:
	if identifier == null:
		print("identifier in ", self, " is null")
		return

func ready(_parent: Node3D):
	pass

func process(_delta: float, _owner: Node3D):
	pass

func physics_process(_delta: float, _owner: Node3D):
	pass
	
func input(_event: InputEvent, _owner: Node3D) -> void:
	pass

func unhandled_input(_event: InputEvent,_owner:Node3D) -> void:
	pass
