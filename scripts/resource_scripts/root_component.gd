class_name RootComponent
extends Node


@export var parent: Node3D
@export var components: Array[ComponentPrefab] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for component in self.components:
		component.self_check()
		component.ready(parent)
		print(find_components(Inventory,true))

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
	

func find_components(component_type, first_component:bool) -> ComponentPrefab:
	for i in self.components:
		if is_instance_of(i,component_type):
			return i
	return null