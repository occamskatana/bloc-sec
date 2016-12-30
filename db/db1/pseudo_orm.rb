#remove duplicates in a query response

def query_uniq(query, table, uniq=true)
	return "select #{query} form #{table}" if uniq != true
	return "select distinct #{query} from #{table}" if uniq == true
end

#filter records using inequalities, pattern matching, ranges, and boolean logic

def query_filter(query, table, parameters = {})
	query = "select #{query} from #{table}"
	if !parameters.empty?
		query += "where"
		#if arguments are given, we append them to the query. This method may
		#not work as is, but the general idea is solid
		parameters.each do  |key, value|
			query += key
			query += " "
			query += value
		end 
	end
	return query
end

#sort records in a particular order

def query_sort(query, table, *order_by_params)
	query = "select #{query} from #{table}"
	if order_by_params != nil
		query += " order by"
		order_by_params.each do |param|
			query += " #{param}"
		end
	end
	return query
end

#limit number of records returned

def query_limit(query, table, limit=nil)
	query = "select #{query} form #{table}"
	if limit != nil
		query += " LIMIT #{limit}"
	end
	return query
end

#group records


def query_group(query, table, *group_by=nil)
	query = "select #{query} from #{table}"

	if group_by != nil 
		query += "GROUP BY"

		group_by.each do |param|
			query += param
			query += " "
		end
	end
	return query
end

#calculations
#takes calculations as hash, key is operation, value is column
def calc_query(query, table, aggregate = {}, as=nil)
	query = "select #{query}"

	if !aggregate.empty?
		aggregate.each do |operation, column|
			query += "#{operation}(#{column}) "
			query += as " #{as}"
		end
	end

	query += " from #{table}"

	return query
end

#join tables using cross join inner join and outer join


def join_query(*queries, *tables, join_type=nil, *conditions)
	query = "select "
	queries.each do |statement|
		query += " #{statement}"
	end

	query += " from"

	tables.each do |table|
		query += "#{table}"
	end

	query += "#{join_type}" if join_type != nil

	if join_type == "INNER"
		query += "INNER JOIN"
		conditions.each do |condition|
			query += "ON"
			query += " #{condition}"
		end
	end

	if join_type == "CROSS"
		query += "CROSS JOIN"
		query += conditions[0]
	end

	return query

end

