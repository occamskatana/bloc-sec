class FilmActorHash

	def initialize()
		@hash = Hash.new
	end

	def[]=(key, value)
		@hash[key] = value
	end

	def[](key)
		@hash[key]
	end

	def actor_list
		return @hash
	end	






end