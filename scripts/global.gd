extends Node

# Movimientos del player, ejes de movimiento
var axis : Vector2
var vida_player = 3
var max_vida_player = 3
var balas_player = 16
var max_balas = 16
var cargadores = 3
var max_cargadores = 3
var max_enemies_on_screen = 30
var enemies_on_screen = 0

#Funcion para retornar la dirección pulsada
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("derecha")) - int(Input.is_action_pressed("izquierda"))
	axis.y = int(Input.is_action_pressed("arriba")) - int(Input.is_action_pressed("abajo"))
	#print("Axis: ",axis)
	return axis.normalized()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
