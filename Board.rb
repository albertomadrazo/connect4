class Board
	attr_accessor :board_array, :user_input
	def initialize
		@board_array = [["·","·","·","·","·","·"],["·","·","·","·","·","·"],
						["·","·","·","·","·","·"],["·","·","·","·","·","·"],
						["·","·","·","·","·","·"],["·","·","·","·","·","·"],
						["·","·","·","·","·","·"]]
	end

	def get_input(player)
		loop do
			puts "#{player.name}, choose a free column (A, B, C, D, E, F, G)"
			@user_input = STDIN.gets.chomp
			break unless /[a-gA-G]/.match(@user_input).to_s == ""
		end
		@user_input = @user_input[0]
		@user_input.upcase!
		puts "user_input = #{@user_input}"
		@user_input = (@user_input.ord - 65).to_i

		@user_input
	end


	def available_square_in?(column, player)
		puts
		@board_array[column].each_with_index do |elt, i|
			if @board_array[column][i] == "·"
				@board_array[column][i] = player.chip
				return true
			end
		end
		return false
	end

	# check if there are still unselected squares
	def its_a_tie
		@board_array.flatten.none?{|x| x == "·"}
	end

	def has_won?
		# vertical check
		@board_array.each_with_index do |x, i|
			temp_arr = []
			index = 0
			3.times do |a|

				4.times do |z|
					temp_arr << @board_array[i][z+index]
				end

				if temp_arr.all?{|x| x == "O"} or temp_arr.all?{|x| x == "X"}
					return true
				end

				temp_arr = []
				index += 1
			end
		end

		#horizontal check
		@board_array.each_with_index do |x, i|
			temp_arr =[]
			index = 0
			4.times do |a|

				4.times do |b|
					temp_arr << @board_array[b+index][i]
				end

				if temp_arr.all?{|x| x == "O"} or temp_arr.all?{|x| x == "X"}
					return true
				end

				temp_arr = []
				index += 1
			end
		end

		# diagonal upwards check
		@board_array.each_with_index do |x, i|
			x.each_with_index do |y, j|
				temp_arr = []
				temp_arr << @board_array[i][j]

				4.times do |k|
					next if k == 0
					begin
						temp_arr << @board_array[i+k][j+k]
					rescue
						temp_arr = []
						break
					end
				end

				if (temp_arr.all?{|x| x == "O"} or temp_arr.all?{|x| x == "X"}) and
					temp_arr.length == 4
					return true
				end
				temp_arr = []

			end
		end

		# diagonal downwards check
		zzz = @board_array.length-1
		@board_array.length.times do |i|

			@board_array[zzz].each_with_index do |y, j|
				temp_arr = []
				temp_arr << @board_array[zzz][j]
				f = 5
				4.times do |k|
					next if k == 0
					begin
						temp_arr << @board_array[zzz-k][j+k]
					rescue
						temp_arr = []
						break
					end
					f -= 1
				end

				if (temp_arr.all?{|x| x == "O"} or temp_arr.all?{|x| x == "X"}) and
					temp_arr.length == 4
					return true
				end
				temp_arr = []

			end

			zzz -= 1
		end

		return false
	end

	def draw_board

		puts ""
		columns = %w{A B C D E F G}
		print "        "
		columns.each{|x| print "  #{x} "}
		puts ""
		i = 5
		6.times do |x|
		print "        "
			7.times do |y|
				print "|"
				print " #{@board_array[y][i]} "
			end
			print "|"
			i -= 1
			puts ""
		end

		print "        "
		print "====" * columns.length
		puts "="
		print "       /" + ("####" * columns.length) + " \\"
		puts ""
		print "      " + "=====" * (columns.length-1)
		print "==="
		puts ""

	end
end