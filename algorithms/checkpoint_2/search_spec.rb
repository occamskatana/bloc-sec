include RSpec
require_relative 'binary_search_iterative.rb'
require_relative 'binary_search_recursive.rb'

describe "iterative binary search" do 
	it "handles nil gracefully" do
		recursive = RecursiveSearch.new
		array = Array.new(10000){|index| index} 
		expect(recursive).to_not be_nil
		expect(recursive.binary_search(50, nil)).to be_nil
		expect(recursive.binary_search(nil, array)).to be_nil
	end

	it "finds what it is loooking for" do 
		recursive = RecursiveSearch.new 
		array = Array.new(10000){|index| index}
		expect(recursive.binary_search(50, array)).to eq(50)
		expect(recursive.binary_search(1, array)).to eq(1)
	end

	it "returns nil if it does not retrieve a response" do 
		recursive = RecursiveSearch.new 
		array = Array.new(10000){|index| index}
		expect(recursive.binary_search(-1, array)).to be_nil
		expect(recursive.binary_search(100000, array)).to be_nil
	end
end

describe "recursive binary search" do 
	it "handles nil gracefully" do 
		iterative = IterativeSearch.new 
		array = Array.new(10000){|index| index}
		expect(iterative.binary_search(nil, array)).to be_nil
		expect(iterative.binary_search(array, nil)).to be_nil
	end

	it "finds what it is looking for" do 
		iterative = IterativeSearch.new 
		array = Array.new(10000){|index| index}
		expect(iterative.binary_search(500, array)).to eq(500)
		expect(iterative.binary_search(5, array)).to eq(5)
	end

	it "returns nil if not found" do 
		iterative = IterativeSearch.new 
		array = Array.new(10000){|index| index}
		expect(iterative.binary_search(-1, array)).to be_nil
		expect(iterative.binary_search(10000, array)).to be_nil
	end
end