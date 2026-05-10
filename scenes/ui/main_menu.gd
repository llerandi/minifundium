extends CanvasLayer

var map_selector_menu_scene_path: String = "res://scenes/ui/map_selector_menu.tscn"

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(map_selector_menu_scene_path)

func _on_exit_button_pressed() -> void:
	get_tree().quit()
