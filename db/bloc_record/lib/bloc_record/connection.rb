require 'sqlite3'
require 'bloc_record'
require 'pg'
module Connection
	def connection
		if BlocRecord.database_type == :pg
			@connection ||= PG::Connection.new(BlocRecord.database_filename)
		elsif BlocRecord.database_type == :sqlite3
			@connection ||= SQLite3::Database.new(BlocRecord.database_filename)
		end
	end
end
