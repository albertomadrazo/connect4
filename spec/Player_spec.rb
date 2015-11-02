require "spec_helper"

describe Player do

	before :all do
		@player1 = Player.new("Beto", "O")
		@player2 = Player.new("Chio", "X")
		# puts @player1.id, " XXXXXXXXXXXXX"
	end

	describe "#new" do
		it "instantiates a new Player" do
			expect(@player1).to be_an_instance_of(Player)
		end
	end

	describe "#name" do
		it "Retrieves the player's name" do
			expect(@player1.name).to eql("Beto")
		end
	end

	# describe "#id" do
	# 	it "Retrieves the player's id" do
	# 		expect(@player1.id).to eql(1)
	# 	end
	# end

	describe "#chip" do
		it "Retrieves the player's chip" do
			expect(@player1.chip).to eql("O")
		end
	end
end
