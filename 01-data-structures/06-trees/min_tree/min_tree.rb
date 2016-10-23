require_relative('node.rb')
class MinTree
	include Enumerable
	attr_accessor :root
	attr_accessor :items

	def initialize(root)
		@root = root
		@items = [nil, root]
	end

	def insert(root, data)
		@items.push(data)
		last_index = @items.length - 1
		percolate_up(last_index)
		assign_indices
	end

	def percolate_up(target_index)
		parent_index = target_index / 2
		
		return if target_index <= 1

		return if @items[parent_index] <= @items[target_index]

		switch(parent_index, target_index)
		percolate_up(parent_index)
	end

	def delete(root, data)
		target = self.find(root, data)
		@items.delete_at(target.position)
		percolate_up(@items.length - 1)
	end

	def find(root, data)
    hit = nil
    @items.each do |item|
      next if item.nil?
      hit = item if item.title == data
    end
    return hit
	end

	def print(root)
		queue = [root]
		while !queue.empty?
			current = queue.shift
			queue.push current.left if current.left != nil 
			queue.push current.right if current.right != nil 
			puts "#{current.title}: #{current.rating}"
		end
		return true
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
			item.left = @items[indx * 2]
			item.right = @items[indx * 2 + 1]
			item.parent = @items[indx / 2 ]if indx != 1
			@root = item if indx == 1 
		end
		@root.parent = nil
	end
end
#This was used for print testing and may or may not be needed in the future
# root = Node.new("The Matrix", 87)
# tree = MinTree.new(root) 
# pacific_rim = Node.new("Pacific Rim", 72)
# braveheart = Node.new("Braveheart", 78)
# starwars = Node.new("Star Wars: Return of the Jedi", 80) 
# darko = Node.new("Donnie Darko", 85)
# inception = Node.new("Inception", 86)

# tree.insert(root, pacific_rim)
# tree.insert(root, braveheart)
# tree.insert(root, starwars)
# tree.insert(root, darko)
# tree.insert(root, inception)

# tree.print(tree.root)

