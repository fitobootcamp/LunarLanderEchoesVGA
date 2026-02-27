extends Node3D
var planetcount = 5
var planets = preload("res://SistemaSolar/planet.tscn")
var velocidadrotacion = 1
func _ready() -> void:
	var grados = 360 / planetcount
	for i in range(planetcount):
		var planetinstance = planets.instantiate()
		planetinstance.position.z = 836 * sin(grados*i) + 0
		planetinstance.position.x = 836 * cos(grados*i) + 0
		$sunmesh/rotacion.add_child(planetinstance)
		
		pass
	print(get_children())	
		
		

func _physics_process(delta: float) -> void:
	$sunmesh/rotacion.rotation.y += velocidadrotacion * delta
