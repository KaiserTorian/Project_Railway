extends Node3D


func _ready() -> void:
	CharacterManager.spawn_character("res://scenes/characters/human.tscn", Vector3(0,0,0), Vector3(0,0,0), true)
	#CharacterManager.player_spawned.emit(self, self.global_position, self.global_rotation)
	
