extends CharacterBody2D
class_name PlayerControl


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -200.0
var screen_size
var direction =0
func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	 #if not is_on_floor():
  		#velocity += get_gravity() * delta
  		#animated_sprite_2d.play("Jump")
 	#else :
  		#jump_count=0
 	#if can_move:
  		## jump
  	#if Input.is_action_just_pressed("Jump") and jump_count<2:
  	 #velocity.y = JUMP_VELOCITY
   	#jump_sound.play()
  	 #jump_count+=1

	move_and_slide()
	
@export var max_health := 100
var health := max_health
const amount := 10

func update_health_ui():
	if has_node("res://assets/scenes/areas/main.tscn/CanvasLayer/TextureButton"):
		#get_node("res://assets/scenes/areas/main.tscn/CanvasLayer/TextureButton").value = health
		print("path doesn't exist")

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
	

	
