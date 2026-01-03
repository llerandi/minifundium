extends Control

@onready var day_label: Label = $Day/MarginContainer/DayLabel
@onready var time_label: Label = $Time/MarginContainer/TimeLabel

@export var speed_x1: int = 100
@export var speed_x2: int = 200

func _on_x_1_pressed() -> void:
	GameTime.game_speed = speed_x1

func _on_x_2_pressed() -> void:
	GameTime.game_speed = speed_x2

func _ready() -> void:
	GameTime.tick.connect(on_tick)

func on_tick(minute: int, hour: int, day: int) -> void:
	day_label.text = "Day " + str(day)
	time_label.text = "%02d:%02d" % [hour, minute] # String formatter
