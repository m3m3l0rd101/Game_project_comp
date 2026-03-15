extends RigidBody2D
func _ready():
	$AnimationPlayer.Play()
	
func _process(delta):
	pass
	
	
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
