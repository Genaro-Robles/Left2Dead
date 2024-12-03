extends Control
@onready var btn_jugar_sound = $btn_jugar_sound

func _ready():
	pass	

func _on_jugar_pressed():
	btn_jugar_sound.play()
	await btn_jugar_sound.finished
	ScreenTransition.load_scene("res://Scenes/Levels/level_1/level_1.tscn")

func _on_salir_pressed():
	get_tree().quit()


func _on_creditos_pressed():
	btn_jugar_sound.play()
	await btn_jugar_sound.finished
	ScreenTransition.load_scene("res://Scenes/Core/CreditsScene/CreditsScene.tscn")
