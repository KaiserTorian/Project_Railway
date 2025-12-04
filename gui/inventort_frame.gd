@warning_ignore_start("narrowing_conversion")
extends Control



const INV_SLOT_RELATIVE_SIZE: float = 0.05

var visual_grid: GridContainer
var logic_grid: GridContainer

# INFO: nur zum Testen
@export var inventory_size:int = 40
@export var inventory_colums: int = 0

var allow_multy_size: bool = true
var linked_inventory: Inventory

var last_frame_screen_size: Vector2
var slot_size: int



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if self.inventory_colums < 1:
		self.is_single_size_only = false
	
	init_inv_gui() 


func _process(_delta: float) -> void:
	update_ui_inv()
	


func connect_to_inventory(inventory: Inventory):
	self.inventory_size = inventory.inventory_size
	self.inventory_colums = inventory.inventory_colums
	
	self.init_inv_gui()


func init_inv_gui():
	
	# update grid info
	if inventory_colums > 0:
		slot_size = (self.size.x - inventory_colums * visual_grid.get_theme_constant("h_separation")) / inventory_colums
		visual_grid.columns = inventory_colums
	else:
		slot_size = get_viewport().get_visible_rect().size.x * INV_SLOT_RELATIVE_SIZE
		visual_grid.columns = clampi(self.size.x / slot_size, 1, 1000)
	
	# delete all children if there were any 
	for i in self.visual_grid.get_children():
		self.visual_grid.remove_child(i)
		i.queue_free()
	
	# Create the visual slots
	for i in inventory_size:
		#print(i)
		var panel = Panel.new()
		panel.custom_minimum_size = Vector2(slot_size,slot_size)
		visual_grid.add_child(panel, true)
	visual_grid.update_minimum_size()
	
	#nudge the list in the center



func update_ui_inv():
	if not self.is_visible_in_tree():
		return
	
	
	# update slot size
	if inventory_colums > 0 and self.get_viewport().get_visible_rect().size.x == last_frame_screen_size.x:
		slot_size = (self.size.x - inventory_colums * visual_grid.get_theme_constant("h_separation")) / inventory_colums
	elif self.get_viewport().get_visible_rect().size.x == last_frame_screen_size.x :
		slot_size = get_viewport().get_visible_rect().size.x * INV_SLOT_RELATIVE_SIZE
	
	
	
	# update grid info
	for i in self.visual_grid.get_child_count():
		var panel = self.visual_grid.get_child(i) as Panel
		panel.custom_minimum_size = Vector2(slot_size,slot_size)
		panel.size = Vector2(slot_size,slot_size)
			
