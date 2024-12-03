extends Node
@onready var start_sound = $zombies_are_comming
@onready var audio_fondo = $AudioStreamPlayer
@onready var enemy_scene = load("res://Scenes/Enemies/Zombie/Zombie.tscn")
@onready var spawnArea = $main_character/SpawnArea/CollisionShape2D.shape.extents
@onready var origin = $main_character/SpawnArea/CollisionShape2D.global_position -  spawnArea
@onready var spawn_timer = $Timer
@onready var mapa = $Terreno

# Called when the node enters the scene tree for the first time.
func _ready():
	start_sound.play()
	spawn_timer.start()
	await start_sound.finished
	audio_fondo.play()
	

func spawn_enemy():
	# Obtener un punto aleatorio dentro del área
	var random_x = randi_range(origin.x, spawnArea.x)
	var random_y = randi_range(origin.y, spawnArea.y)
	var spawn_position = Vector2(random_x, random_y)
	#print(mapa.get_cell_source_id(0,spawn_position,true))
	
	var enemy = enemy_scene.instantiate()
	enemy.global_position = spawn_position
	add_child(enemy)
	GLOBAL.enemies_on_screen = GLOBAL.enemies_on_screen + 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if GLOBAL.enemies_on_screen < GLOBAL.max_enemies_on_screen:
		spawn_enemy()


func _on_spawn_area_body_exited(body):
	if body.is_in_group("enemies"):
		body.queue_free()
