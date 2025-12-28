extends Node

var resources: Dictionary = Dictionary()

signal quantity_changed

func add_resource(item: String) -> void:
	resources.get_or_add(item)

	if resources[item] != null:
		resources[item] += 1 # Incrementing the quantity by 1
	else:
		resources[item] = 1 # 1 because the player doesn't have that resource and at the beginning is null
	
	quantity_changed.emit()
