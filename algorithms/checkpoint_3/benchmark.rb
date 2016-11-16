require 'benchmark'
require_relative 'sort.rb'

Benchmark.bmbm do |x|
	ra = 1..500
	@range_arry = ra.to_a
	x.report("Insertion Sort"){
		array = Array.new(50) {@range_arry.sample}
		insertion_sort(array)
	}
	x.report("Selection Sort"){
		array = Array.new(50){@range_arry.sample}
		insertion_sort(array)
	}
	x.report("Bubble Sort"){
		array = Array.new(50) {@range_arry.sample}
		bubble_sort(array)
	}
	x.report("Merge Sort"){
		array = Array.new(50){@range_arry.sample}
		merge_sort(array)
	}
	x.report("Quick Sort"){
		array = Array.new(50){@range_arry.sample}
		array.quick_sort
	}
	x.report("Heap Sort"){
		array = Array.new(50) { @range_arry.sample }
		array.heapsort!
	}
	x.report("Bucket Sort"){
		array = Array.new(50) { @range_arry.sample }
		array.bucket_sort
	}
end