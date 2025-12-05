extends ComponentPrefab
class_name InteractionController


@export var can_open_Inventorys:bool
var is_inventory_open:bool = false


func input(event: InputEvent, owner:Node3D):
	
	# Handle the Inventory input 
	if event.is_action_pressed("cc_interaction") and can_open_Inventorys and not is_inventory_open:
		GuiManager.get_gui("test").open_ui(owner.root_component.find_components("inventory"))
		is_inventory_open = true
		
	elif event.is_action_pressed("cc_interaction") and is_inventory_open:
		GuiManager.get_gui("test").close_ui()
		is_inventory_open = false
		
