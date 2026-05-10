class_name BrainFSM extends Node

var chicken: Chicken

# This brain simply checks to see if there are crops ready to be harvested and the chicken goes to harvest them

func setup(_chicken: Chicken) -> void:
	chicken = _chicken

# Will be executed after idle_timer in idle.gd ends
func decide_next_action(current_state: String) -> void:
	print("The current chicken's state is: ", current_state)
	var crop = chicken.find_ready_crop()
	if crop:
		chicken.target_crop = crop
		chicken.state.transition_to("Movement")
	else:
		# If no ready to harvest crop then, walk for a while
		chicken.state.transition_to("Movement")
