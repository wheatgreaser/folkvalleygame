extends Control

@onready var career_total : RichTextLabel = $careertotal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	career_total.text = "total food gathered: " + str(Food.food_career_total)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
