extends Control


func _on_select_level_1_pressed() -> void:
	load_level("res://assets/scenes/areas/level_1.tscn")

func _on_select_level_2_pressed() -> void:
	load_level("res://assets/scenes/areas/level_2.tscn")

func _on_level3_pressed():
	load_level("res://assets/scenes/areas/level_3.tscn")


func load_level(path):
	get_tree().change_scene_to_file(path)


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/areas/control.tscn")
