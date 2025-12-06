extends Control

@export var ui_width := 200
@export var ui_padding := Vector2(10, 10)

func _ready():
	force_layout()
	set_process(true)

func _process(_delta):
	
	force_layout()

func force_layout():

	anchor_left = 0
	anchor_top = 0
	anchor_right = 0
	anchor_bottom = 0

	offset_left = ui_padding.x
	offset_top = ui_padding.y

	
	custom_minimum_size.x = ui_width

	
	var sc := get_node_or_null("ScrollContainer")
	if sc:
		sc.custom_minimum_size.x = ui_width

	
	var vbox := get_node_or_null("ScrollContainer/VBox")
	if vbox:
		vbox.custom_minimum_size.x = ui_width
		vbox.size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL
