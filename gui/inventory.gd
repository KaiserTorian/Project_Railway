extends Control
class_name InventoryUi



@export var inv: InventoryGrid 

func _ready() -> void:
	pass



func open_ui(sync_inv: Inventory):
	inv.connect_to_inventory(sync_inv)
	self.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func close_ui():
	self.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
