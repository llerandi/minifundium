class_name BrandCommanded extends Node

var chicken: Chicken

func setup(_chicken: Chicken) -> void:
	chicken = _chicken

func on_player_command() -> void:
	var crop = chicken.find_ready_crop()
	if crop:
		chicken.target_crop = crop
		chicken.state.transition_to("Movement")
