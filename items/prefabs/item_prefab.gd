class_name ItemPrefab
extends Resource


@export var identifier: String
@export var item_name: String
@export_multiline var item_description: String

@export var max_condition: int = 100
@export var item_value: int = 0

@export var max_stacksize: int = 1
@export var inventory_shape_size: int = 1
@export var inventory_shape: Array[bool] = [true]

@export var components:Array[ComponentPrefab]


@export_subgroup("model")
@export var item_mesh: Mesh = BoxMesh.new()
@export var model_offset: Vector3

@export_subgroup("sprite")
@export var item_sprite: Image
@export var sprite_offset: Vector3
