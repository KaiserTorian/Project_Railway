class_name Inventory
extends ComponentPrefab

@export var default_slot:InvSlot
@export var slots: Array[InvSlot]

func setup_inv(owner: Node3D):
	for slot in slots:
		if slot == null:
			slot = default_slot.new()
	
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
