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
		if (GLOBAL.cargadores + 1) > GLOBAL.max_cargadores:
			GLOBAL.cargadores = GLOBAL.max_cargadores
		else:
			GLOBAL.cargadores = GLOBAL.cargadores + 1
	
		sound.play()
		await sound.finished
		queue_free()
