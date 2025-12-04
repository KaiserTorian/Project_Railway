class_name ItemBase
extends RigidBody3D

## This is the base of the Item sceen that adds

var uid: int
var prefab: ItemPrefab
var sprite: Image

var components: Array[ComponentPrefab]

# Invetory stuff
var parent_inventory: Inventory
var inventory_pos: Vector2
var inventory_rotation: int

#ItemStack
var is_stack_parent: bool = false
var stack_parent: ItemBase
var item_stack: Array[ItemBase]

# on ready
@onready var item_mesh: MeshInstance3D = $MeshInstance3D
@onready var item_collition: CollisionShape3D = $CollisionShape3D

func _ready() -> void:
	self.update_model()
	self.update_sprite()

	
	
func update_model(new_mesh: Mesh = null):
	if new_mesh == null:
		print(self)
		self.item_mesh.mesh = prefab.item_mesh
	else:
		self.item_mesh.mesh = new_mesh


func update_sprite(new_sprite: Image = null):
	if new_sprite == null:
		self.sprite = self.prefab.item_sprite
	else:
		self.sprite = new_sprite


func set_inventory(slot: InvSlot = null):
	if slot == null:
		self.inventory_slot = null
		
		self.visible = false
		self.sleeping = true
		self.item_collition.disabled = false
	else:
		self.inventory_slot = slot
		
		self.visible = true
		self.sleeping = false
		self.item_collition.disabled = true


func add_to_stack():
	pass


func _process(delta: float) -> void:
	for component in self.components:
		component.process(delta, self)


func _physics_process(delta: float) -> void:
	for component in self.components:
		component.physics_process(delta, self)
