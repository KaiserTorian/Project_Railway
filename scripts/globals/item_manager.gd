extends Node3D


const BASE_ITEM_SCENE: PackedScene = preload("res://items/base_item.tscn")
var all_items:Dictionary[int,ItemBase] = {}
 

func spawn_item(item_prefab: ItemPrefab,
		spawn_position: Vector3 = Vector3(0,0,0),
		spawn_rotation: Vector3 = Vector3(0,0,0),
		_in_inventory: bool = false,
		parent: Node3D = self):
	
	if item_prefab == null:
		push_warning("item_prefab in spawn_item() is null")
		return
	
	var item_instance: ItemBase = BASE_ITEM_SCENE.instantiate()

	var uid = Uid.get_new_id(item_instance)
	self.all_items[uid] = item_instance
	
	item_instance.uid = uid
	item_instance.prefab = item_prefab
	item_instance.components = item_prefab.components
	
	if parent == null:
		self.add_child(item_instance,true)
	else:
		parent.add_child(item_instance,true)

	item_instance.global_position = spawn_position
	item_instance.global_rotation = spawn_rotation



func despawn_item(item: ItemBase):
	if item == null:
		return
		
	if not item.uid == null:
		self.all_items.erase(item.uid)
	
	item.queue_free()


func despawn_all_item():
	for index in self.all_items:
		despawn_item(self.all_items[index])
