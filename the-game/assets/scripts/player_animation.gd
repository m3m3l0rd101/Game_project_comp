extends Node2D
class_name PlayerAnimator
@export var player_controller : PlayerControl
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D
func _process(delta):
	if player_controller.direction == 1 :
		sprite.flip_h = false
	elif player_controller.direction == -1 :
		sprite.flip_h = true
		
	if abs(player_controller.velocity.x):
		animation_player.play("run")
	else:
		animation_player.play("idle")
	
