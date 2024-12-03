extends CharacterBody2D
var direccion:Vector2
@export var velocidad:int
@export var damage:int
@onready var sprite = $Area2D/Sprite2D
@onready var animation = $Area2D/AnimatedSprite2D

func _physics_process(delta):
	velocity = direccion.normalized() * velocidad
	move_and_slide()


func _on_area_2d_body_entered(body):
		velocity = Vector2.ZERO
		set_physics_process(false)
		sprite.visible = false
		animation.play("boom")
		


func _on_animated_sprite_2d_animation_finished():
	queue_free()
