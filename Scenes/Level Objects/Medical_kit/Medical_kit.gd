extends Area2D
@onready var sound = $AudioStreamPlayer
@onready var sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "main_character":
		sprite.visible = false
		if (GLOBAL.vida_player + 1) > GLOBAL.max_vida_player:
			GLOBAL.vida_player = GLOBAL.max_vida_player
		else:
			GLOBAL.vida_player = GLOBAL.vida_player + 1
		sound.play()
		await sound.finished
		queue_free()
