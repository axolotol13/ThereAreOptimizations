extends CanvasLayer

var time := 0.0

func _ready():
	visible = Global.show_timer

func _process(delta):
	if not visible:
		return
	time += delta
	$TimeLabel.text = format_time(time)

func format_time(t):
	var minutes = int(t / 60)
	var seconds = int(t) % 60
	var millis  = int((t - int(t)) * 100)
	return "%02d:%02d.%02d" % [minutes, seconds, millis]
