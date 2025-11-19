class_name RootComponent
extends Node


@export var parent: Node3D


func _ready() -> void:
	if not parent is Node3D:
		push_error("parent in ", self, " is not Node3D")
		return
	
	for component in self.get_children() as Array[ComponentPrefab]:
		component.parent = self.parent
		component.self_check()
		component.ready()


func _process(delta: float) -> void:
	for component in self.get_children() as Array[ComponentPrefab]:
		if component.is_active == true:
			component.process(delta)


func _physics_process(delta: float) -> void:
	for component in self.get_children() as Array[ComponentPrefab]:
		if component.is_active == true:
			component.physics_process(delta)


func _unhandled_input(event: InputEvent) -> void:
	for component in self.get_children() as Array[ComponentPrefab]:
		if component.is_active == true:
			component.unhandled_input(event)


func activate(identifier: String) -> void:
	for component in self.get_children() as Array[ComponentPrefab]:
		if component.identifier == identifier:
			component.is_active = true
			component.on_activate()


func deactivate(identifier: String) -> void:
	for component in self.get_children() as Array[ComponentPrefab]:
		if component.identifier == identifier:
			component.is_active = false
			component.on_deactivate()
