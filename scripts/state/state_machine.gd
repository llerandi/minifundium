# The following pages are provided for reference:
## GDScript reference: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html
## GDScript styleguide: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html
## Coding the player: https://docs.godotengine.org/en/4.5/getting_started/first_2d_game/03.coding_the_player.html
## Design Patter - State: https://gameprogrammingpatterns.com/state.html
## State Design Pattern: https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
## Nodes and scene instances: https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html

# Class definition and inheritance
class_name StateMachine extends Node

# This is for keeping the first state
@export var initial_state: State

# The idea is to have different states, so they'll be saved here
var states: Dictionary = {}
var current_state: State
var current_state_name: String

# Called when the node enters the scene tree for the first time
## Handles the initial setup of the state machine
func _ready() -> void:
	if initial_state:
		initial_state._on_enter()
		current_state = initial_state
		current_state_name = current_state.name.to_lower() # To avoid CAPS typos

# Called on every rendered frame, delegates the frame-processing logic to the currently active state
## 'delta' is the elapsed time since the previous frame
func _process(delta: float) -> void:
	if current_state:
		current_state._on_process(delta)

# Runs at a fixed interval and delegates physics-related logic to the active state
func _physics_process(delta: float) -> void:
	if current_state:
		current_state._on_physics_process(delta)
		current_state._on_next_transitions()

# Handles the logic of switching from one state to another
func transition_to() -> void:
	pass # I've only 1 state right now
