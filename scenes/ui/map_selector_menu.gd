extends CanvasLayer

var main_menu_path: String = "res://scenes/ui/main_menu.tscn"

var sandbox_scene_path: String = "res://scenes/test/main_scene.tscn"

var lab_1_scene_path: String = "res://scenes/test/lab_1_scene.tscn"
var lab_2_scene_path: String = "res://scenes/test/lab_2_scene.tscn"
var lab_3_scene_path: String = "res://scenes/test/lab_3_scene.tscn"
var lab_4_scene_path: String = "res://scenes/test/lab_4_scene.tscn"

func _on_sandbox_button_pressed() -> void:
	get_tree().change_scene_to_file(sandbox_scene_path)

func _on_lab_1_button_pressed() -> void:
	get_tree().change_scene_to_file(lab_1_scene_path)

func _on_lab_2_button_pressed() -> void:
	get_tree().change_scene_to_file(lab_2_scene_path)

func _on_lab_3_button_pressed() -> void:
	get_tree().change_scene_to_file(lab_3_scene_path) # Replace with function body.

func _on_lab_4_button_pressed() -> void:
	get_tree().change_scene_to_file(lab_4_scene_path) # Replace with function body.

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(main_menu_path)
