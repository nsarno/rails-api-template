# Rocket
Rails ready to fire! 🚀

A rails application template (see documentation about [Rails application templates](http://guides.rubyonrails.org/rails_application_templates.html)) for [rails-api](https://github.com/rails-api/rails-api) applications.

## Usage

With Postgresql:

```bash
$ rails-api new app -d postgresql -m rocket/rocket.rb
```

## What it does

- Remove files we don't want
- Use Puma as the app server
- Copy Procfile & config/puma.rb for Puma
- Use Active Model Serializers
- Use Rack CORS & JWT
- Use byebug in development and test
- Use rails_12factor gem for Heroku in production
- Run bundle install
- Create test & development databases
- Initialize Git repository & commit

