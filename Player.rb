class Player
	@@id = 0
	attr_accessor :chip
	def initialize(name, chip)
		@name = name
		@@id += 1
		@chip = chip
	end

	def name
		@name
	end

	def id
		@@id
	end

	def chip
		@chip
	end

end 