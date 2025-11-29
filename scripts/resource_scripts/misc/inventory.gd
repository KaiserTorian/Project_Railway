class_name Inventory
extends ComponentPrefab


@export var default_slot: InvSlot = preload("res://resources/misc/default_inv_slot.tres")
@export var slots: Array[InvSlot]


func ready(owner:Node3D):
	identifier = "Inventory"
	setup_inv(owner)
	generate_gui(owner)
	

# The basic setup after the Inventory is generated
func setup_inv(owner: Node3D):
	for index in self.slots.size():
		if slots[index] == null:
			slots[index] = default_slot.duplicate(true)
			slots[index].owner_inventory = self
			

	
func generate_gui(owner: Node3D):
	pass


func pickup(item: ItemBase, picker: Node3D, input_slot: InvSlot = null):
	if not item.inventory_slot == null:
		print("is already in inv")
		return
	
	if not self._can_pickup_item(item):
		print("Can not pick up items")
		return
	
	if input_slot == null:
		print("no input slot")
		input_slot = self._find_first_slot(item)
	
	input_slot.items.append(item)
	input_slot.item_identifier = item.prefab.identifier
	item.inventory_slot = input_slot
	
	item.visible = false
	item.sleeping = true
	item.item_collition.disabled = false


func drop(item: ItemBase, picker: Node3D, drop_pos: Vector3) -> bool:
	if item.inventory_slot == null:
		return false
			
	item.global_position = drop_pos
	
	item.inventory_slot = null
	item.sleeping = false
	item.visible = true
	item.item_collition.disabled = true
	
	return true
	

func move(owner: Node3D):
	pass


func _can_pickup_item(item: ItemBase) -> bool:
	var item_type: String = item.prefab.identifier
	
	# Ist ein freier stack im inv?
	for slot in self.slots:
		if item_type == slot.item_identifier and slot.slot_size > slot.items.size():
			return true
	
	# Ist ein freier slot im inv?
	for slot in self.slots:
		if item_type == null:
			return true
			
	return false
	
# FIXME: I already have this function wy a second time?
func _find_first_slot(item: ItemBase) -> InvSlot:
	var item_type: String = item.prefab.identifier
	# Ist ein freier stack im inv?
	for slot in self.slots:
		if item_type == slot.item_identifier and slot.slot_size > slot.items.size():
			return slot
	
	# Ist ein freier slot im inv?
	for slot in self.slots:
		if item_type == null:
			return slot
	
	return null	