extends Control

@export var navebody : Nave
@export var lookatnode : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Node2D.rotation = (navebody.rotation.z - lookatnode.rotation.z) *-1
	pass
