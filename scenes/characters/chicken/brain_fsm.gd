class_name BrainFSM extends Node

var chicken: Chicken

# This brain simply checks to see if there are crops ready to be harvested and the chicken goes to harvest them

func setup(_chicken: Chicken) -> void:
	chicken = _chicken

func decide_next_action(current_state: String) -> void:
	if current_state == "Idle" or current_state == "Harvest":
		var crop = chicken.find_ready_crop()
		if crop:
			chicken.target_crop = crop
			chicken.state.transition_to("Movement")
		else:
			chicken.state.transition_to("Idle")
