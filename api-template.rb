##  _____       _ _                _____ _____   _______                   _       _
## |  __ \     (_) |         /\   |  __ \_   _| |__   __|                 | |     | |
## | |__) |__ _ _| |___     /  \  | |__) || |      | | ___ _ __ ___  _ __ | | __ _| |_ ___
## |  _  // _` | | / __|   / /\ \ |  ___/ | |      | |/ _ \ '_ ` _ \| '_ \| |/ _` | __/ _ \
## | | \ \ (_| | | \__ \  / ____ \| |    _| |_     | |  __/ | | | | | |_) | | (_| | |_  __/
## |_|  \_\__,_|_|_|___/ /_/    \_\_|   |_____|    |_|\___|_| |_| |_| .__/|_|\__,_|\__\___|
##                                                                  | |
##                                                                  |_|

#
# Clean up
#
run 'rm README.rdoc'

#
# Gemfile Configuration
#
gem 'puma'

# Use ActiveModelSerializers to serialize JSON responses
gem 'active_model_serializers', '~> 0.10.0.rc1'

# Enable CORS requests
gem 'rack-cors', require: 'rack/cors'

# Generate JWT tokens for stateless authentication
gem 'jwt'

# Use Heroku in production
gem_group :production do
  gem 'rails_12factor'
end

run 'bundle install'

#
# Create test database
#
rake 'db:create', env: 'test'
rake 'db:create', env: 'development'

#
# Initialize Git repository
#
after_bundle do
  git :init
  git add: '--all .'
  git commit: %q{ -m 'Generate base rails-api app with rails-api-template' }
end
