extends Control
@export var player_controller : PlayerControl

func _on_select_next_pressed() -> void:
	if player_controller.player_died:
		get_tree().change_scene_to_file("")
		$GridContainer/SelectNext.text += 'Restart'
	else:
		get_tree().change_scene_to_file("res://assets/scenes/areas/level_selection.tscn")
		$GridContainer/SelectNext.text += 'Select Next Level'

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/areas/control.tscn")

func dying_menu():
	if player_controller.player_died :
		$RichTextLabel.text += "YOU FAILED"
	else:
		$RichTextLabel.text += "YOU WON"
