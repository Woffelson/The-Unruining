extends CharacterBody2D

@export var korjaus : Resource

var grw = 1152 #replacing global.room_width
var grh = 648
var dir = -1

@onready var tsk = $AudioStreamPlayer
@onready var spr = $AnimatedSprite2D
@onready var vas = $Sprite2D
#@onready var tween = get_tree().create_tween()

const SPEED = 300.0

func _physics_process(_delta):
	rajatkii(0,grw,0,grh,50,50,100,100)
	if Input.is_action_just_pressed("ui_accept"):
		tsk.play()
		var korj = korjaus.instantiate()
		add_child(korj)
		korj.position.x = dir*32
		var tween = get_tree().create_tween()
		tween.tween_property(vas, "rotation", 0, 0.2)
		vas.rotation = 10
		#vas.rotation = -10
	var hordir = Input.get_axis("ui_left", "ui_right")
	var verdir = Input.get_axis("ui_up", "ui_down")
	if hordir || verdir:
		velocity = Vector2(hordir,verdir).normalized()*SPEED
		spr.animation = "walk"
	else:
		velocity = Vector2.ZERO
		spr.animation = "default"
	if hordir != 0: dir = hordir
	if dir == 1:
		spr.flip_h = true
		vas.flip_h = true
	elif dir == -1:
		spr.flip_h = false
		vas.flip_h = false
	move_and_slide()

func rajatkii(rooml,roomr,roomt,roomb,sprite_xoffset,sprite_yoffset,sprite_width,sprite_height):
	position.x = min(max(position.x,rooml + sprite_xoffset),roomr + sprite_xoffset - sprite_width)
	position.y = min(max(position.y,roomt + sprite_yoffset),roomb + sprite_yoffset - sprite_height)
