require 'sqlite3'
require 'active_support/inflector'
require 'bloc_record'

module Assocations
	def has_many(assocation)
		define_method(assocation) do 
			rows = self.class.connection.execute <<-SQL 
				SELECT * FROM #{table}
				WHERE #{self.class.table}_id = #{self.id};
			SQL

			class_name = assocation.to_s.classify.constantize
			collection = BlocRecord::Collection::Collection.new

			rows.each do |row|
				collection << class_name.new(Hash[class_name.columns.zip(row)])
			end
			return collection
		end
	end

	def belongs_to(assocation)
		define_method(assocation) do 
			assocation_name = assocation.to_s

			row = self.class.connection.get_first_row <<-SQL 
				SELECT * FROM #{assocation_name}
				WHERE id = #{self.send(assocation_name + "_id")}
			SQL

			if row 
				data = Hash[class_name.columns.zip(row)]
				class_name.new(data)
			end
		end
	end
end