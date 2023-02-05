extends Area2D

var eng = false
@onready var lbl = $Panel/CenterContainer/Label

func _ready():
	engl(eng)

func engl(e):
	eng = e
	if eng: lbl.set_text("Get ruined!")

func _on_area_entered(area):
	get_tree().quit()
