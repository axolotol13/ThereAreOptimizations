extends CanvasLayer

var time := 0.0

func _ready():
	visible = Global.show_timer

func _process(delta):
	if not visible:
		return
	if Global.isCounting == true:
		#Always count unless Global.counting is false
		time += delta
		$TimeLabel.text = format_time(time)

func format_time(t):
	if Global.isCounting == true:
		#Handling accurately showing time
		var minutes = int(t / 60)
		var seconds = int(t) % 60
		var millis  = int((t - int(t)) * 100)
		return "%02d:%02d.%02d" % [minutes, seconds, millis]
