class Node

	attr_accessor :film_actor_hash
	attr_accessor :name
	attr_accessor :level
	attr_accessor :neighbors
	attr_accessor :came_from

	def initialize(name, fah)
		@name = name
		@film_actor_hash = fah
	end

	def neighbors
		neighbor_array = []
		self.film_actor_hash.each do |key, value|
			value.each do |actor|
				neighbor_array << actor if !neighbor_array.include?(actor)
			end
		end
		return neighbor_array
	end
	
end