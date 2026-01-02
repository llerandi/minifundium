class_name Growth extends Node

@export var current_growth: DataTypes.Growth = DataTypes.Growth.SEED
@export_range(5, 365) var harvest_days: int = 5

signal maturity
signal harvesting

var watered: bool
var starting: int
var current: int

func on_tick_day(day: int) -> void:
	if watered:
		if starting == 0:
			starting = day
		
		growing(starting, day)
		crop_state(starting, day)

func _ready() -> void:
	GameTime.tick_day.connect(on_tick_day)

func growing(starting: int, current: int):
	if current_growth == DataTypes.Growth.READY_HARVESTING: # Ready to harvest it
		return
	
	var states = 5
	
	var planted_days = (current - starting) % states
	var index = planted_days % states + 1
	current_growth = index
	
	var name = DataTypes.Growth.keys()[current_growth]
	print(
		"Current growth: ", name,
		" State: ", index
	)
	
	if current_growth == DataTypes.Growth.READY_HARVESTING: # Ready to harvest it
		maturity.emit()

func crop_state(starting: int, current: int) -> void:
	if current_growth == DataTypes.Growth.CROP: # Is already harvested
		return
	
	var planted_days = (current - starting) % harvest_days
	
	if planted_days == harvest_days - 1:
		current_growth = DataTypes.Growth.CROP
		harvesting.emit()

func get_growth_state() -> DataTypes.Growth:
	return current_growth
