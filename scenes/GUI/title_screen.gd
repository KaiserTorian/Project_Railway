extends Node




func _on_start_pressed() -> void:
	SceneManager.change_scene("res://scenes/test_scene.tscn")
	#print("start")


func _on_quit_pressed() -> void:
	get_tree().quit()
