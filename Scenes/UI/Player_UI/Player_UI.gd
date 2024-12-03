extends CanvasLayer
@onready var balas = $VBoxContainer/HBoxContainer2/balas
@onready var vidas = $VBoxContainer/HBoxContainer/Label
@onready var cargadores = $VBoxContainer/HBoxContainer3/cargadores

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	balas.text = str(GLOBAL.balas_player)
	vidas.text = str(GLOBAL.vida_player)
	cargadores.text = str(GLOBAL.cargadores)
