extends Sprite2D

@onready var hurtbox: Hurtbox = $Hurtbox
@onready var damage: Damage = $Damage

func _ready() -> void:
	hurtbox.struck.connect(on_hurt)
	damage.health_depleted.connect(on_health_depleted)

func on_hurt(hit: int) -> void:
	damage.apply_damage(hit)
	print("Tree: damage is:" , hit)

func on_health_depleted() -> void:
	queue_free()
