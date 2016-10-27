require_relative('node.rb')

def BaconGraph 
	attr_accessor :nodes 

	def initialize
		@nodes = []
	end

	def add_node(node)
		@nodes << node
	end

	def find_actor(name)
		@nodes.each do |actor|
			return actor if actor.name == name
		end
		return nil
	end

	def find_path(start, end)
		
	end

	def count
		return @nodes.length
	end
end