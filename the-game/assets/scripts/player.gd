extends CharacterBody2D
class_name PlayerControl
@onready var death_sound: AudioStreamPlayer = $AudioStreamPlayer2
const DASH_SPEED=400
var dashing = false
var jump_count=0
const SPEED = 300.0
const JUMP_VELOCITY = -350.0
var alive = true
var can_move=true
var can_dash=true
func _physics_process(delta: float) -> void:
	if !alive:
		return
 # gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else :
		jump_count=0
	if can_move:
  # jump
		if Input.is_action_just_pressed("ui_accept") and jump_count<2:
			velocity.y = JUMP_VELOCITY
			jump_count+=1
		if Input.is_action_just_pressed("dashing")and can_dash :
			dashing=true
			can_dash=false
			$dash_timer.start()
			$dash_timer_again.start()
  # movement
	var direction := Input.get_axis("ui_left","ui_right")
	if direction:
		if dashing:
			velocity.x = direction * DASH_SPEED
		else :
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

  # flip sprite
	$animated/Sprite2D.flip_h = direction < 0

  # animation system
	if abs(velocity.x) > 1 or (velocity.x) < -1 :
		$animated/AnimationPlayer.play("run")
	else:
		$animated/AnimationPlayer.play("idle")


func _on_dash_timer_timeout() -> void:
	dashing=false


func _on_dash_timer_again_timeout() -> void:
	can_dash=true
	
@export var max_health := 100
var health := max_health
const amount := 10

func update_health_ui():
	if has_node("res://assets/scenes/areas/main.tscn/CanvasLayer/TextureProgressBar"):
		get_node("res://assets/scenes/areas/main.tscn/CanvasLayer/TextureProgress").value = health
		

var player_died := false
func die():
	get_tree().change_scene_to_file("res://assets/scenes/areas/Next_level.tscn")
	play_audio()
	player_died = true

func take_damage()->void:
	health -= amount
	health = max(health, 0)
	update_health_ui()
	if health == 0: 
		$AudioStreamPlayer2.play()
		die()

var time_finished:=false
func _on_audio_timer_timeout()->void:#func for sfx time_out
	time_finished=true

func play_audio()->void:
	$AudioStreamPlayer2.play()
	$AudioTimer.start()
	if time_finished :
		$AudioStreamPlayer.stop()
		time_finished = !time_finished
	
var coin_count :=0
const coin_amount:= 5
func coin_collection()->void:
	coin_count+=coin_amount
	get_node("res://assets/scenes/areas/main.tscn/CanvasLayer/TextureProgress2").value = coin_count
	
var path
func level_num():
	path = get_tree().current_scene.name
	

	
