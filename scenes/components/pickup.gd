class_name Pickup extends Area2D

@export var item_pickup: String

func _on_body_entered(entity: Node2D) -> void:
	# Check if the player is on the item area for picking up
	if entity is Player:
		get_parent().queue_free() # It will be added on another scene then get_parent() will work
