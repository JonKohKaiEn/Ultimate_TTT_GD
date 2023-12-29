extends Node

export (PackedScene) var cell_scene

var game_board = []
var player = 1

func init_game_board():
	for _i in range(9):
		game_board.append([0, 0, 0, 0, 0, 0, 0, 0, 0])

const CELL_INCR = 70

func _ready():
	init_game_board()
	print(game_board)
	
	var cell_pos_x = 78
	var cell_pos_y = 78
	
	var cell = cell_scene.instance()
	cell.position = Vector2(cell_pos_x, cell_pos_y)
	add_child(cell)

#	for sub_board_pos in range(9):
#		for cell_pos in range(9):
#			var cell = cell_scene.instance()
#			cell.cell_idx = Vector2(sub_board_pos, cell_pos)
#			cell.position = Vector2(cell_pos_x, cell_pos_y)
#			add_child(cell)
#
#			#cell.get_node("CollisionShape2D") = Vector2(cell_pos_x, cell_pos_y)
#			cell_pos_x += CELL_INCR
#		cell_pos_x = 78
#		cell_pos_y += CELL_INCR
