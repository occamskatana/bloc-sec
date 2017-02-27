require "jcworks/version"
require "jcworks/controller"

module Jcworks
  class Application
    def call(env)
    	[200, {'Content-Type' => 'text/html'}, []]
    end
  end
end
