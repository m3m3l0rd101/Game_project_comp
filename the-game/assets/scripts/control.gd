extends Control
@export var player_controller : PlayerControl



func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.	
func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/areas/level_selection.tscn")

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/areas/Option.tscn")
