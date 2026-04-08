extends Control
@export var navebody : Nave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$TextureProgressBar.value = navebody.combustible
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TextureProgressBar.value = navebody.combustible
	
