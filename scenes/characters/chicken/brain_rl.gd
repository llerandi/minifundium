class_name BrainRL extends Node

var chicken: Chicken

var last_state: String = "Idle" # Saving the last action for the matrix

# Set it to 1 because it should initially be 50%–50%
var matrix = {
	"Idle": {"Idle": 1, "Harvest": 1},
	"Harvest": {"Idle": 1, "Harvest": 1}
}

func setup(_chicken: Chicken) -> void:
	chicken = _chicken

func on_player_command() -> void:
	var crop = chicken.find_ready_crop()
	if crop:
		matrix[last_state]["Harvest"] += 1 # Incrementing the weight of the decision
		print("The chicken learnt")
		
		chicken.target_crop = crop
		last_state = "Harvest"
		chicken.state.transition_to("Movement")
	else:
		print("No crops ready to be harvested")

func decide_next_action(current_state: String) -> void:
	var next_action = _choose_weighted_action()
	
	if next_action == "Harvest":
		pass
	else:
		last_state = "Idle"
		chicken.state.transition_to("Movement")

func _choose_weighted_action() -> String:
	return "Idle"
