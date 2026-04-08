extends Control

@export var navebody : Nave


func _physics_process(delta: float) -> void:
	
	$Label.text = str(int((Vector3(0,0,0).distance_to(navebody.position)-30)))
	
