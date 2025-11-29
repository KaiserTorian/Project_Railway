extends Node3D

# The parent of the spawend item
@export var item: ItemPrefab

#
#func _ready() -> void:
	#ItemManager.spawn_item(item,self.global_position)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		ItemManager.spawn_item(item,self.global_position)
		
	if Input.is_action_just_pressed("ui_down"):
		if self.get_child_count() > 0:
			ItemManager.item_deleted.emit(self.get_child(0))
	
	if Input.is_action_just_pressed("ui_right"):
		# spawn in player in random slot
		print("Spawn Item")
		for i in CharacterManager.all_characters:
			ItemManager.spawn_item(item, self.global_position, Vector3(0,0,0),CharacterManager.all_characters[i],CharacterManager.all_characters[i].get_child(4).components[1].slots[1])
		
