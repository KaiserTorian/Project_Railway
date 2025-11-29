extends Node3D


const BASE_ITEM_SCENE: PackedScene = preload("res://scenes/items-misc/base_item.tscn")
var all_items:Dictionary[int,ItemBase] = {}

func spawn_item(item_prefab: ItemPrefab,
		spawn_position: Vector3 = Vector3(0,0,0),
		spawn_rotation: Vector3 = Vector3(0,0,0),
		inventory_owner: Node3D = null,
		inventory_slot: InvSlot = null,
		parent: Node3D = self):
	print("spawn_item()")
	if item_prefab == null:
		printerr("item_prefab in spawn_item() is null")
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
	
	# after the item was spawend the target inv should pick it up
	print(inventory_slot)
	if not inventory_slot == null:
		inventory_slot.owner_inventory.pickup(item_instance,inventory_owner,null)
		


func despawn_item(item: ItemBase):
	if item == null:
		return
	
	if not item.inventory_slot == null:
		item.inventory_slot.owner_inventory.drop(item, self, Vector3(0,0,0))
	if not item.uid == null:
		self.all_items.erase(item.uid)
	
	item.queue_free()


func despawn_all_item():
	for index in self.all_items:
		despawn_item(self.all_items[index])
