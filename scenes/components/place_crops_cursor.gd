class_name PlaceCropsCursor extends Node

@export var tilled_layer: TileMapLayer

@onready var player: Player = get_tree().get_first_node_in_group("player")

var carrot_scene_path = preload("res://scenes/objects/environment/crops/carrot.tscn")
var turnip_scene_path = preload("res://scenes/objects/environment/crops/turnip.tscn")
var beet_scene_path = preload("res://scenes/objects/environment/crops/beet.tscn")

var cursor_position: Vector2
var cell_position: Vector2i
var cell_id: int
var current_cell_position: Vector2
var distance: float

# To get the cursor cell that's actually a grass type cell layer (so, terrain = 0)
func get_cursor_cell() -> void:
	cursor_position = tilled_layer.get_local_mouse_position()
	cell_position = tilled_layer.local_to_map(cursor_position)
	cell_id = tilled_layer.get_cell_source_id(cell_position)
	current_cell_position = tilled_layer.map_to_local(cell_position)
	distance = player.global_position.distance_to(current_cell_position)
	
	print(
		"Cursor position: ", cursor_position,
		", Cell position: ", cell_position,
		", Cell ID: ", cell_id,
		", Distance from player to cell: ", distance		
	)

func add_crop() -> void:
	if distance < 25.0 && cell_id != -1:
		if CurrentTool.current_tool == DataTypes.Tool.CARROT_SEEDS:
			var carrot_scene = carrot_scene_path.instantiate() as Node2D
			carrot_scene.global_position = current_cell_position
			get_parent().find_child("Crops").add_child(carrot_scene)
		elif CurrentTool.current_tool == DataTypes.Tool.TURNIP_SEEDS:
			var turnip_scene = turnip_scene_path.instantiate() as Node2D
			turnip_scene.global_position = current_cell_position
			get_parent().find_child("Crops").add_child(turnip_scene)
		elif CurrentTool.current_tool == DataTypes.Tool.BEET_SEED:
			var beet_scene = beet_scene_path.instantiate() as Node2D
			beet_scene.global_position = current_cell_position
			get_parent().find_child("Crops").add_child(beet_scene)

func remove_crop() -> void:
	if distance < 25.0:
		var remove_crop = get_parent().find_child("Crops").get_children()
		
		for crop: Node2D in remove_crop:
			if crop.global_position == current_cell_position:
				crop.queue_free()

# When the player uses the seeds and is interacting with
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"): # While handling a SEED, left mouse click
		if CurrentTool.current_tool == DataTypes.Tool.CARROT_SEEDS:
			get_cursor_cell()
			add_crop()
		elif CurrentTool.current_tool == DataTypes.Tool.TURNIP_SEEDS:
			get_cursor_cell()
			add_crop()
		elif CurrentTool.current_tool == DataTypes.Tool.BEET_SEED:
			get_cursor_cell()
			add_crop()
	elif event.is_action_pressed("remove"): # While handling a WATERING CAN, right mouse click
		if CurrentTool.current_tool == DataTypes.Tool.WATERING_CANssssss:
			get_cursor_cell()
			remove_crop()
