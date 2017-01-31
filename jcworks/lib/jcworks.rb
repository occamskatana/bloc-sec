require "jcworks/version"

module Jcworks
  class Application
    def call(env)
    	[200, {'Content-Type' => 'text/html'}, ["Hola"]]
    end
  end
end
