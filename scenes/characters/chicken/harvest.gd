extends State

@export var chicken: Chicken
@export var sprite: AnimatedSprite2D

func _on_enter() -> void:
	sprite.play("down")
	
	await get_tree().create_timer(1.5).timeout
	
	if chicken.target_crop != null and is_instance_valid(chicken.target_crop):
		#chicken.target_crop.on_harvest()
		
		# To get the position
		#var target_position: Vector2 = chicken.target_crop.global_position
		# To get the facing direction
		#var target_direction: Vector2 = chicken.global_position.direction_to(target_position)
		var pickup_node = chicken.target_crop.get_node("Pickup")
		if pickup_node:
			Resources.add_resource(pickup_node.item_pickup)
			chicken.target_crop.queue_free()
	
	chicken.target_crop = null
	
	#chicken.request_next_action("Idle")
	transition.emit("Idle")

func _on_exit() -> void:
	sprite.stop()
