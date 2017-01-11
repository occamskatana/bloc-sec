require 'sqlite3'

module Selection
  def find_one(id)
  	validate_integer(id)
    row = connection.get_first_row <<-SQL
	    SELECT #{columns.join ","} FROM #{table}
	    WHERE id = #{id};
	  SQL
    init_object_from_row(row)
  end

  def find(*ids)
  	ids.each do |id|
  		validate_integer(id)
  	end
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
  		WHERE #{attribute} = #{BlocRecord::Utility.sql_strings(value)};
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
   validate_integer(num)
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

  def find_each(options={}, &block)
    rows = connection.execute <<-SQL 
      SELECT #{columns.join ","} FROM #{table}
      LIMIT #{options[:batch_size]}
    SQL

    rows_array = rows_to_array(rows)

    if block_given?
      rows_array.each do |row|
        yield
      end
    end
    rows_array
  end  

  def find_in_batches(options={}, &block)
    rows = connection.execute <<-SQL 
      SELECT #{columns.join ","} from #{table}
      LIMIT #{options[:batch_size]}
    SQL
    rows_array = rows_to_array(rows)
    object_array = []
    rows_array.each do |row|
      object_array << init_object_from_row(row)
    end

    if block_given?
      object_array.each do |object|
        yield
      end
    end 

    object_array
  end 

	private

	def validate_integer(int)
		raise "ID cannot be negative" if int < 0
		raise "ID must be an integer" if int.class != Integer
	end	

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


