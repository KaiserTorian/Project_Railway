extends Node

signal loading_progress_updated(progress: float)
signal loading_finished

const USE_SUB_THREADS: bool = true
const LOADING_SCREEN_SCENE: PackedScene = preload("res://scenes/GUI/loading_scene.tscn")

var active_scene: Node
var loading_progress: Array[float]
var target_scene_path: String

# disable the _process func we dont need it all the time
func _ready() -> void:
	set_process(false)

# loads the desired scene via a loading screen
func change_scene(new_scene_path:String):
	
	var error =  ResourceLoader.load_threaded_request(new_scene_path,"",USE_SUB_THREADS)
	if error == OK:
		get_tree().get_root().add_child(LOADING_SCREEN_SCENE.instantiate(), true)
		target_scene_path = new_scene_path
		set_process(true)
	else:
		printerr("Error when starting load_threaded_request in change_scene: ", error)
		


# Is active when loading something, will emit a signal every frame to update the loading screen
func _process(_delta: float) -> void:
	# get the status:
	var loading_status = ResourceLoader.load_threaded_get_status(target_scene_path, loading_progress)
	
	match loading_status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS: # update loading scene
			emit_signal("loading_progress_updated",loading_progress[0])
			
		ResourceLoader.THREAD_LOAD_LOADED: # finish up loading, kill the loading scene
			var loaded_scene = ResourceLoader.load_threaded_get(target_scene_path)
			emit_signal("loading_progress_updated",1.0)
			emit_signal("loading_finished")
			get_tree().change_scene_to_packed(loaded_scene)
			set_process(false)
			
		ResourceLoader.THREAD_LOAD_FAILED: # error
			print("Error. Could not load Resource")
	
