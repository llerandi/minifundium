extends PanelContainer

@onready var no_tool: Button = $MarginContainer/HBoxContainer/NoTool
@onready var watering_can: Button = $MarginContainer/HBoxContainer/WateringCan
@onready var axe: Button = $MarginContainer/HBoxContainer/Axe
@onready var hoe: Button = $MarginContainer/HBoxContainer/Hoe

func _on_no_tool_pressed() -> void:
	CurrentTool.selecting_tool(DataTypes.Tool.NONE)

func _on_watering_can_pressed() -> void:
	CurrentTool.selecting_tool(DataTypes.Tool.WATERING_CAN)

func _on_axe_pressed() -> void:
	CurrentTool.selecting_tool(DataTypes.Tool.AXE)

func _on_hoe_pressed() -> void:
	CurrentTool.selecting_tool(DataTypes.Tool.HOE)
