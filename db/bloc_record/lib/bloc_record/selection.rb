require 'sqlite3'

module Selection
  def find_one(id)
    row = connection.get_first_row <<-SQL
	    SELECT #{columns.join ","} FROM #{table}
	    WHERE id = #{id};
    SQL

    init_object_from_row(row)
  end

  def find(*ids)
  	if id.length == 1
  		find_one(ids.first)
  	else
  		rows = connection.execute <<-SQL 
  			SELECT #{columns.join ","} FROM #{table}
  			WHERE id IN (#{ids.join ","});
  		SQL
  	end
  	rows_to_array(rows)
  end

  def find_by(attribute, value)
  	row = connection.get_first_row <<-SQL 
  		SELECT #{columns.join(",")} from #{table}
  		WHERE #{atribute} = #{BlocRecord::Utility.sql_strings(value)};
  	SQL

  	init_object_from_row(row)
  end

  def take_one
  	row = connection.get_first_row <<-SQL
  		SELECT #{columns.join ","} FROM #{table}
  		ORDER BY random()
  		LIMIT 1;
  	SQL
  end

  def first
  	row = connection.get_first_row <<-SQL 
  		SELECT #{columns.join ","} FROM #{table}
  		ORDER BY id 
  		ASC LIMIT 1;
  	SQL

  	init_object_from_row(row)
  end

  def last
  	row = connection.get_first_row <<-SQL 
  		SELECT #{columns.join ","} FROM #{table}
  		ORDER BY id 
  		desc LIMIT 1;
  	SQL

  	init_object_from_row(row)
  end



  def take(num=1)
   if num > 1
     rows = connection.execute <<-SQL
       SELECT #{columns.join ","} FROM #{table}
       ORDER BY random()
       LIMIT #{num};
     SQL

     rows_to_array(rows)
   else
     take_one
   end
	end

	def all
		rows = connection.execute <<-SQL 
			SELECT #{columns.join ","} FROM #{table};
		SQL

		rows_to_array(rows)
	end

	private

	def init_object_from_row(row)
		if row 
			data = Hash[columns.zip(row)]
			new(data)
		end
	end

	def rows_to_array(rows)
		rows.map {|row| new(Hash[columns.zip(row)])}
	end

end


# Method added for assignment and potentially no longer needed
# def find_by(attribute, value)
# 	results = []
# 	connection.execute("SELECT * FROM #{table} WHERE #{attribute}=#{value};") do |row|
# 		row << results
# 	end
# 	return results
# end