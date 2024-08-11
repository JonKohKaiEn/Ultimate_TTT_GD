extends Control


enum GameState {RUNNING, END}


var board := [
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0]
]
var subgrids := [0, 0, 0, 0, 0, 0, 0, 0, 0]
var curr_player: int
var prev_move: Array
var gamestate: GameState


func _ready() -> void:
	EventBus.cell_pressed.connect(update_board)
	curr_player = 1
	gamestate = GameState.RUNNING
	prev_move = [-1, 0]


func update_board(move: Array) -> void:
	if is_valid_move(move):
		board[move[0]][move[1]] = curr_player
		curr_player *= -1
		prev_move = move


func is_valid_move(move: Array) -> bool:
	return (move[0] == prev_move[1] or prev_move[0] == -1) and (board[move[0]][move[1]] == 0)


func check_board_status(check_board: Array) -> int:
	
	var checklist_arr := [
		[0, 1, 2], [3, 4, 5], [6, 7, 8],
		[0, 3, 6], [1, 4, 7], [2, 5, 8],
		[0, 4, 8], [2, 4, 6]
	]
	
	# check rows, columns, diagonals
	for checklist in checklist_arr:
		if (board[checklist[0]] == board[checklist[1]] == board[checklist[2]]) and board[checklist[0]] != 0:
			return board[checklist[0]]
	
	# check if it's a draw
	if check_board.all(func(n): n != 0):
		return 2
	
	# board has not been decided
	return 0
