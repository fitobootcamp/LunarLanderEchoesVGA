extends Node3D


@export var radio: float = 20.0      # Radio del cilindro
@export var segmentos: int = 100     # Cuántos bloques forman el círculo
@export var profundidad: int = 10    # Ancho del cilindro (eje Z)
@export var escala_ruido: float = 0.1
@export var altura_max: float = 5.0

func _ready():
	generar_mundo()

func generar_mundo():
	var ruido = FastNoiseLite.new()
	ruido.seed = randi()
	ruido.frequency = escala_ruido

	for i in range(segmentos):
		# Calcular ángulo para cada rebanada del cilindro
		var angulo = (float(i) / segmentos) * TAU
		
		for z in range(profundidad):
			# Obtener valor de ruido para montañas/valles
			var n = ruido.get_noise_2d(float(i), float(z))
			var altura_extra = n * altura_max
			
			# Crear el bloque (Caja)
			var box = MeshInstance3D.new()
			box.mesh = BoxMesh.new()
			add_child(box)
			
			# Posicionamiento Cilindrico:
			# El bloque se aleja del centro según el radio + el ruido
			var dist = radio + altura_extra
			box.position = Vector3(cos(angulo) * dist, sin(angulo) * dist, z)
			
			# Rotar el bloque para que mire hacia afuera del centro
			box.rotation.z = angulo + PI/2
			
			# Colores simples: Agua, Tierra, Montaña
			var mat = StandardMaterial3D.new()
			if altura_extra < -1.0:
				mat.albedo_color = Color.BLUE # Agua/Valles profundos
			elif altura_extra > 1.5:
				mat.albedo_color = Color.DARK_GRAY # Montañas
			else:
				mat.albedo_color = Color.GREEN # Pasto
			box.material_override = mat
