require_relative('node.rb')
require_relative('../')
def find_kevin_bacon(node)
	path = nil





	return path
end

# Fuck this
# def BFS(node)
# 	paths = []
# 	stack = [node]
# 	current = stack.shift
# 	current.film_actor_hash.each do |key, value|
# 		if !paths.empty?
# 			for i in 0..paths.length - 1
# 				paths[i] << value[i] if 
# 			end
# 		else

# 		end
# 	end
# end

def bfs(node)

	stack = []
end

def check_for_bacon(array)
	array.each do |item|
		if item.name == "Kevin Bacon" 
			return true
		end
	end
	return false
end


arr = Array.new
node = Node.new("Kevin Bacon")
arr.push(node)

puts check_for_bacon(arr)