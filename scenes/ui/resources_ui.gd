extends PanelContainer

@onready var carrots_quantity: Label = $MarginContainer/VBoxContainer/Carrots/CarrotsQuantity
@onready var turnips_quantity: Label = $MarginContainer/VBoxContainer/Turnips/TurnipsQuantity
@onready var beets_quantity: Label = $MarginContainer/VBoxContainer/Beets/BeetsQuantity
@onready var logs_quantity: Label = $MarginContainer/VBoxContainer/Logs/LogsQuantity
@onready var saplings_quantity: Label = $MarginContainer/VBoxContainer/Saplings/SaplingsQuantity

func on_quantity_changed() -> void:
	var resource: Dictionary = Resources.resources
	
	if resource.has("carrot"):
		carrots_quantity.text = str(resource["carrot"])
		
	if resource.has("carrot"):
		carrots_quantity.text = str(resource["turnip"])
		
	if resource.has("carrot"):
		carrots_quantity.text = str(resource["beet"])	
		
	if resource.has("log"):
		logs_quantity.text = str(resource["log"])
		
	if resource.has("sapling"):
		saplings_quantity.text = str(resource["sapling"])

func _ready() -> void:
	Resources.quantity_changed.connect(on_quantity_changed)
