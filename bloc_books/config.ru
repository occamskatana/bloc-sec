require './config/application'
# require ::File.expand_path('..config/environment', __FILE__)

app = BlocWorks::Application.new

use Rack::ContentType

app.route do 
 map "", "books#welcome"
 map ":controller/:id/:action"
 map ":controller/:id", default: { "action" => "show" }
 map ":controller", default: { "action" => "index" }
end

run(app)