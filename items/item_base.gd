class_name ItemBase
extends Node3D

## This is the base of the Item sceen that adds 

var item_prefab: ItemPrefab
var sprite: Image
var model: PackedScene

var components: Array[ItemComponents]

func _ready() -> void:
	self.update_model()
	self.update_sprite()
	
	for component in self.components:
		component.ready()
	
	
func update_model(new_model: PackedScene = null):
	if new_model == null:
		self.model = self.item_prefab.item_model
	else:
		self.model = new_model


func update_sprite(new_sprite: Image = null):
	if new_sprite == null:
		self.sprite = self.item_prefab.item_sprite
	else:
		self.sprite = new_sprite


func _process(delta: float) -> void:
	for component in self.components:
		component.process(delta)


func _physics_process(delta: float) -> void:
	for component in self.components:
		component.physics_process(delta)
