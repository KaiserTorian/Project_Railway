extends Node

var all_guis: Dictionary[String, Control]

func _ready() -> void:
	init_saved_guis()


## CAUTION: Magic string that point to the gui_refs.tres
func init_saved_guis():
	# Get all GUIs and put them in the global_guis dict
	var gui_resurce = preload("res://scripts/globals/gui_refs.tres")
	
	for key in gui_resurce.all_guis:
		var gui_instance = gui_resurce.all_guis[key].instantiate()
		gui_instance.visible = false
		self.add_child(gui_instance)
		all_guis[key] = gui_instance



func get_gui(identifier: String)-> Control:
	for key in self.all_guis:
		if identifier == key:
			return self.all_guis[identifier]
	
	return null
