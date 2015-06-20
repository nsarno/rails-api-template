# rails templates
A rails application template (see documentation about [Rails application templates](http://guides.rubyonrails.org/rails_application_templates.html))

This is a template I use for my [rails-api](https://github.com/rails-api/rails-api) applications.

## Usage

```bash
$ rails-api new app -m api_template.rb
```

if you want to use Postgresql as your database:

```bash
$ rails-api new app -d postgresql -m api_template.rb
```

## What it does

- Remove files we don't want
- Use Puma as the app server
- Copy Procfile for Puma
- Use Active Model Serializers
- Use Rack CORS & JWT
- Use byebug in development and test
- Use rails_12factor gem for Heroku in production
- Run bundle install
- Create test & development databases
- Initialize Git repository & commit

