$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_impersonate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'user_impersonate3'
  s.version     = UserImpersonate::VERSION
  s.authors = ['Matthieu Ciappara', 'Richard Cook', 'Dr Nic Williams', 'Many people at Engine Yard',]
  s.email = 'ciappa_m@modulotech.fr'
  s.homepage = 'https://github.com/modulotech/user_impersonate3'
  s.summary     = "Allow staff users to pretend to be your customers"
  s.description = "Allow staff users to pretend to be your customers; to impersonate their account."
  s.license = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 5.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-cucumber"
  s.add_development_dependency "launchy"
end
