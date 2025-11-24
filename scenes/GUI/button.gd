extends Button



func _on_pressed() -> void:
	CharacterManager.spawn_character("res://scenes/characters/human.tscn", Vector3(0,0,0), Vector3(0,0,0), true)
