require "bloc_works"
require 'active_record'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

 $LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "models")

ActiveRecord::Base.establish_connection({
	adapter: 'sqlite3',
	database: './db/db.sqlite'
	})

module BlocBooks
  class Application < BlocWorks::Application
  end
end
