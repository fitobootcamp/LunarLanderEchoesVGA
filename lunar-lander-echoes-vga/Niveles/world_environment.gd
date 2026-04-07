extends WorldEnvironment

func _ready() -> void:
	environment.background_color = Globals.colorplaneta
func mimulti(_multi):
	environment.background_energy_multiplier = _multi
