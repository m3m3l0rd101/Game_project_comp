extends Control
@export var main : Main
@export var player_controller : PlayerControl

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sfx_pressed() -> void:
	pass


func _on_music_pressed() -> void:
	pass


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/areas/control.tscn")
