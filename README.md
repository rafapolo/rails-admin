# TtcRailsAdmin

Includes
  - Activeadmin
  - devise
  - cancancan

```
rails generate active_admin:install
```

```
rake db:migrate
```

```
rails g cancan:ability
```

## create your first admin user

```
AdminUser.create!(email: 'niko@tacticaltech.org', password: '12345678', password_confirmation: '12345678')
```