class_name Player extends CharacterBody2D

@onready var hitbox: Hitbox = $Hitbox

# Assigning the default tool to none
@export var current_tool: DataTypes.Tool = DataTypes.Tool.NONE

var direction: Vector2

func on_tool_selected(tool: DataTypes.Tool) -> void:
	current_tool = tool
	hitbox.current_tool = tool # For changing also the tool when the player hits something
	print("Player's current_tool variable is now: ", DataTypes.Tool.keys()[current_tool])

func _ready() -> void:
	CurrentTool.selected_tool.connect(on_tool_selected)
