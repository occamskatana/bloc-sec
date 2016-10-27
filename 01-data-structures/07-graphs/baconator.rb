class Baconator

	def find_kevin_bacon(node)
		path = []
		bacon = bfs(node)
		while bacon != node do 
			path << bacon
			bacon = bacon.came_from
		end
		path << node
		path = arrange_path(path)
		return path
	end

	def bfs(start_node)
		unvisited = [start_node]
		visited = []
		i = 0
		until i >= 6 do 
			current = unvisited.shift
			current.neighbors.each do |neighbor|
				unvisited << neighbor
				neighbor.came_from = current
			end
			visited << current
			return current if current.name == "Kevin Bacon"
			i += 1
		end
	end

	def arrange_path(path)
		new_path = []
		path.each do |node|
			new_path << node.name
		end
		return new_path.reverse!
	end
end

