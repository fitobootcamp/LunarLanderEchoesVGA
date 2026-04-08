extends Control
@export var navebody : Nave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$TextureProgressBar.value = navebody.combustible
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if navebody.combustible <= 20:		
		$Empty.visible = true
	elif navebody.combustible <= 80:
		$Full.visible = false
	elif navebody.combustible >= $TextureProgressBar.max_value:
		$Full.visible = true
		
	$TextureProgressBar.value = navebody.combustible
	
