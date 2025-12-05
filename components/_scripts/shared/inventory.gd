class_name Inventory
extends ComponentPrefab


@export var inventory_size:int = 1
@export var inventory_colums: int = -1

var all_items: Array[ItemBase]
var inventory_grid: Array
var allow_multy_size:bool = true


func ready(_owner:Node3D):
	identifier = "inventory"
	always_unique = true
	
	if inventory_colums < 1:
		allow_multy_size = false


func try_insert_item(item: ItemBase, _intput_pos: int = 1, _input_rotation: int = 1) -> bool:
	if not item.parent_inventory == null:
		print("is already in inv")
		return false
	
	if not self._can_pickup_item(item, _intput_pos, _input_rotation):
		print("Can not pick up items")
		return false
	
	self.all_items.append(item)
	item.parent_inventory = self
	
	item.visible = false
	item.freeze = true
	item.sleeping = true
	item.item_collition.disabled = true
	
	return true


func try_drop_item(item: ItemBase, drop_pos: Vector3) -> bool:
	if item.parent_inventory == null:
		return false
			
	item.global_position = drop_pos
	
	self.all_items.remove_at(self.find_item_index(item))
	item.parent_inventory = null
	
	item.sleeping = false
	item.freeze = true
	item.visible = true
	item.item_collition.disabled = false
	
	return true


func find_item_index(item :ItemBase) -> int:
	for index in all_items.size():
		if all_items[index] == item:
			return index
			
	return -1


func _can_pickup_item(_item: ItemBase, _intput_pos: int, _input_rotation: int) -> bool:
	# Is the slot free?
	return true
	
