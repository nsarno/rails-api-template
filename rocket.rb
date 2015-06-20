##  _____       _ _                _____ _____   _______                   _       _
## |  __ \     (_) |         /\   |  __ \_   _| |__   __|                 | |     | |
## | |__) |__ _ _| |___     /  \  | |__) || |      | | ___ _ __ ___  _ __ | | __ _| |_ ___
## |  _  // _` | | / __|   / /\ \ |  ___/ | |      | |/ _ \ '_ ` _ \| '_ \| |/ _` | __/ _ \
## | | \ \ (_| | | \__ \  / ____ \| |    _| |_     | |  __/ | | | | | |_) | | (_| | |_  __/
## |_|  \_\__,_|_|_|___/ /_/    \_\_|   |_____|    |_|\___|_| |_| |_| .__/|_|\__,_|\__\___|
##                                                                  | |
##                                                                  |_|

# Add the current directory to the path Thor uses
# to look up files
def source_paths
  Array(super) + [File.expand_path(File.dirname(__FILE__))]
end

#
# Clean up
#
remove_file 'README.rdoc'
remove_file 'Gemfile'
remove_file '.gitignore'

#
# Gemfile Configuration
#
run 'touch Gemfile'
add_source 'https://rubygems.org'
gem 'rails', '4.2.2'
gem 'rails-api'

# Use Puma as the app server
gem 'puma'

# Use Postgresql as the database
gem 'pg'

# Use ActiveModelSerializers to serialize JSON responses
gem 'active_model_serializers', '~> 0.10.0.rc1'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use JWT tokens for stateless authentication
gem 'jwt'

gem_group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

# Use Heroku in production
gem_group :production do
  gem 'rails_12factor'
end

run 'bundle install'

#
# Add required files
#
copy_file 'templates/Procfile'
copy_file 'templates/puma.rb', 'config/puma.rb'

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
  git commit: "-a -m 'Initial commit'"
end
