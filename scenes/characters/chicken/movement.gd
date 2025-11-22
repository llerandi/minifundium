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

# Configuring the target position of the ckicken movement
@export var navigation: NavigationAgent2D

# Configuring the speed of the chicken movement
@export var speed_min: float = 1.0
@export var speed_max: float = 6.0
var speed: float

# Called by the state machine once when the state becomes active
## Setup logic (e.g., starting an animation or enabling a collision shape)
func _on_enter() -> void:
	sprite.play("down")

# Called by the state machine just before switching to a new state
## For cleanup (e.g., stopping the current animation)
func _on_exit() -> void:
	sprite.stop()

# Called by the state machine's _process function on every frame
## Logic that needs to run continuously but isn't physics-dependent (e.g., checking for input)
func _on_process(_delta: float) -> void:
	pass

# Called by the state machine's _physics_process function at a fixed interval
## Place for all physics-related code (e.g., moving a character)
func _on_physics_process(_delta: float) -> void:
	# To get the position
	var target_position: Vector2 = navigation.get_next_path_position()
	# To get the facing direction
	var target_direction: Vector2 = chicken.global_position.direction_to(target_position)
	# To flip horizontally the sprite animation like a mirror
	sprite.flip_h = target_direction.x < 0
	chicken.velocity = target_direction * speed
	chicken.move_and_slide()

# Called by the state machine to check the conditions for transitioning to another state
func _on_next_transitions() -> void:
	pass

# Override ready function
func _ready() -> void:
	# Calling the function after the current frame has finished
	call_deferred("chicken_setup")

func chicken_setup() -> void:
	# The navigation agent needs to after the first physics frame and then starts the process
	await get_tree().physics_frame
	
	set_position()

func set_position() -> void:
	var target_position: Vector2 = NavigationServer2D.map_get_random_point(
		navigation.get_navigation_map(),
		navigation.navigation_layers,
		false
	)
	navigation.target_position = target_position
	
	speed = randf_range(speed_min, speed_max)
