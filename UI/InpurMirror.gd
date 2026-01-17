extends CanvasLayer

var max_log_length := 1
var input_log: Array = ["_"]

@onready var container := $Panel/ScrollContainer/VBox
@onready var scroll := $Panel/ScrollContainer
@onready var panel := $Panel


func _ready():
	visible = Global.show_input_mirror
	#Lower panel so it dosnt overlap with speedrun timer
	panel.position.y += 500


func _process(delta):
	if not visible:
		return

	var symbols := ""
	#Add symbols when keys are pressed (Yes I know what a dictionary is but coudnt care less)
	if Input.is_key_pressed(KEY_RIGHT):
		symbols += "→"
	if Input.is_key_pressed(KEY_LEFT):
		symbols += "←"
	if Input.is_key_pressed(KEY_DOWN):
		symbols += "↓"
	if Input.is_key_pressed(KEY_UP):
		symbols += "↑"
	if Input.is_key_pressed(KEY_K):
		symbols += "K"
	if Input.is_key_pressed(KEY_SPACE):
		symbols += "="
	if Input.is_key_pressed(KEY_W):
		symbols += "W"
	if Input.is_key_pressed(KEY_S):
		symbols += "S"
	if Input.is_key_pressed(KEY_A):
		symbols += "A"
	if Input.is_key_pressed(KEY_D):
		symbols += "D"

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
	#Override whatever the default font size is
	rtl.add_theme_font_size_override("normal_font_size", 50)

	rtl.text = "[color=blue][b]" + input_log[0] + "[/b][/color]"

	container.add_child(rtl)

	await get_tree().process_frame
	#Scroll down when the array reches max value (UNUSED)
	var v_scroll := scroll.get_node_or_null("VScrollBar")
	if v_scroll:
		v_scroll.value = v_scroll.max_value
