include RSpec
require_relative 'node.rb'
require_relative 'baconator.rb'


RSpec.describe Baconator, type: Class do 

	describe "baconator" do	
		before(:all) do
			@baconator = Baconator.new
			@a = Node.new("a", {})
			@b = Node.new("b", {})
			@a.film_actor_hash["movie"] = [@b]
			@c = Node.new("Kevin Bacon", {"movie" => [@a]})
			@b.film_actor_hash["movie"] = [@c]
		end	

		it "BFS Finds Kevin Bacon Properly" do
			bacon = @baconator.bfs(@a)
			expect(bacon.name).to eq("Kevin Bacon")
		end

		it "Find Bacon returns an array" do 
			bacon = @baconator.find_kevin_bacon(@a)
			expect(bacon.is_a?(Array)).to be(true)
		end

		it "returns the path from the start to kevin bacon" do 
			bacon = @baconator.find_kevin_bacon(@a)
		end
	end
end

