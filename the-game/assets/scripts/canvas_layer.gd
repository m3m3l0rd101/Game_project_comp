extends CanvasLayer

@onready var text_label = $Panel/TextLabel
@onready var name_label = $Panel/NameLabel

var dialogue_lines = []
var current_line := 0
var typing_speed := 0.02
var is_typing := false

func start_dialogue(lines: Array):
	dialogue_lines = lines
	current_line = 0
	visible = true
	show_line()

func show_line():
	if current_line >= dialogue_lines.size():
		end_dialogue()
		return

	var line = dialogue_lines[current_line]
	name_label.text = line.get("name", "")
	await type_text(line.get("text", ""))

func type_text(text):
	is_typing = true
	text_label.text = ""

	for char in text:
		text_label.text += char
		await get_tree().create_timer(typing_speed).timeout

	is_typing = false

func _input(event):
	if not visible:
		return

	if event.is_action_pressed("ui_accept"):
		if is_typing:
			# skip typing
			text_label.text = dialogue_lines[current_line]["text"]
			is_typing = false
		else:
			current_line += 1
			show_line()

func end_dialogue():
	visible = false
