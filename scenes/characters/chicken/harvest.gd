extends State

@export var chicken: Chicken
@export var sprite: AnimatedSprite2D

func _on_enter() -> void:
	sprite.play("down")
	
	await get_tree().create_timer(1.5).timeout
	
	if chicken.target_crop != null and is_instance_valid(chicken.target_crop):
		chicken.target_crop.on_harvest()
	
	chicken.target_crop = null
	
	transition.emit("Idle")

func _on_exit() -> void:
	sprite.stop()
