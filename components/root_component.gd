class_name RootComponent
extends Node

@export var inventory:Inventory
@export var parent: Node3D
@export var components: Array[ComponentPrefab] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for component in self.components:
		component.self_check()
		component.ready(parent)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	for component in self.components:
		component.process(delta, parent)


func  _physics_process(delta: float) -> void:
	for component in self.components:
		component.physics_process(delta, parent)


func _input(event: InputEvent) -> void:
	for component in self.components:
		component.input(event, parent)


func _unhandled_input(event: InputEvent) -> void:
	for component in self.components:
		component.unhandled_input(event, parent)
	

func find_components(comp_type_identifier: String) -> ComponentPrefab:
	for comp in self.components:
		if comp.identifier == comp_type_identifier:
			return comp
	return null
