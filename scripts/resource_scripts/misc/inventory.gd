class_name Inventory
extends ComponentPrefab

@export var default_slot: InvSlot = preload("res://resources/misc/default_inv_slot.tres")
@export var slots: Array[InvSlot]


func ready(owner:Node3D):
	setup_inv(owner)
	generate_gui(owner)

# The basic setup after the Inventory is generated
func setup_inv(owner: Node3D):
	for index in self.slots.size():
		if slots[index] == null:
			slots[index] = default_slot.duplicate(true)
			
	
func generate_gui(owner: Node3D):
	pass

func pickup(item: ItemBase,owner: Node3D):
	if not item.inventory_slot == null:
		return
	
	if not self._can_pickup_item(item,owner):
		return
	
func drop(owner: Node3D):
	pass

func move(owner: Node3D):
	pass


func _can_pickup_item(item: ItemBase, _owner: Node3D) -> bool:
	var item_type: String = item.prefab.identifier
	# Ist ein freier stack im inv?
	for slot in self.slots:
		if item_type == slot.item_type and slot.slot_size > slot.items.size():
			return true
	
	# Ist ein freier slot im inv?
	for slot in self.slots:
		if item_type == null:
			return true
			
	return false
	

func _find_first_slot(item: ItemBase, _owner: Node3D) -> InvSlot:
	var item_type: String = item.prefab.identifier
	# Ist ein freier stack im inv?
	for slot in self.slots:
		if item_type == slot.item_type and slot.slot_size > slot.items.size():
			return slot
	
	# Ist ein freier slot im inv?
	for slot in self.slots:
		if item_type == null:
			return slot
	
	return null	