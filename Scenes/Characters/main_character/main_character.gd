class_name main_character
extends CharacterBody2D
@export var speed : float
@onready var _animated_sprite = $AnimatedSprite2D
@onready var reload_time = $Reload
@onready var pisadas_sound = $AudioStreamPlayer
@onready var shot_animation = $HandAnchor/Shooter/Sprite2D/AnimatedSprite2D
@onready var reload_sound = $reload_sound
@onready var no_ammo_sound = $no_ammo_sound
@onready var damaged_sound = $golpe_sound
var golpeado = false

var bullet = load("res://Scenes/Core/bullet/bullet.tscn")
var attack_started = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	motion_ctrl()
	reload_time.stop()
	print("inicio juego")

func _physics_process(delta):
	motion_ctrl()
	
func _process(delta):
	if Input.is_action_just_pressed("RealoadScene"):
		ScreenTransition.reload_scene()
	if Input.is_action_just_pressed("RecargarArma"):
		if GLOBAL.cargadores > 0:
			reload_sound.play()
			GLOBAL.cargadores = GLOBAL.cargadores - 1
			await reload_sound.finished
			GLOBAL.balas_player = GLOBAL.max_balas
		else:
			print("No mas cargadores")
	if Input.is_action_just_pressed("disparar"):
		if attack_started:
			return
		else:
			attack_started = true
			disparar()
			await get_tree().create_timer(0.3).timeout
			attack_started = false	
	
func disparar():
	if GLOBAL.balas_player > 0:
		var new_bullet = bullet.instantiate()
		new_bullet.global_position = $HandAnchor/Shooter.global_position
		var direction_to_mouse = get_global_mouse_position() - $HandAnchor/Shooter.global_position
		new_bullet.direccion = get_global_mouse_position() - $HandAnchor/Shooter.global_position
		new_bullet.rotation = $HandAnchor.rotation_angle
		shot_animation.play("shoot")
		get_parent().add_child(new_bullet)
		GLOBAL.balas_player = GLOBAL.balas_player - 1
	else:
		no_ammo_sound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x * speed
	velocity.y = GLOBAL.get_axis().y * -speed
	if !golpeado:
		if velocity.x != 0 or velocity.y != 0:
			if !pisadas_sound.playing:
				pisadas_sound.play()
		if velocity.x > 0:
			_animated_sprite.flip_h = false
			_animated_sprite.play("walk_X")
		elif velocity.x < 0:
			_animated_sprite.flip_h = true
			_animated_sprite.play("walk_X")
		elif velocity.y > 0:
			_animated_sprite.play("walk_down")
		elif velocity.y < 0:
			_animated_sprite.play("walk_up")
		else:
			_animated_sprite.play("Idle")
			pisadas_sound.stop()
	else:
		_animated_sprite.play("damaged")
		await _animated_sprite.animation_finished
		golpeado = false
	#print("velocidad X: ",velocity.x)
	#print("velcidad Y: ", velocity.y)
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		if golpeado == false:
			golpeado = true
			GLOBAL.vida_player = GLOBAL.vida_player - 1
			damaged_sound.play()
			if GLOBAL.vida_player == 0:
				ScreenTransition.load_scene("res://Scenes/Core/DeadScene/DeadScene.tscn")
