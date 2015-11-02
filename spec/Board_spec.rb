require 'spec_helper'

describe Board do

	before :each do
		@board = Board.new
		@player1 = Player.new("Beto", "O")
		@player2 = Player.new("Chio", "X")

	end

	describe "#new" do
		it "returns a new board object" do
			expect(@board).to be_an_instance_of(Board)
		end
	end

	# describe "#get_input" do
	# 	it "transforms the user input from letter into number" do
	# 		expect(@board.get_input).to eql(2)
	# 	end
	# end

	describe "#is_valid_move?" do
		it "should allow the move if the chosen column has space" do

		end
	end
	
	describe "#move" do
		it "inserts a chip into the board (array)" do
			expect(@board.available_square_in?(2, @player1)).to eql(true)
		end
	end

	describe "#its_a_tie" do
		it "returns false when the board is not full yet" do
			expect(@board.its_a_tie).to eql(false)
		end

		it "returns true when the board is full" do
			@board.board_array = [%w[X]*6]*7
			expect(@board.its_a_tie).to eql(true)
		end
	end

	describe "#has_won?" do
		it "returns true when connected a vertical 4" do
			@board.board_array = [["X","O","O","O","·","·"],
								  ["·","·","·","·","·","·"],
								  ["·","·","·","·","·","·"],
								  ["O","O","X","X","X","X"],
								  ["·","·","·","·","·","·"],
								  ["·","·","·","·","·","·"],
								  ["·","·","·","·","·","·"]]

			expect(@board.has_won?). to eql(true)
		end

		it "returns true when connected an horizontal 4" do
			@board.board_array = [["X","O","O","O","·","·"],
								  ["X","·","·","·","·","·"],
								  ["X","·","·","·","·","·"],
								  ["O","O","X","X","X","·"],
							      ["O","·","·","·","·","·"],
							      ["O","·","·","·","·","·"],
								  ["O","·","·","·","·","·"]]

			expect(@board.has_won?). to eql(true)
		end

		it "returns true when connected an diagonal upward 4" do
			@board.board_array = [["a","1","2","3","4","5"],
								  ["b","A","D","·","·","·"],
								  ["c","·","B","E","·","·"],
								  ["X","·","O","C","F","·"],
								  ["e","X","·","X","·","·"],
								  ["f","·","X","·","O","·"],
						 		  ["g","·","·","X","·","O"]]

			expect(@board.has_won?). to eql(true)
		end

		it "returns true when connected an diagonal downward 4" do
			@board.board_array = [["·","·","·","·","X","·"],
								  ["·","·","·","X","·","·"],
								  ["·","·","X","·","·","·"],
								  ["·","X","·","O","·","·"],
								  ["·","·","O","·","·","·"],
								  ["·","X","·","·","·","·"],
							 	  ["O","·","·","·","·","·"]]

			expect(@board.has_won?). to eql(true)
		end
	
	end
end