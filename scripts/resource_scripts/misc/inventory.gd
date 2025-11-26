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
			print(slots[index])
			slots[index] = default_slot.duplicate(true)
			
	
func generate_gui(owner: Node3D):
	pass

func pickup(owner: Node3D):
	pass

func drop(owner: Node3D):
	pass

func move_internal(owner: Node3D):
	pass
	
func move_extenal(owner: Node3D):
	pass
