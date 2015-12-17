module TtcRailsAdmin
  class Engine < ::Rails::Engine
    isolate_namespace TtcRailsAdmin

    require 'devise'
    require 'activeadmin'
    require 'cancancan'

    config.autoload_paths << File.expand_path('../../', __FILE__)

    initializer :ttc_rails_admin do
      config.authorization_adapter = ActiveAdmin::CanCanAdapter
      config.secret_key = ENV['SECRET_KEY'] || 'e46636bbb73fe835c27708af16ff8f052d1a1a8b1bf38c025132e33f06fd92bf0916c457980cdae93e3d769b50ba457c67fc9e0f2962b908c801f1f2'
    end


  end
end
