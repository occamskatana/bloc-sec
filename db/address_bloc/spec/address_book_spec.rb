require_relative '../models/address_book'
require 'rspec'
require 'bloc_record'



RSpec.describe AddressBook do
	let(:book){AddressBook.new}


	it "executes a find_by_X search through method_missing" do 
		expect(AddressBook.find_by_name("John Carter")).to_not be_nil
	end
	
end

