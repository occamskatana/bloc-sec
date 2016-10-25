require_relative('node.rb')
require_relative('../')
def find_kevin_bacon(node)
	path = nil





	return path
end

# I'm a retard
# def BFS(node)
# 	paths = []
# 	stack = [node]
# 	current = stack.shift
# 	paths.each do |path|
# 		current.each do |key, value|
# 			value.each do |actor|
# 				if paths.empty?
# 					paths << [actor]
# 				else
# 					path << actor if !path.include?(actor) && path.length <= 6
# 					stack << actor if !stack.include(actor)
# 				end
# 			end
# 		end
# 	end
# end

def bfs(node)
	
end

def check_for_bacon(array)
	array.each do |item|
		if item.name == "Kevin Bacon" 
			return array
		end
	end
	return false
end


arr = Array.new
node = Node.new("Kevin Bacon")
arr.push(node)

puts check_for_bacon(arr)