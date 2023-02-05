extends Node2D

var eng = true
var room_width = 0
var room_height = 0
@onready var pl = $Chara
@onready var roskis = $Roskis
@onready var kunto = $kunto
@onready var rekt = $Control/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	roskis.engl(eng)
	kunto.engl(eng)
	get_tree().get_root().connect("size_changed",Callable(self, "resize")) #important custom signal!

func resize(): #this will update everytime resize happens because of the signal!!!
	#print("Resizing: ", get_viewport_rect().size)
	room_width = get_viewport().size.x
	room_height = get_viewport().size.y
	pl.grw = room_width
	pl.grh = room_height
	rekt.size = get_viewport().size
