extends CanvasLayer

var max_log_length := 1
var input_log: Array = ["_"]

@onready var container := $Panel/ScrollContainer/VBox
@onready var scroll := $Panel/ScrollContainer


func _process(delta):
	var symbols := ""

	
	if Input.is_action_pressed("ui_right"):
		symbols += "→"
	if Input.is_action_pressed("ui_left"):
		symbols += "←"
	if Input.is_action_pressed("ui_down") || Input.is_key_pressed(KEY_S):
		symbols += "↓"
	if Input.is_action_pressed("jump") || Input.is_key_pressed(KEY_W):
		symbols += "↑"

	
	if symbols == "":
		symbols = "_"


	if input_log[0] != symbols:
		input_log[0] = symbols
		refresh_display()


func refresh_display():
	for child in container.get_children():
		child.queue_free()

	var rtl := RichTextLabel.new()
	rtl.bbcode_enabled = true
	rtl.fit_content = true
	rtl.scroll_active = false
	rtl.text = "[color=red][b]" + input_log[0] + "[/b][/color]"

	container.add_child(rtl)

	await get_tree().process_frame

	var v_scroll := scroll.get_node_or_null("VScrollBar")
	if v_scroll:
		v_scroll.value = v_scroll.max_value
