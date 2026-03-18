extends AnimatableBody3D


@export var destino : Vector3
@export var duracion = 5.0
var puntos = [Vector3(0,1,0),Vector3(-1,1,0),Vector3(-1,0,0)]

func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SPRING)
	for i in puntos:
		tween.tween_property(self,"global_position", global_position +  i, duracion)
	#tween.tween_property(self,"global_position", global_position +  puntos[0], duracion)
	#tween.tween_property(self,"global_position", global_position +  puntos[1], duracion)
	#tween.tween_property(self,"global_position", global_position +  puntos[2], duracion)
	tween.tween_property(self,"global_position", global_position , duracion)
