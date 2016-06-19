require 'devise'
require 'activeadmin'
require 'cancancan'
require 'paperclip'
require 'ckeditor'
require 'securerandom'

require "generators/initializers/templates/admin_generator"

module RailsAdmin
  class Engine < ::Rails::Engine
    isolate_namespace RailsAdmin
    config.autoload_paths << File.expand_path('../../', __FILE__)
    app = Rails.application

    initializer :rails_admin do
    # configure ActiveAdmin
      ActiveAdmin.setup do |config|
        config.site_title = "Admin"
        config.site_title_link = "/admin"
        config.authentication_method = :authenticate_admin_user!
        config.current_user_method = :current_admin_user
        config.logout_link_path = :destroy_admin_user_session_path
        config.comments = false
        config.batch_actions = true
        app.config.assets.precompile += %w( active_admin.js active_admin.css active_admin/print.css )
      end

      # configure CkEditor
      Ckeditor.setup do |config|
        require "ckeditor/orm/active_record"
        app.config.autoload_paths += %W(#{app.root}/app/models/ckeditor)
        app.config.assets.precompile += %w( ckeditor/* )
      end

      # configure Paperclip
      Paperclip::Attachment.default_options[:path] = ":rails_root/public/media/:class/:attachment/:style/:filename"
      Paperclip::Attachment.default_options[:url] = "/media/:class/:attachment/:style/:filename"
      Paperclip::Attachment.default_options[:default_url] = "/media/missing.png"
      Paperclip.options[:content_type_mappings] = {:srt => "text/plain"}

      # configure Devise
      Devise.setup do |config|
        require 'devise/orm/active_record'
        config.secret_key = ENV['SECRET_KEY'] || SecureRandom.hex(128)
        config.mailer_sender = ENV["APP_EMAIL"]
        config.case_insensitive_keys = [:email]
        config.strip_whitespace_keys = [:email]
        config.skip_session_storage = [:http_auth]
        config.stretches = Rails.env.test? ? 1 : 10
        config.reconfirmable = true
        config.expire_all_remember_me_on_sign_out = true
        config.password_length = 8..72
        config.reset_password_within = 6.hours
        config.sign_out_via = :delete
      end
    end

  end
end