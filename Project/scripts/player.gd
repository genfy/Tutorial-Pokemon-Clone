
extends KinematicBody2D

var direction = Vector2(0,0)
var startPos = Vector2(0,0)
var moving = false

var canMove = true
var pressed = false

const SPEED = 1
const GRID = 16

var world

var sprite
var animationPlayer

func _ready():
	world = get_world_2d().get_direct_space_state()
	set_fixed_process(true)
	set_process_input(true)
	sprite = get_node("Sprite")
	animationPlayer = get_node("AnimationPlayer")

func _input(event):
	if event.is_action_pressed("ui_interact"):
		pressed = true
	elif event.is_action_released("ui_interact"):
		pressed = false

func _fixed_process(delta):
	if !moving and canMove:
		var resultUp = world.intersect_point(get_pos() + Vector2(0, -GRID))
		var resultDown = world.intersect_point(get_pos() + Vector2(0, GRID))
		var resultLeft = world.intersect_point(get_pos() + Vector2(-GRID, 0))
		var resultRight = world.intersect_point(get_pos() + Vector2(GRID, 0))
		
		if Input.is_action_pressed("ui_up"):
				sprite.set_frame(0)
				if resultUp.empty():
					moving = true
					direction = Vector2(0, -1)
					startPos = get_pos()
					animationPlayer.play("walk_up")
		elif Input.is_action_pressed("ui_down"):
			sprite.set_frame(6)
			if resultDown.empty():
				moving = true
				direction = Vector2(0, 1)
				startPos = get_pos()
				animationPlayer.play("walk_down")
		elif Input.is_action_pressed("ui_left"):
			sprite.set_frame(3)
			if resultLeft.empty():
				moving = true
				direction = Vector2(-1, 0)
				startPos = get_pos()
				animationPlayer.play("walk_left")
		elif Input.is_action_pressed("ui_right"):
			sprite.set_frame(9)
			if resultRight.empty():
				moving = true
				direction = Vector2(1, 0)
				startPos = get_pos()
				animationPlayer.play("walk_right")
		
		if pressed:
			if sprite.get_frame() == 0:
				interact(resultUp)
			elif sprite.get_frame() == 6:
				interact(resultDown)
			elif sprite.get_frame() == 3:
				interact(resultLeft)
			elif sprite.get_frame() == 9:
				interact(resultRight)
	elif canMove:
		move_to(get_pos() + direction * SPEED)
		if get_pos() == startPos + Vector2(GRID * direction.x, GRID * direction.y):
			moving = false
	pressed = false

func interact(result):
	for dictionary in result:
		if typeof(dictionary.collider) == TYPE_OBJECT and dictionary.collider.has_node("Interact"):
			get_node("Camera2D/Dialogue Box").set_hidden(false)
			get_node("Camera2D/Dialogue Box")._print_dialogue(dictionary.collider.get_node("Interact").text)