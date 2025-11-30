class_name Hurtbox extends Area2D

@export var current_tool: DataTypes.Tool = DataTypes.Tool.NONE

# Signals allow all connected Callables to listen and react to events, without directly referencing one another
## https://docs.godotengine.org/en/4.4/classes/class_signal.html
signal on_hurt

func _on_area_entered(area: Area2D) -> void:
	# It checks if the area that entered is actually a Hitbox
	var hitbox = area as Hitbox
	
	if current_tool == hitbox.current_tool:
		on_hurt.emit(hitbox.damage)
