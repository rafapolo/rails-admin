class AdminGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("..", __FILE__)

  def create
    copy_file "20160318154904_devise_create_admin_users.rb", "db/migrate/20160318154904_devise_create_admin_users.rb"
    copy_file "devise.en.yml", "config/locales/devise.en.yml"
    copy_file "admin_user.rb", "app/models/admin_user.rb"
    copy_file "admin/admin_user.rb", "app/admin/admin_user.rb"
    copy_file "admin/dashboard.rb", "app/admin/dashboard.rb"

    generate "active_admin:assets"
    route "ActiveAdmin.routes(self)"

    # if yes?("Would you like to install Devise?")
    #   gem "devise"
    #   generate "devise:install"
    #   model_name = ask("What would you like the user model to be called? [user]")
    #   model_name = "user" if model_name.blank?
    #   generate "devise", model_name
    # end

  end
end