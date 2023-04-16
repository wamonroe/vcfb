require_relative "lib/vcfb/version"

Gem::Specification.new do |spec|
  spec.name = "vcfb"
  spec.version = VCFB::VERSION
  spec.authors = ["Alex Monroe"]
  spec.email = ["alex@monroepost.com"]
  spec.homepage = "https://github.com/wamonroe/vcfb"
  spec.summary = "FormBuilder for Rails using ViewComponent"
  spec.description = spec.summary
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "CHANGELOG.md", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6.1", "< 8.0"
  spec.add_dependency "view_component", ">= 2.35", "< 4.0"

  spec.add_development_dependency "sqlite3"
end
