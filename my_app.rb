require './lib/swaggering'
require './my_app_logic'

# only need to extend if you want special configuration!
class MyApp < Swaggering
  self.configure do |config|
    config.api_version = '1.0.0' 
  end

  set :public_folder, '../corkdev-questions-swagger-client/public'
  set :bind, '0.0.0.0'
end

# include the api files
Dir["./api/*.rb"].each { |file|
  require file
}
