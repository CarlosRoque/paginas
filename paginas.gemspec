$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paginas/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "paginas"
  s.version     = Paginas::VERSION
  s.authors     = ["Carlos Roque"]
  s.email       = ["croque@ddlab.net"]
  s.homepage    = "http://www.carlos-roque.com/paginas-gem/"
  s.summary     = "Create pages with TinyMCE"
  s.description = "I wanted to be able to easily add pages to my app and make it easy for users to edit them using TinyMCE I also provide helper methods to load the pages by featured, single and category"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "tinymce-rails"

  s.add_development_dependency "sqlite3"
end
