extends Area2D
@onready var sound = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "main_character":
		if (GLOBAL.balas_player + 4) > GLOBAL.max_balas:
			GLOBAL.balas_player = GLOBAL.max_balas
		else:
			GLOBAL.balas_player = GLOBAL.balas_player + 4
		sound.play()
		await sound.finished
		queue_free()
