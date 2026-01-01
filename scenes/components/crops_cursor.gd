class_name CropsCursor extends Node

@export var grass_layer: TileMapLayer
@export var tilled_layer: TileMapLayer

@export var terrain_set: int = 0
@export var terrain: int = 2

@onready var player: Player = get_tree().get_first_node_in_group("player")

var cursor_position: Vector2
var cell_position: Vector2i
var cell_id: int
var current_cell_position: Vector2
var distance: float

# To get the cursor cell that's actually a grass type cell layer (so, terrain = 0)
func get_cursor_cell() -> void:
	cursor_position = grass_layer.get_local_mouse_position()
	cell_position = grass_layer.local_to_map(cursor_position)
	cell_id = grass_layer.get_cell_source_id(cell_position)
	current_cell_position = grass_layer.map_to_local(cell_position)
	distance = player.global_position.distance_to(current_cell_position)
	
	#print(
		#"Cursor position: ", cursor_position,
		#", Cell position: ", cell_position,
		#", Cell ID: ", cell_id,
		#", Distance from player to cell: ", distance		
	#)

# To check if the cell is near the player, and an a valid cell to place a tilled one
func add_tilled_cell() -> void:
	if distance < 25.0 && cell_id != -1:
		tilled_layer.set_cells_terrain_connect(
			[cell_position],
			terrain_set,
			terrain,
			true
		)

# When the player uses the tilling tool (hoe)
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if CurrentTool.current_tool == DataTypes.Tool.HOE:
			get_cursor_cell()
			add_tilled_cell()
