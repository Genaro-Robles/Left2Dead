class_name HandAnchor
extends Node2D
@export var default_direction = Vector2.RIGHT
@onready var sprite_pistola = $Shooter/Sprite2D
var rotation_angle

func _ready():
	var direction_to_cursor = global_position.direction_to(default_direction)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cursor_position = get_global_mouse_position()
	rotation_angle = global_position.angle_to_point(cursor_position)
	rotation = rotation_angle
	if (rotation_angle > 1.7 || rotation_angle < -1.7):
		sprite_pistola.flip_v = true
	else:
		sprite_pistola.flip_v = false
