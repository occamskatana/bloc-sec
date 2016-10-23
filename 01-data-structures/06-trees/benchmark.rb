require 'benchmark'

require_relative('binary_tree/binary_search_tree.rb')
require_relative('min_tree/min_tree.rb')
require_relative('min_tree/node.rb')

node_array = []

for i in 1..10000 do 
	node = Node.new(i.to_s, i)
	node_array << node
end

zero_node = Node.new(0.to_s, 0)

Benchmark.bm(10) do |x|
	min_tree = nil
	binary_tree = nil
  node = nil
	x.report("Min Tree Build") do 
		min_tree = MinTree.new(zero_node)
		node_array.each do |item|
			min_tree.insert(min_tree.root, item)
		end
  end

  x.report("Min Tree Random Insert") do
    node = Node.new(10001.to_s, 10001)
    min_tree.insert(min_tree.root, node)
  end

	x.report("Binary Tree Build") do 
		binary_tree = BinarySearchTree.new(zero_node)
		node_array.each do |item|
			binary_tree.insert(zero_node, node)
		end
  end

  x.report("Binary Tree Random Insert") do
    binary_tree.insert(zero_node, node)
  end

	x.report("Min Tree Find") do 
		min_tree.find(min_tree.root, 5000.to_s)
	end

	x.report("Binary Tree Find") do 
		binary_tree.find(zero_node, 5000.to_s)
	end

	x.report("Min Tree Delete") do 
		min_tree.delete(min_tree.root, 5000.to_s)
	end

	x.report("Binary Tree Delete") do 
		binary_tree.delete(zero_node, 5000.to_s)
	end


end