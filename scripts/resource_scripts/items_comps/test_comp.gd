class_name TestComp
extends ComponentPrefab

@export var test_var1: int
@export var test_var2: String


func process(_delta: float, parent: Node3D):
	print(parent)
	print(test_var1)
