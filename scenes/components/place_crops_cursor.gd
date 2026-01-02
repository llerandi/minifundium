class_name PlaceCropsCursor extends Node

@export var tilled_layer: TileMapLayer

@onready var player: Player = get_tree().get_first_node_in_group("player")

var carrot_scene_path = preload("res://scenes/objects/environment/crops/carrot.gd")

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
	
	#print(
		#"Cursor position: ", cursor_position,
		#", Cell position: ", cell_position,
		#", Cell ID: ", cell_id,
		#", Distance from player to cell: ", distance		
	#)
