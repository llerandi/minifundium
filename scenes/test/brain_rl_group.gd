class_name BrainRLGroup extends Node

var chicken: Chicken

var last_state: String = "Idle" # Saving the last action for the matrix

func setup(_chicken: Chicken) -> void:
	chicken = _chicken
