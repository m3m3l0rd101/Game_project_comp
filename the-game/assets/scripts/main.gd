extends Node2D
class_name Main
@export var player_controller : PlayerControl

func _ready() -> void:
	pass 



func _process(delta: float) :
	$AudioStreamPlayer.play()
	


func _on_texture_progress_bar_value_changed(value: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/areas/pause_menu.tscn")
