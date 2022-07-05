require "active_support/core_ext/string/inflections"
require "rails/generators/base"

module Vcfb
  class InitializerGenerator < ::Rails::Generators::Base
    source_root File.expand_path("template", __dir__)

    def create_form_component
      template "vcfb.rb.tt", "config/initializers/vcfb.rb"
    end
  end
end
