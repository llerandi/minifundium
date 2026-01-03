extends CanvasLayer

var main_scene_path: String = "res://scenes/test/main_scene.tscn"

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(main_scene_path)

func _on_exit_button_pressed() -> void:
	get_tree().quit()
