extends Node3D


func _ready() -> void:
	CharacterManager.spawn_character("res://scenes/characters/human.tscn", self.global_position, Vector3(0,0,0), true)
	
