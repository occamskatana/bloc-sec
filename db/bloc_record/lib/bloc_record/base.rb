require 'bloc_record/utility'
require 'bloc_record/schema'
require 'bloc_record/persistence'
require 'bloc_record/connection'
require 'bloc_record/selection'

module BlocRecord
  class Base
    include Persistence
    extend Selection
    extend Schema
    extend Connection

    def initialize(options={})
      options = BlocRecord::Utility.convert_keys(options)

      self.class.columns.each do |col|
        self.class.send(:attr_accessor, col)
        self.instance_variable_set("@#{col}", options[col])
      end
    end

    def self.method_missing(m, *args)
      if m[0..6] == "find_by"
        string = m.to_s
        arg = string[8..string.length].to_sym
        self.find_by(arg, args[0])
      else
        "#{m} is not a method of #{self}"
      end
    end
  end
end
