$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "monologue-hathsyn/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "monologue-hathsyn"
  s.version     = MonologueHathsyn::VERSION
  s.authors     = ["George Opritescu"]
  s.email       = ["ssscripting@gmail.com"]
  s.homepage    = "http://debugarea.com"
  s.summary     = "Monologue plugin to perform syntax highlighting, without any markdown support."
  s.description = "Monologue plugin to perform syntax highlighting, without any markdown support. Inspired heavily from monologue-markdown plugin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.14"
  s.add_dependency "coderay"
  s.add_dependency "html-pipeline"
  s.add_dependency "bcrypt-ruby", "~> 3.0.0"
  # s.add_dependency "jquery-rails"

  # s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency 'pry-stack_explorer'
  s.add_development_dependency "pry-debugger"
end
