class_name main_character
extends CharacterBody2D

@export var speed : float


# Called when the node enters the scene tree for the first time.
func _ready():
	motion_ctrl()
	print("inicio juego")

func _physics_process(delta):
	motion_ctrl()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x * speed
	velocity.y = GLOBAL.get_axis().y * -speed
	#print("velocidad X: ",velocity.x)
	#print("velcidad Y: ", velocity.y)
	
	move_and_slide()
