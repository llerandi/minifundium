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
		var crop = chicken.find_ready_crop()
		if crop:
			print("Autonomous decision: Harvest")
			chicken.target_crop = crop
			last_state = "Harvest"
			chicken.state.transition_to("Movement")
		else:
			last_state = "Idle"
			chicken.state.transition_to("Movement")
	else:
		print("Autonomous decision: Idle")
		last_state = "Idle"
		chicken.state.transition_to("Movement")

func _choose_weighted_action() -> String:
	var choices = matrix[last_state]
	var total_weight = 0
	
	# Sum the weights in the corresponding row
	for w in choices.values():
		total_weight += w
	
	var random_val = randi() % total_weight
	var current_sum = 0
	
	for state in choices.keys():
		current_sum += choices[state]
		if random_val < current_sum:
			return state
	
	return "Idle"
