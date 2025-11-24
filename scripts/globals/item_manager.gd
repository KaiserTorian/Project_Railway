extends Node3D


const BASE_ITEM_SCENE: PackedScene = preload("res://scenes/GUI/loading_scene.tscn")
var all_items:Dictionary[int,ItemPrefab] = {}
 

func spawn_item(item_prefab: ItemPrefab,
		spawn_position: Vector3 = Vector3(0,0,0),
		spawn_rotation: Vector3 = Vector3(0,0,0),
		in_inventory: bool = false,
		_parent: Node3D = self):
	
	pass
	
