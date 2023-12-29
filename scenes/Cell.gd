extends Area2D

onready var X = preload("res://assets/X.png")
onready var O = preload("res://assets/O.png")

var selected = false
export var cell_idx = Vector2.ZERO  # Vector2(sub_board, cell)

func play_x():
	$X_O.texture = X
	selected = true
	$MouseOver.hide()


func _ready():
	$MouseOver.hide()
	#$MouseOver.position = self.position
	print(self.position)
	print($MouseOver.position)


func _on_Cell_mouse_entered():
	if not selected:
		$MouseOver.show()


func _on_Cell_mouse_exited():
	$MouseOver.hide()


func _on_Cell_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton) and (not selected):
		if event.button_index == BUTTON_LEFT:
			play_x()
