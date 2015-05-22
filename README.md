# rails templates
A rails application template (see documentation about [Rails application templates](http://guides.rubyonrails.org/rails_application_templates.html))

This is a template I use for my [rails-api](https://github.com/rails-api/rails-api) applications (but it would work just the same with a regular rails application)

## Usage

```bash
$ rails-api new app -m api_template.rb
```

if you want to use Postgresql as your database:

```bash
$ rails-api new app -d postgresql -m api_template.rb
```

## What it does

- Clean up useless files
- Use Unicorn instead of Webrick
- Use Rspec instead of Test::Unit (optional)
- Use FactoryGirl with Rspec
- Use JWT
- Enable Rack CORS
- Use Active Model Serializers
- Prepare for user of Heroku in production (optional)
- Create test database
- Initialize Git repository

