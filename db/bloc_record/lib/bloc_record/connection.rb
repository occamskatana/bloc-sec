require 'sqlite3'
require 'bloc_record'
module Connection
	def connection
		@connection ||= SQLite3::Database.new(BlocRecord.database_filename)
	end
end