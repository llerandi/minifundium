extends Node

var current_tool: DataTypes.Tool = DataTypes.Tool.NONE

signal selected_tool(tool: DataTypes.Tool)

func selecting_tool(tool: DataTypes.Tool) -> void:
	selected_tool.emit(tool)
	current_tool = tool
