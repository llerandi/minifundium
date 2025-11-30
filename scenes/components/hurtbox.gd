class_name Hurtbox extends Area2D

@export var tool: DataTypes.Tool = DataTypes.Tool.NONE

# Signals allow all connected Callables to listen and react to events, without directly referencing one another
## https://docs.godotengine.org/en/4.4/classes/class_signal.html
signal struck

func _on_area_entered(area: Area2D) -> void:
	var hitbox = area as Hitbox
	
	# It checks if the area that entered is actually a Hitbox
	if not hitbox:
		return
	
	# If the tool doesn't match
	if tool != hitbox.current_tool:
		return
	
	struck.emit(hitbox.damage)
