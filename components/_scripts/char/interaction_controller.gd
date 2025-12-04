extends ComponentPrefab
class_name InteractionController


@export var can_open_Inventorys:bool

var is_inventory_open:bool = false

func input(event: InputEvent, _owner:Node3D):

	
	# Handle the Inventory input 
	if event.is_action_pressed("cc_interaction") and can_open_Inventorys and not is_inventory_open:
		_owner.
		GuiManager.all_guis["test"].visible = true
		is_inventory_open = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event.is_action_pressed("cc_interaction") and is_inventory_open:
		GuiManager.all_guis["test"].visible = false
		is_inventory_open = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
