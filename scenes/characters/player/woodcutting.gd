# The following pages are provided for reference:
## GDScript reference: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html
## GDScript styleguide: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html
## Coding the player: https://docs.godotengine.org/en/4.5/getting_started/first_2d_game/03.coding_the_player.html
## Design Patter - State: https://gameprogrammingpatterns.com/state.html
## State Design Pattern: https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
## Nodes and scene instances: https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html

# Inheritance
extends State

@export var player: Player
@export var sprite: AnimatedSprite2D
@export var hitbox_collision: CollisionShape2D

func _ready() -> void:
	hitbox_collision.disabled = true
	# To reset the collider position to the middle, its configuration is done using code in the _on_enter() function
	hitbox_collision.position = Vector2(0, 0)

# Called by the state machine once when the state becomes active
## Setup logic (e.g., starting an animation or enabling a collision shape)
func _on_enter() -> void:
	if player.direction == Vector2.UP:
		sprite.play("chopping_up")
		# The position is achieved in the visual editor within Transform > Position(x, y)
		hitbox_collision.position = Vector2(2, -20)
	elif player.direction == Vector2.DOWN:
		sprite.play("chopping_down")
		# The position is achieved in the visual editor within Transform > Position(x, y)
		hitbox_collision.position = Vector2(-2, 2)
	elif player.direction == Vector2.LEFT:
		sprite.play("chopping_left")
		# The position is achieved in the visual editor within Transform > Position(x, y)
		hitbox_collision.position = Vector2(-8, -2)
	elif player.direction == Vector2.RIGHT:
		sprite.play("chopping_right")
		# The position is achieved in the visual editor within Transform > Position(x, y)
		hitbox_collision.position = Vector2(8, -2)
	
	hitbox_collision.disabled = false # To activate it

# Called by the state machine just before switching to a new state
## For cleanup (e.g., stopping the current animation)
func _on_exit() -> void:
	sprite.stop()
	hitbox_collision.disabled = true

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
	if !sprite.is_playing():
		transition.emit("Idle")
