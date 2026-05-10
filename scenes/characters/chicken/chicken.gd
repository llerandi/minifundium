class_name Chicken extends CharacterBody2D

@onready var state: StateMachine = $StateMachine
@export var brain: Node # Will handle the different type of brain depending on the lab selected

var target_crop: Node2D = null

func _ready() -> void:
	if brain and brain.has_method("setup"):
		brain.setup(self)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("auto_harvest"):
		command_harvest()

func command_harvest() -> void:
	target_crop = find_ready_crop()
	
	if target_crop != null:
		print("A crop ready for harvest was found. On the way to harvest it...")
		state.transition_to("Movement")
	else:
		print("No crops ready for harvest were found...")
		
func find_ready_crop() -> Node2D:
	# Searching for the node called Crops in the actual scene, here all the crops will be listed within
	var crops_node = get_tree().current_scene.find_child("Crops", true, false)    
	
	if crops_node:
		for crop in crops_node.get_children():
			if crop.has_method("is_harvestable") and crop.is_harvestable():
				return crop # Returning the first crop ready to be harvested
			return crop # Returning the first crop ready to be harvested
	
	return null
