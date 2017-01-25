require 'bloc_record/utility'
require 'bloc_record/schema'
require 'bloc_record/persistence'
require 'bloc_record/connection'
require 'bloc_record/selection'
require 'bloc_record/collection'

module BlocRecord
  class Base
    include Persistence
    extend Selection
    extend Schema
    extend Connection
    extend Collection

    def initialize(options={})
      options = BlocRecord::Utility.convert_keys(options)

      self.class.columns.each do |col|
        self.class.send(:attr_accessor, col)
        self.instance_variable_set("@#{col}", options[col])
      end
    end

    def method_missing(method_name, *args)
      if method_name[0..6] == "update_"
        param = method_name[7..method_name.length - 1]
        record = self.where({param: args[0]})[0]
        self.update(record.id, {name: args[0]})
      else 
        return "#{method_name} is not a method of #{self}"
      end
    end
  end
end
