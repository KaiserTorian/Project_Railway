extends Node

var all_items = {}

signal item_spawned(item_path: String, in_inventory: bool, spawn_node: Node3D, spawn_offset: Vector3)
signal item_deleted(item: ItemPrefab)



func _ready() -> void:
	item_spawned.connect(self.spawn_item)
	item_deleted.connect(self.delete_item)



# TODO: Inv spawning
func spawn_item(item_path: String, _in_inventory: bool, spawn_node: Node3D, spawn_offset: Vector3):
	
	if item_path == null or _in_inventory == null or spawn_node == null or spawn_offset == null: 
		return
	
	var item = load(item_path) # Create the item
	var item_instance = item.instantiate() as ItemPrefab
	
	var uid = Uid.get_new_id(item_instance) # create the item UID
	item_instance.item_uid = uid
	
	spawn_node.add_child(item_instance, true) # "Spawn" the item
	item_instance.global_position = spawn_node.global_position + spawn_offset
	item_instance.global_rotation = spawn_node.global_rotation
	
	all_items[uid] = item_instance # Add item to the item list



func delete_item(item: ItemPrefab):
	if item == null:
		return
	
	item.queue_free()
	
	if item.item_uid != null:
		all_items.erase(item.item_uid)
	
