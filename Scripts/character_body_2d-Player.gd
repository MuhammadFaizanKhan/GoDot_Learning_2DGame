extends CharacterBody2D

@export var speed = 400
@export var jumpVelocity = -650
@export var jumpCount =2;
@export var jumpCurrentCount = 0;
@export var gravityMultiplayer = 2;
@export var uiLevel:Node2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	ApplyGravity(delta) # Add the gravity.
	HanleJump() # Handle jump and double jump
	HandleMovement()

func ApplyGravity(delta):
	if not is_on_floor():
		velocity.y += gravity * gravityMultiplayer * delta;

func HanleJump():
	if is_on_floor(): jumpCurrentCount =0
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor() or jumpCurrentCount < jumpCount:
			velocity.y = jumpVelocity 
			jumpCurrentCount += 1

func HandleMovement():
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		$SpirteGFX.flip_h = direction <  0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Collectable"):
		uiLevel.UpdateUIScore(body.value)
		body.Collect()
