require_relative '../models/address_book'

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  it "doesn't fuck up when trying to add shit" do 

    expect(book.add_entry("john carter", "541-234-3423", "sex@sex.com")).to be(true)
  end
end

