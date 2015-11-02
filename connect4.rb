require_relative 'Board'
require_relative 'Player'

def create_player n

	symbols = ["O", "X"]

	puts "Player #{n}, give me your name:"
	player_name = STDIN.gets.chomp

	if player_name == ""
		player_name = "anonymous" 
		puts player_name
	end

	Player.new(player_name, symbols[n-1])
end

def draw_board(board)
	system("clear")
	board.draw_board
end

def main

	puts "CONNECT 4!"

	player_1 = create_player 1
	player_2 = create_player 2
	
	board = Board.new

	system("clear")


	curr_player = player_1

	we_gotta_winner = false

	until we_gotta_winner

		draw_board(board)
		
		loop do
			square = board.get_input(curr_player)
			available_square = board.available_square_in?(square, curr_player)
			break if available_square
		end

		we_gotta_winner = board.has_won?

		if we_gotta_winner
			
			draw_board(board)
			puts "#{curr_player.name}, you've won the game!!!"
			return
		end

		if board.its_a_tie
			draw_board(board)
			puts "It's a Tie."
			puts "*** GAME OVER ***"
			return
		end

		if curr_player == player_1
			curr_player = player_2
		else
			curr_player = player_1
		end
	end
	nil
end

if __FILE__ == $0
	main
end