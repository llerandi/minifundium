extends Control

var map_selector_menu_scene_path: String = "res://scenes/ui/map_selector_menu.tscn"

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(map_selector_menu_scene_path)
