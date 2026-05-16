class_name BrainRL extends Node

var chicken: Chicken

var last_state: String = "idle" # Saving the last action for the matrix

# Set it to 1 because it should initially be 50%–50%
var matrix = {
	"idle": {"idle": 1, "harvest": 1},
	"harvest": {"idle": 1, "harvest": 1}
}
