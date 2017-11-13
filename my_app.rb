require './lib/swaggering'
require './my_app_logic'

# only need to extend if you want special configuration!
class MyApp < Swaggering
  
  set :bind, '0.0.0.0'

  self.configure do |config|
    enable :cross_origin
    config.api_version = '1.0.0' 
  end

  before do
    response.headers['Access-control-Allow-Origin'] = '*'
  end

  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  set :public_folder, '../corkdev-questions-swagger-client/public'
  set :bind, '0.0.0.0'

  get '/' do
    redirect '/index.html'
  end
end

# include the api files
Dir["./api/*.rb"].each { |file|
  require file
}
