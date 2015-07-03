$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cfror/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cfror"
  s.version     = Cfror::VERSION
  s.authors     = ["Александр Дмитриев"]
  s.email       = ["alex@devmen.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Cfror."
  s.description = "TODO: Description of Cfror."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
