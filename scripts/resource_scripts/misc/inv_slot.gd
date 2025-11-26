class_name InvSlot
extends Resource

@export var slot_size: int

#-- Dynamic --#
var owner_inventory: Inventory
var item_count: int
var items: Array[ItemBase]
