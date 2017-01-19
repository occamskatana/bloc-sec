require 'sqlite3'
require 'bloc_record/utility'
require 'bloc_record/join_query'

module Selection
  def find_one(id)
    row = connection.get_first_row <<-SQL
	    SELECT #{columns.join ","} FROM #{table}
	    WHERE id = #{id};
    SQL

    init_object_from_row(row)
  end

  def find(*ids)
  	if ids.length == 1
  		find_one(ids.first)
  	else
  		rows = connection.execute <<-SQL 
  			SELECT #{columns.join ","} FROM #{table}
  			WHERE id IN (#{ids.join ","});
  		SQL
  	end
  	rows_to_array(rows)
  end

  def order(*args)
    case args.first 
    when String
      if args.count > 1
        order_expression = args.join(", ")
      else
        order_expression = args
      end
    when Hash 
      expression_hash = BlocRecord::Utility.convert_keys(args.first)
      expression = expression_hash.map{|key, value| "#{key} #{value}"}.join(" ,")
    end

    rows = connection.execute <<-SQL 
      SELECT * from #{table}
      ORDER_BY #{expression};
    SQL

    rows_to_array(rows)
  end

  def joins(*args)
    args_hash = BlocRecord::Utility.convert_keys(args.first)
    expression = args_hash.map {|key, value| "INNER JOIN #{key} on #{key}.#{table}_id = #{table}.id \n INNER JOIN #{value} ON #{value}.#{key}_id = #{key}.id"}.join

    sql = <<-SQL 
     SELECT *  FROM #{table}
     INNER JOIN #{expression}
    SQL

    rows = connection.execute(sql)
    row_array = rows_to_array(rows)

    return JoinQuery.new(row_array, sql)
  end

  def join(*args)
    if args.count > 1
      joins = args.map {|arg| "INNER JOIN #{arg} ON #{arg}.#{table}_id = #{table.id}"}
      rows = connection.execute <<-SQL
        SELECT * FROM #{table} #{joins};
      SQL
      case args.first 
      when String
        rows = connection.execute <<-SQL 
          SELECT * FROM #{table} #{BlocRecord::Utility.sql_strings(args.first)}
        SQL
      when Symbol 
        rows = connection.execute <<-SQL 
          SELECT * FROM #{table}
          INNER JOIN #{args.first} ON #{args.first}.#{table}_id = #{table.id}
        SQL
      end
      return rows_to_array(rows)
    end
  end

  def where(*args)
    if args.count > 1
      expression = args.shift
      params = args
    else
      case args.first 
      when String
        expression = args.first
      when Hash 
        expression_hash = BlocRecord::Utility.convert_keys(args.first)
        expression = expression_hash.map{|key, value| "#{key}=#{BlocRecord::Utility.sql_strings(value)}"}.join(" and ")
      end
    end

    sql = <<-SQL 
      SELECT #{columns.join ","} FROM #{table}
      WHERE #{expression};
    SQL

    rows = connection.execute(sql, params)
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