class_name BrainRL extends Node

var chicken: Chicken

var last_state: String = "idle" # Saving the last action for the matrix

# Set it to 1 because it should initially be 50%–50%
var matrix = {
	"idle": {"idle": 1, "harvest": 1},
	"harvest": {"idle": 1, "harvest": 1}
}

func setup(_chicken: Chicken) -> void:
	chicken = _chicken

func on_player_command() -> void:
	var crop = chicken.find_ready_crop()
	if crop:
		matrix[last_state]["harvest"] += 1 # Incrementing the weight of the decision
		print("The chicken learnt")
		
		chicken.target_crop = crop
		last_state = "harvest"
		chicken.state.transition_to("Movement")
	else:
		print("No crops ready to be harvested")

func decide_next_action() -> void:
	pass

func _choose_weighted_action() -> void:
	pass
