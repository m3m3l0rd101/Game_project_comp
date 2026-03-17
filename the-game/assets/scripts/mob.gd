extends RigidBody2D
@export var speed: float = 100.0
var direction := -1

@onready var ray = $RayCast2D

func _integrate_forces(state):
	var velocity = state.linear_velocity
	
	# Horizontal movement
	velocity.x = direction * speed
	state.linear_velocity = velocity

	# Turn around if needed
	if not ray.is_colliding():
		direction *= -1
		ray.scale.x *= -1

	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _ready():
	var mob_animation_library=["mob_1","mob_2"]
	$AnimationPlayer.Play(mob_animation_library.pick_random())
