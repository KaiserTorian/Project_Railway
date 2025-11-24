extends Node3D

var all_characters: Dictionary[int,CharacterPrefab] = {}
var all_players: Dictionary[int,CharacterPrefab] = {}

# FIXME: when already a player exists delete the old one or teleport to spawn pos
func spawn_character(scene_path: String,
		spawn_position: Vector3,
		spawn_rotation: Vector3,
		is_player: bool = false,
		parent: Node3D = null):
	
	if is_player and get_viewport().get_camera_3d() != null:
		return
	
	var character: PackedScene = ResourceLoader.load(scene_path)
	var character_instance: CharacterPrefab = character.instantiate()
	
	var uid = Uid.get_new_id(character_instance)
	self.all_characters[uid] = character_instance
	if is_player:
		self.all_players[uid] = character_instance
		
	character_instance.character_uid = uid
	character_instance.is_player = is_player
	
	if parent == null:
		self.add_child(character_instance,true)
	else:
		parent.add_child(character_instance,true)
	
	character_instance.global_position = spawn_position
	character_instance.global_rotation = spawn_rotation
	

func despawn_character(character: CharacterPrefab):
	if character == null:
		return
	var is_player = character.is_player
	
	if character.character_uid != null:
		all_characters.erase(character.item_uid)
		if is_player:
			all_players.erase(character.item_uid)
	
	character.queue_free()


func despawn_all_characters():
	for index in all_characters:
		self.despawn_character(all_characters[index])
