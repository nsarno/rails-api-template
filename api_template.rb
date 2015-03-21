##
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
gem 'unicorn'
gem 'unicorn-rails'
gem 'rspec'

# Generate JWT tokens for stateless authentication
gem 'jwt'

# Enable CORS requests
gem 'rack-cors', require: 'rack/cors'

# Model JSON serialization
gem 'active_model_serializers', github: 'rails-api/active_model_serializers', branch: '0-9-stable'

if yes? 'Using Heroku in Production?'
  gem_group :production do
    gem 'rails_12factor'
  end
end

if yes? 'Using RSpec & FactoryGirl instead of Test::Unit & Fixtures?'
  gem_group :development, :test do
    gem 'rspec-rails'
  end

  gem_group :test do
    gem 'factory_girl_rails'
    gem 'database_cleaner'
  end

  after_bundle do
    run 'rails g rspec:install'
    run 'bundle binstubs rspec-core'
    run 'rm -r test/'
  end
end

run 'bundle install'

#
# Create test database
#
rake 'db:create', env: 'test'

#
# Initialize Git repository
#
after_bundle do
  git :init
  git add: '--all .'
  git commit: %q{ -m 'Initial commit' }
end
