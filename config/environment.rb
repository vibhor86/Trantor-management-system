# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TrantorManagementSystem::Application.initialize!

# Heroku H13 Fix
if Rack::Utils.respond_to?("key_space_limit=")
  Rack::Utils.key_space_limit = 262144 # 4 times the default size
end
