class_name Chicken extends CharacterBody2D

@onready var state: StateMachine = $StateMachine
var target_crop: Node2D = null
func find_ready_crop() -> Node2D:
	# Searching for the node called Crops in the actual scene, here all the crops will be listed within
	var crops_node = get_tree().current_scene.find_child("Crops", true, false)
	
	if crops_node:
		for crop in crops_node.get_children():
			if crop.has_method("is_harvestable") and crop.is_harvestable():
				return crop # Returning the first crop ready to be harvested
	
	return null
