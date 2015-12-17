$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ttc_rails_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ttc_rails_admin"
  s.version     = TtcRailsAdmin::VERSION
  s.authors     = ["Niko"]
  s.email       = ["niko@niko.io"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TtcRailsAdmin."
  s.description = "TODO: Description of TtcRailsAdmin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
