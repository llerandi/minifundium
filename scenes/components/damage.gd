class_name Damage extends Node2D

@export var maximum_health: int = 1
@export var minimum_health: int = 0
@export var current_damage: int = 0 # Counter from 0 to maximum_damage

signal health_depleted

func apply_damage(damage: int) -> void:
	# If current_damage < minimum_health -> returns minimum_health
	# If current_damage > maximum_health -> returns maximum_health
	# Else -> return current_damage
	## Clamp(): https://docs.godotengine.org/en/3.0/classes/class_@gdscript.html?highlight=clamp#class-gdscript-clamp
	current_damage = clamp(current_damage + damage, minimum_health, maximum_health)
	
	print("The current damage is: ", current_damage)
	
	if current_damage == maximum_health:
		health_depleted.emit()
