extends Control
@onready var sound = $regresar_sound
@onready var zombie = $HBoxContainer/zombie
@onready var player = $HBoxContainer/player
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	zombie.play("walking_down")
	player.play("walk_down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_jugar_pressed():
	sound.play()
	await sound.finished
	ScreenTransition.load_scene("res://Scenes/Levels/main_menu/main_menu.tscn")


func _on_timer_timeout():
	var cambio = randi() % 10
	if cambio <= 2:
		zombie.play("walking_horizontal")
		player.flip_h = true
		player.play("walk_X")
	elif cambio <= 5:
		zombie.play("damaged")
		player.flip_h = true
		player.play("damaged")
	elif cambio <= 10:
		zombie.play("walking_down")
		player.flip_h = false
		player.play("walk_down")
	print("tiempo: ",cambio)
