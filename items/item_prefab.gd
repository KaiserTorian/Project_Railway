class_name ItemPrefab
extends Resource


@export var identifier: String
@export var item_name: String
@export_multiline var item_description: String
@export var max_condition: int = 100
@export var item_value: int
@export var max_stacksize: int = 1

@export var components:Array[ItemComponents]

#FIXME: The string is just a place holder I need a 3D model
@export_subgroup("model")
@export var world_model: Image
@export var model_offset: Vector3

@export_subgroup("sprite")
@export var item_sprite: Image
@export var sprite_offset: Vector3
