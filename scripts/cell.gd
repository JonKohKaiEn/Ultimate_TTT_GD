extends TextureButton


@export var subgrid: int
@export var cell: int


func _on_button_up() -> void:
	EventBus.cell_pressed.emit(subgrid, cell)
