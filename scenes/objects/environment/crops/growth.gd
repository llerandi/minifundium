class_name Growth extends Node

@export var current_growth: DataTypes.Growth = DataTypes.Growth.SEED

signal maturity
signal harvesting

var watered: bool
