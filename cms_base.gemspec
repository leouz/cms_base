$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cms_base/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cms_base"
  s.version     = CmsBase::VERSION
  s.authors     = ["Leo Uzon"]
  s.email       = ["leo.uz86@gmail.com"]
  s.homepage    = ""
  s.summary     = "Base for cms websites in rails."
  s.description = "Base for cms websites in rails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.21"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
