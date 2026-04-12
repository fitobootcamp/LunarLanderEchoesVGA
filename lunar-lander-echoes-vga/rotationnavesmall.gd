extends MeshInstance3D
@export var speed: float
func _physics_process(delta: float) -> void:
	rotation.y += speed * delta
