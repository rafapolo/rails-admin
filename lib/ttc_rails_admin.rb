module TtcRailsAdmin
  class Engine < ::Rails::Engine
    isolate_namespace TtcRailsAdmin

    require 'devise'
    require 'activeadmin'
    require 'cancancan'
    require 'paperclip'
    require 'ckeditor'

    # configure ActiveAdmin
    ActiveAdmin.setup do |config|
      config.site_title = "Admin"
      config.site_title_link = "/admin"
      config.authentication_method = :authenticate_admin_user!
      config.current_user_method = :current_admin_user
      config.logout_link_path = :destroy_admin_user_session_path
      config.comments = false
      config.batch_actions = true
    end

    # configure CkEditor
    Ckeditor.setup do |config|
      require "ckeditor/orm/active_record"
    end

    # configure Devise
    Devise.setup do |config|  config.secret_key = ENV["SECRET_KEY"] || "6469e6404fb04d46d0621396ed9c56572b53592a86dd121058b89d97e6b9f255586remote1cc0be444d560a36909f055eafa01d8087e047474600e8175ab3e"
      config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
      require 'devise/orm/active_record'
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

    # configure Paperclip
    Paperclip::Attachment.default_options[:path] = ":rails_root/public/media/:class/:attachment/:style/:filename"
    Paperclip::Attachment.default_options[:url] = "/media/:class/:attachment/:style/:filename"
    Paperclip::Attachment.default_options[:default_url] = "/media/missing.png"
    Paperclip.options[:content_type_mappings] = {:srt => "text/plain"}

    config.autoload_paths << File.expand_path('../../', __FILE__)

    initializer :ttc_rails_admin do
      config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    end

    initializer :active_admin do
      ActiveAdmin.setup do |config|
        config.register_javascript 'ckeditor/init.js'
        #config.authorization_adapter = ActiveAdmin::CanCanAdapter
      end
    end

    initializer :devise do
      Devise.setup do |config|
        config.secret_key = ENV['SECRET_KEY'] || 'e46636bbb73fe835c27708af16ff8f052d1a1a8b1bf38c025132e33f06fd92bf0916c457980cdae93e3d769b50ba457c67fc9e0f2962b908c801f1f2'
      end
    end

    initializer :assets do
     Rails.application.config.assets.precompile += %w( ckeditor/* )
    end

  end
end

