extends Node2D

# To get the scene for the log after chopping down the tree
var turnip_scene_path = preload("res://scenes/objects/environment/crops/harvesting_turnip.tscn")

@onready var turnip_sprite: Sprite2D = $TurnipSprite
@onready var particles: GPUParticles2D = $Particles
@onready var growth: Growth = $Growth
@onready var hurtbox: Hurtbox = $Hurtbox
@onready var particles_growing: GPUParticles2D = $ParticlesGrowing

var growing_state: DataTypes.Growth = DataTypes.Growth.SEED

func on_hurt(hit: int) -> void:
	if !growth.watered:
		particles.emitting = true
		
		await get_tree().create_timer(10.0).timeout
		
		particles.emitting = false
		growth.watered = true

func on_harvest() -> void:
	var crop_ready_harvest = turnip_scene_path.instantiate() as Node2D
	crop_ready_harvest.global_position = global_position
	
	get_parent().add_child(crop_ready_harvest)
	queue_free()

func on_maturity() -> void:
	particles_growing.emitting = true

func _ready() -> void:
	particles.emitting = false
	particles_growing.emitting = false
	
	hurtbox.struck.connect(on_hurt)
	
	growth.maturity.connect(on_maturity)
	growth.harvesting.connect(on_harvest)

func _process(delta: float) -> void:
	growing_state = growth.get_growth_state()
	turnip_sprite.frame = growing_state
	
	if growing_state == DataTypes.Growth.READY_HARVESTING:
		particles_growing.emitting = true
