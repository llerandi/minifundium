extends PanelContainer

@onready var carrot_seeds: Button = $MarginContainer/HBoxContainer/CarrotSeeds
@onready var turnip_seeds: Button = $MarginContainer/HBoxContainer/TurnipSeeds
@onready var beet_seeds: Button = $MarginContainer/HBoxContainer/BeetSeeds

func _on_carrot_seeds_pressed() -> void:
	CurrentTool.selecting_tool(DataTypes.Tool.CARROT_SEEDS)

func _on_turnip_seeds_pressed() -> void:
	CurrentTool.selecting_tool(DataTypes.Tool.TURNIP_SEEDS)

func _on_beet_seeds_pressed() -> void:
	CurrentTool.selecting_tool(DataTypes.Tool.BEET_SEED)
