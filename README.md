# Extrapolo Admin

The rails-admin are a set of gems, configurations and tasks that allow Rails apps to have all they need to manage content.

It consists of
```
gem 'activeadmin', '~> 1.0.0.pre1'  # to /admin
gem 'devise',      '~> 3.5'         # to authentication
gem 'execjs',      '>= 0.3.0'       # jsruntime
gem 'ckeditor',    '>= 4.1.2'       # text editor
gem 'paperclip',   '>= 4.3.0'       # integrated upload
gem 'cancancan',   '>= 1.13'        # authorizations roles
```

Add it to your Rails project Gemfile:
```
  gem 'rails_admin', :git => 'git@github.com:rafapolo/rails-admin.git'
```

Setup

```
  bundle install & bundle exec rails generate admin setup
```

Create your first admin user
```
AdminUser.create!(email: 'you@tacticaltech.org', password: 'longpassword', password_confirmation: 'longpassword')
```