extends Node


var global_guis:Dictionary[String,GUIPrefab]

# TODO: Open splash screenes then main menue
func _ready() -> void:
	get_ref_resources()


## CAUTION: Magic strings that point to resources
func get_ref_resources():
	
	# Get all GUIs and put them in the global_guis dict
	var gui_scene_reference = preload("res://scripts/globals/gui_refs.tres")
	for key in gui_scene_reference.all_guis:
		var gui_instance = gui_scene_reference.all_guis[key].instantiate()
		gui_instance.visible = false
		self.add_child(gui_instance)
		global_guis[key] = gui_instance



func get_gui(identifier: String)-> GUIPrefab:
	for key in self.global_guis:
		if identifier == key:
			return self.global_guis.all_guis[identifier]
	
	return null
	
