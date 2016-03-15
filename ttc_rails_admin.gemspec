$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ttc_rails_admin"
  s.version     = "0.0.5"
  s.authors     = ["Niko"]
  s.email       = ["niko@niko.io"]
  s.homepage    = "https://git.tacticaltech.org/ttc/rails-admin"
  s.summary     = "its a summary!"
  s.description = "what's the difference between a summary and a description?"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails",          '~> 4.2.5'
  s.add_dependency 'activeadmin',    '~> 1.0.0.pre1'  # to /admin
  s.add_dependency 'devise',         '~> 3.5'         # to authentication
  s.add_dependency 'execjs',         '>= 0.3.0'       # jsruntime
  s.add_dependency 'ckeditor',       '>= 4.1.2'       # text editor
  s.add_dependency 'paperclip',      '>= 4.3.0'       # integrated upload
  s.add_dependency 'cancancan'

  s.add_development_dependency "sqlite3"
end
