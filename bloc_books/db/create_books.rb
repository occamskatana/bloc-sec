require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection({
	adapter: 'sqlite3',
	database: 'db/db.sqlite'
	})

db = ActiveRecord::Base.connection

 db.execute <<-SQL
     CREATE TABLE books (
       id INTEGER PRIMARY KEY,
       name VARCHAR(30),
       author VARCHAR(30),
       pages INTEGER
     );
   SQL