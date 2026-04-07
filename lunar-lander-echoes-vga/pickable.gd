extends Node3D
@export var fuelvalue : int

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Nave:
		body.gasser(fuelvalue)
		queue_free()
	pass # Replace with function body.
