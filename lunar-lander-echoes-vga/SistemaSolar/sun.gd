extends Node3D
@export_enum("X","Y","Z")  var AxisSolar1 
@export_enum("X","Y","Z")  var AxisSolar2 
@export_enum("X","Y","Z")  var RotacionSolar 
@export var verticaltravel = false
@export var planetuimesh = false
var planetcount = randi_range(1,10)
var planets = preload("res://SistemaSolar/planet.tscn")
@export var velocidadrotacion = 1
func _ready() -> void:
	var grados = 360 / planetcount
	
	for i in range(planetcount):
		var planetinstance = planets.instantiate()
		planetinstance.planetui(planetuimesh)
		planetinstance.position[AxisSolar1] = 836 * sin(grados*i) + 0
		planetinstance.position[AxisSolar2] = 836 * cos(grados*i) + 0
		
		$sunmesh/rotacion.add_child(planetinstance)
		if verticaltravel == true:
			planetinstance.global_position.z = 0
		
		pass
	#print(get_children())	
		
		

func _physics_process(delta: float) -> void:
	$sunmesh/rotacion.rotation[RotacionSolar] += velocidadrotacion * delta
