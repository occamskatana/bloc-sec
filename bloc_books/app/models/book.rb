require 'active_record'

class Book < ActiveRecord::Base
	self.table_name = 'book'
end