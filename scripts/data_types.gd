class_name DataTypes

# This enum prevents typos, instead of writing "axe" or "aXE", will write DataTypes.Tool.AXE
enum Tool {
	NONE, # When the player has nothing equipped or is not interacting with anything
	AXE, # To chop down trees
	HOE, # To till the soil ground
	WATERING_CAN, # To watering crops
}
