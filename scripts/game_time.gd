extends Node

const HOUR_MINUTES: int = 60
const DAY_HOURS: int = 24

# TAU is a constant that is Pi number * 2 (so, ~6.283)
## https://docs.godotengine.org/en/stable/classes/class_%40gdscript.html#class-gdscript-constant-tau
const MINUTE_GAME: float = TAU / (HOUR_MINUTES * DAY_HOURS)

var game_speed: float = 2.0

var init_day: int = 1
var init_hour: int = 0
var init_minute: int = 0

var time: float = 0.0
var current_minute: int = -1
var current_day: int = 0

signal game_time(time: float)
signal tick(minute: int, hour: int, day: int)
signal tick_day(day: int)

func _ready() -> void:
	initial_time()

func _process(delta: float) -> void:
	time += delta * game_speed * MINUTE_GAME
	game_time.emit(time)
	
	recaculate_time() # Recalculate the time

# Function for handling the recalculation of the ingame time to upload the Game Time UI panels
func recaculate_time() -> void:
	var total_minutes: int = int(time / MINUTE_GAME)
	var day: int = int(total_minutes / (HOUR_MINUTES * DAY_HOURS))
	var current_day_minutes: int = total_minutes % (HOUR_MINUTES * DAY_HOURS)
	var hour: int = int(current_day_minutes / HOUR_MINUTES)
	var minute: int = int(current_day_minutes % HOUR_MINUTES)
	
	emit_recaculated_time(minute, hour, day)

func emit_recaculated_time(minute: int, hour: int, day: int) -> void:
	if current_minute != minute:
		current_minute = minute
		tick.emit(minute, hour, day)
	
	if current_day != day:
		current_day = day
		tick_day.emit(day)

func initial_time() -> void:
	var init_total_minutes = (
		init_day *
		(HOUR_MINUTES * DAY_HOURS) +
		(init_hour * HOUR_MINUTES) +
		init_minute
	)
	
	time = init_total_minutes * MINUTE_GAME
