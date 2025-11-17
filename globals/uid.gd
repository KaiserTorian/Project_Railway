extends Node

static var uid_count: int = 0


#maybe I'll save all the objects that get an ID
static func get_new_id(_object:Object):
	uid_count += 1
	return uid_count

static func reset_uid_count():
	uid_count = 0
