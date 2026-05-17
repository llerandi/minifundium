class_name BrainRLGroup extends Node

var chicken: Chicken

var last_state: String = "Idle" # Saving the last action for the matrix

func setup(_chicken: Chicken) -> void:
	chicken = _chicken

func on_player_command() -> void:
	var crop = chicken.find_ready_crop()
	if crop:
		GlobalAi.matrix[last_state]["Harvest"] += 1 # Incrementing the weight of the decision
		print("The chickens learnt, matrix: ", GlobalAi.matrix)
		
		chicken.target_crop = crop
		last_state = "Harvest"
		chicken.state.transition_to("Movement")
	else:
		print("No crops ready to be harvested")
