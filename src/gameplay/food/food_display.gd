extends Control


@onready var FoodCount : RichTextLabel = $FoodCount

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	FoodCount.text = "FOOD: " + str(Food.food_count)
