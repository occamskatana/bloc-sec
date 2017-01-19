require 'bloc_record/connection'
require 'bloc_record/utility'
require 'bloc_record/selection'

class JoinQuery 
	
	attr_accessor :collection, :sql 

	def initialize(array, sql)
		@collection = array
		@sql = sql
	end

	def where(*args)
		sql += args
		rows = connection.execute(sql)
		collection = rows_to_array(rows)
		self
	end
end