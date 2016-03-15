# TtcRailsAdmin

Includes
  - Activeadmin
  - devise
  - cancancan
  - ckeditor

this engine automatically configures everything related to the Admin, such as Devise, CKeditor and Paperclip.

```
rails generate active_admin:install
```

```
rake db:migrate
```

```
rails g cancan:ability
```

```
rails generate ckeditor:install --orm=active_record --backend=paperclip
bundle exec rake db:migrate
```


## create your first admin user

```
AdminUser.create!(email: 'niko@tacticaltech.org', password: '12345678', password_confirmation: '12345678')
```