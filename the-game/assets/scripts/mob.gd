extends Area2D
@export var player_controller : PlayerControl
const speed := 50
var direction := -1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	var mob_animations := ["mob_1","mob_2"]
	$AnimatedSprite2D.play(mob_animations.pick_random())
	
func turn_around():
	direction *= -1
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	$RayCast2D.target_position.x *= -1
	
func _process(delta: float):
	position.x += speed * direction * delta
	if $RayCast2D2.is_colliding() and !$RayCast2D.is_colliding():
		turn_around()
	if !$RayCast2D.is_colliding():
		turn_around()
	if body_name == "player" and Input.is_action_just_pressed("key_E"):
		call_deferred("_disable_collision")
		visible = false



var body_name
func _on_body_entered(body: Node2D) -> void:
	if body.name =="player" :
		player_controller.take_damage()
		player_controller.play_audio()
		body_name = body.name
	
