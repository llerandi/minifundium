extends Sprite2D

@onready var hurtbox: Hurtbox = $Hurtbox
@onready var damage: Damage = $Damage

# To get the scene for the log after chopping down the tree
var log_scene_path = preload("res://scenes/objects/environment/trees/log.tscn")
# To get the scene for the sapling after chopping down the tree
var sapling_scene_path = preload("res://scenes/objects/environment/trees/sapling.tscn")

func _ready() -> void:
	hurtbox.struck.connect(on_hurt)
	damage.health_depleted.connect(on_health_depleted)

func on_hurt(hit: int) -> void:
	damage.apply_damage(hit)
	print("Tree: damage is:" , hit)

func on_health_depleted() -> void:
	call_deferred("log_scene_load") # Instantiate the log scene on the next frame
	call_deferred("sapling_scene_load") # Instantiate the sapling scene on the next frame
	
	queue_free()

func log_scene_load() -> void:
	var log_init = log_scene_path.instantiate() as Node2D # Instantiate and cast as Node2D
	log_init.global_position = global_position
	get_parent().add_child(log_init) # Adding the log scene as Node2D to the parent (so here)

func sapling_scene_load() -> void:
	var sapling_init = sapling_scene_path.instantiate() as Node2D # Instantiate and cast as Node2D
	sapling_init.global_position = global_position
	get_parent().add_child(sapling_init) # Adding the sapling scene as Node2D to the parent (so here)
