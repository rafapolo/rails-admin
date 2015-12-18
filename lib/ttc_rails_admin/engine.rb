module TtcRailsAdmin
  class Engine < ::Rails::Engine
    isolate_namespace TtcRailsAdmin

    require 'devise'
    require 'activeadmin'
    require 'cancancan'
    require 'paperclip'
    require 'ckeditor'

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
