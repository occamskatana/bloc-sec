def find_kevin_bacon(node)
	depth = 0
	path = [] 
	answer = nil
	loop do 
		node.film_actor_hash.each do |key, value| 
			value.each do |node|
				if node.name == "Kevin Bacon"
					path.push(key)
				end
			end
		end
	end
end