##  _____       _ _                _____ _____   _______                   _       _
## |  __ \     (_) |         /\   |  __ \_   _| |__   __|                 | |     | |
## | |__) |__ _ _| |___     /  \  | |__) || |      | | ___ _ __ ___  _ __ | | __ _| |_ ___
## |  _  // _` | | / __|   / /\ \ |  ___/ | |      | |/ _ \ '_ ` _ \| '_ \| |/ _` | __/ _ \
## | | \ \ (_| | | \__ \  / ____ \| |    _| |_     | |  __/ | | | | | |_) | | (_| | |_  __/
## |_|  \_\__,_|_|_|___/ /_/    \_\_|   |_____|    |_|\___|_| |_| |_| .__/|_|\__,_|\__\___|
##                                                                  | |
##                                                                  |_|

## Add the current directory to the path Thor uses
## to look up files
def source_paths
  Array(super) + [File.expand_path(File.dirname(__FILE__))]
end

## Clean up
remove_file 'README.rdoc'
remove_file 'Gemfile'

## Write
copy_file 'templates/Gemfile', 'Gemfile'
gsub_file 'Gemfile', '__RAILS_VERSION__', "'4.2.3'"

copy_file 'templates/Procfile', 'Procfile'
copy_file 'templates/puma.rb', 'config/puma.rb'

copy_file 'templates/cors.rb', 'config/initializers/cors.rb'


## Install
run 'bundle install'

run 'rails g knock:install'

rake 'db:create', env: 'test'
rake 'db:create', env: 'development'

## End
after_bundle do
  git :init
  git add: '--all .'
  git commit: "-a -m 'Initial commit'"
end
