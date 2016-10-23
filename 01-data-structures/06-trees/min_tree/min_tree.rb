class MinTree
	include Enumerable
	attr_accessor :root
	attr_accessor :items

	def initialize(root)
		@root = root
		@items = [nil, root]
	end

	def insert(root, data)
		last_index = @items.length - 1
		@items.push(data)
		percolate_up(last_index)
	end

	def percolate_up(target_index)
		parent_index = target_index / 2
		
		return if target_index <= 1

		return if @items[parent_index] <= @items[target_index]

		switch(parent_index, target_index)
		assign_indices

		percolate_up(parent_index)
	end

	def <<(node)
		insert(@root, node)
	end


	def delete(root, data)

	end

	def find(root, data)
		
	end

	def print(root)

	end


	def switch(parent_index, child_index)
		temp = @items[parent_index]
		@items[parent_index] = @items[child_index]
		@items[child_index] = temp
		@root = @items[parent_index] if parent_index == 1
	end

	def dfs(node)
	
	end

	protected 

	def assign_indices
		@items.each_with_index do |item, indx|
			next if item == nil 
			item.position = indx
			item.left = indx * 2 + 1 
			item.right = indx * 2 + 2
			item.parent = indx / 2 if indx != 1
			@root = item if indx == 1 
		end
	end
end

