source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

if (rails_version = ENV["RAILS_VERSION"])
  if rails_version == "main"
    gem "rails", github: "rails/rails"
  elsif rails_version != "latest"
    gem "rails", "~> #{rails_version}"
  end
end

if (view_component_version = ENV["VIEW_COMPONENT_VERSION"])
  if view_component_version == "main"
    gem "view_component", github: "github/view_component"
  elsif view_component_version != "latest"
    gem "view_component", "~> #{view_component_version}"
  end
end

# Specify your gem's dependencies in vcfb.gemspec.
gemspec

gem "pry-byebug"
gem "rake"
gem "simplecov", require: false
gem "rspec-rails"

# Code formating and linting
gem "erb_lint"
gem "htmlbeautifier"
gem "rubocop-rails"
gem "rubocop-rspec"
gem "standard"
