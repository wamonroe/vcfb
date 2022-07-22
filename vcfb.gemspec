require_relative "lib/vcfb/version"

Gem::Specification.new do |spec|
  spec.name = "vcfb"
  spec.version = VCFB::VERSION
  spec.authors = ["Alex Monroe"]
  spec.email = ["alex.monroe@cofense.com"]
  spec.homepage = "https://github.com/wamonroe/vcfb"
  spec.summary = "FormBuilder for Rails using ViewComponent"
  spec.description = spec.summary
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/wamonroe/vcfb/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "CHANGELOG.md", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6.1", "< 8.0"
  spec.add_dependency "view_component", ">= 2.35", "< 3.0"

  spec.add_development_dependency "combustion", "~> 1.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec-rails", "~> 5.1"
  spec.add_development_dependency "rubocop-rspec", "~> 2.11"
  spec.add_development_dependency "standard", "~> 1.12"
  spec.add_development_dependency "sqlite3"
end
