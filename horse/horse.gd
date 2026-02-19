extends CharacterBody3D

@onready var anim = $Sketchfab_Scene/AnimationPlayer
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var speed = 0
var stamina = 0
var rider
var vel_x = 0
var vel_y = 0
var vel_z = 0
func set_data(data):
	speed = data.speed
	stamina = data.stamina
	rider = data.owner
	print(data)

func gallop():
	vel_z=-1
func stop():
	vel_x = 0
	vel_y = 0
	vel_z = 0
var has_finished_race=false
func _physics_process(delta: float) -> void:
	if position.z < -90:
		if has_finished_race == false:
			stop()
			get_parent().handle_race_win()
			has_finished_race = true
			
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(vel_x,vel_y,vel_z)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
	#anim.play("Skeleton|1 Ilde")
	anim.play("Skeleton|Gallop")
