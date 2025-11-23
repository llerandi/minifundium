# The following pages are provided for reference:
## GDScript reference: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html
## GDScript styleguide: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html
## Coding the player: https://docs.godotengine.org/en/4.5/getting_started/first_2d_game/03.coding_the_player.html
## Design Patter - State: https://gameprogrammingpatterns.com/state.html
## State Design Pattern: https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
## Nodes and scene instances: https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html

# Inheritance
extends State

@export var chicken: CharacterBody2D
@export var sprite: AnimatedSprite2D

# Variables to handle the interval time between idle and movement
@export var idle_interval: float = 2.0
## Timer: https://docs.godotengine.org/en/stable/classes/class_timer.html
## @onready annotation: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html#onready-annotation
## The timer is here to be a self-contained, reusable component that doesn't depend on a specific scene setup
@onready var idle_timer: Timer = Timer.new()
var idle_timeout: bool = false # Will act as a traffic light for the timeout

# Called by the state machine once when the state becomes active
## Setup logic (e.g., starting an animation or enabling a collision shape)
func _on_enter() -> void:
	sprite.play("front")
	
	# Always reset the timer when entering idle
	idle_timeout = false
	# Starting timer: https://docs.godotengine.org/en/stable/classes/class_timer.html#class-timer-method-start
	idle_timer.start()

# Called by the state machine just before switching to a new state
## For cleanup (e.g., stopping the current animation)
func _on_exit() -> void:
	sprite.stop()
	# Stopping timer: https://docs.godotengine.org/en/stable/classes/class_timer.html#class-timer-method-stop
	idle_timer.stop()

# Called by the state machine's _process function on every frame
## Logic that needs to run continuously but isn't physics-dependent (e.g., checking for input)
func _on_process(_delta: float) -> void:
	pass

# Called by the state machine's _physics_process function at a fixed interval
## Place for all physics-related code (e.g., moving a character)
func _on_physics_process(_delta: float) -> void:
	pass

# Called by the state machine to check the conditions for transitioning to another state
func _on_next_transitions() -> void:
	if idle_timeout:
		transition.emit("Movement")

# Override the ready function
func _ready() -> void:
	# Timer waiting time: https://docs.godotengine.org/en/stable/classes/class_timer.html#class-timer-property-wait-time
	idle_timer.wait_time = idle_interval
	# Timer timeout signal: https://docs.godotengine.org/en/stable/classes/class_timer.html#class-timer-signal-timeout
	idle_timer.timeout.connect(on_idle_timeout) # Will connect to the on_idle_timeout function (below)
	
	# Due the creation of the timer here, this node needs to be added to the scene
	## Add child to node: https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-add-child
	add_child(idle_timer)

# Function for handling the idle timeout
func on_idle_timeout() -> void:
	idle_timeout = true
