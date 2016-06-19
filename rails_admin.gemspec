$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rails_admin"
  s.version     = "0.0.8"
  s.authors     = ["ExtraPolo!"]
  s.email       = ["x@extrapolo.com"]
  s.homepage    = "https://git.tacticaltech.org/rafapolo/rails-admin"
  s.description = "ActiveAdmin + Paperclip"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'activeadmin',    '~> 1.0.0.pre1'  # to /admin
  s.add_dependency 'devise',         '~> 3.5'         # to authentication
  s.add_dependency 'execjs',         '>= 0.3.0'       # jsruntime
  s.add_dependency 'ckeditor',       '>= 4.1.2'       # text editor
  s.add_dependency 'paperclip',      '>= 4.3.0'       # integrated upload
  s.add_dependency 'cancancan'

end
