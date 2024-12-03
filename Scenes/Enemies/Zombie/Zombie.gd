extends CharacterBody2D

var player = null
var move = Vector2.ZERO
@export var velocidad = 120
@export var vida = 15
@onready var animation_zombie = $AnimatedSprite2D
var golpeado = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if player != null:
		move = position.direction_to(player.position)
	else:
		move = Vector2.ZERO
	velocity = move.normalized() * velocidad
	if !golpeado:
		if velocity.x > 0:
			animation_zombie.flip_h = true
			animation_zombie.play("walking_horizontal")
		elif velocity.x < 0:
			animation_zombie.flip_h = false
			animation_zombie.play("walking_horizontal")
		elif velocity.y > 0:
			animation_zombie.play("walking_up")
		elif velocity.y < 0:
			animation_zombie.play("walking_down")
		else:
			animation_zombie.play("Idle")
	else:
		velocity = Vector2.ZERO
		animation_zombie.play("damaged")
		await animation_zombie.animation_finished
		golpeado = false
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "main_character":
		player = body
		


func _on_area_2d_body_exited(body):
	player = null


func _on_body_body_entered(body):
	if body.is_in_group("bullet"):
		vida = vida - body.damage
		golpeado = true
		if vida == 0:
			GLOBAL.enemies_on_screen = GLOBAL.enemies_on_screen - 1
			queue_free()
