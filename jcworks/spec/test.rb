require 'jcworks'
require 'test/unit'
require 'rack/test'


class InitTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Jcworks::Application.new
	end

	def it_doesnt_fuck_up_call
		call
		assert last_response.ok?
		assert_equal 'Hola', last_response.body
	end	

	def test_fail
		
	end
end


