extends Area2D

var eng = false
var startpos = Vector2()
@onready var lbl = $Control/Panel/CenterContainer/Label
@onready var bar = $Control/ProgressBar
@onready var snd = $AudioStreamPlayer

func _ready():
	engl(eng)
	startpos = position

func engl(e):
	eng = e
	if eng: lbl.set_text("It is RUINED!")

func _on_area_entered(area):
	var tween = get_tree().create_tween()
	var tweenb = get_tree().create_tween()
	var rando = Vector2(randi() % 10,randi() % 10)
	tween.tween_property(self, "position", rando+startpos, 0.1)
	tween.tween_property(self, "position", -rando+startpos, 0.1)
	tween.tween_property(self, "position", startpos, 0.05)
	tweenb.tween_property(self, "scale", Vector2(0.8,0.8), 0.1)
	tweenb.tween_property(self, "scale", Vector2(1,1), 0.1)
	if bar.value < 100:
		bar.value += 10
		if bar.value >= 100:
			if eng: lbl.set_text("Now it is unruined!")
			else: lbl.set_text("Nyt on kunnollista!")
			snd.play()
	area.queue_free()
