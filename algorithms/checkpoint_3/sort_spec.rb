include RSpec
require_relative 'sort.rb'

RSpec.describe "Monkey Pached Array Sort Algorithms", type: Class do
	range = 1..500
	range_array = range.to_a 
	let(:collection){[5, 4, 6, 7, 4, 2, 3]}

	it "returns the shit sorted for heap sort" do 
		expect(collection.heap_sort).to eq(collection.sort)
	end

	it "returns the shit sorted for quick sort" do
		temp = collection.sort
		expect(collection.quick_sort).to eq(temp)
	end

	it "returns the shit sorted for bucket sort" do 
		expect(collection.bucket_sort).to eq(collection.sort)
	end

end