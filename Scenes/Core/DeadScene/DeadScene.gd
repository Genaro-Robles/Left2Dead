extends Control
@onready var sound = $regresar_sound
@onready var fondo = $DeathScreen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jugar_pressed():
	sound.play()
	await sound.finished
	ScreenTransition.load_scene("res://Scenes/Levels/main_menu/main_menu.tscn")
