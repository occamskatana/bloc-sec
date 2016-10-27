require_relative('bacon_heap.rb')

def find_kevin_bacon(node)
	path = []
	bacon = bfs(node)

	while bacon != node do 
		path << bacon
		bacon = bacon.parent
	end

	return path
end

def bfs(start_node)
	unvisited = [node]
	visited = []
	current = unvisited.shift
	current.neighbors.each do |neighbor|
		unvisited << neighbor if !visited.include?(neighbor)
		neighbor.came_from = current
	end
	visited << current
	return current if current.name == "Kevin Bacon"
end


#Not Needed 
# def check_for_bacon(array)
# 	array.each do |item|
# 		if item.name == "Kevin Bacon" 
# 			return array
# 		end
# 	end
# 	return false
# end


# arr = Array.new
# node = Node.new("Kevin Bacon")
# arr.push(node)

# puts check_for_bacon(arr)