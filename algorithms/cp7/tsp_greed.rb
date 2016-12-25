def nearest_neighbor(country, current_city)
	while current_city.visited != true
		neighbor_cities = current_city.neighbors
		next_city = neighbor_cities[0]

		for current_neighbor in neighbor_cities 
			if current_neighbor.distance < next_city.distance
				current_neighbor = next_city
			end
		end
		current_city.visited = true
		next_city = current_city
	end
end