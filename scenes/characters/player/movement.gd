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
@export var speed: int = 30

# Called by the state machine once when the state becomes active
## Setup logic (e.g., starting an animation or enabling a collision shape)
func _on_enter() -> void:
	pass

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
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.UP:
		sprite.play("down")
	elif direction == Vector2.DOWN:
		sprite.play("down")
	elif direction == Vector2.LEFT:
		sprite.play("down")
	elif direction == Vector2.RIGHT:
		sprite.play("down")
	
	if direction != Vector2.ZERO:
		player.direction = direction

	player.velocity = direction * speed
	player.move_and_slide()

# Called by the state machine to check the conditions for transitioning to another state
func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")
