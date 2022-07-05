require "rails/railtie"

module VCFB
  class Railtie < ::Rails::Railtie
    initializer "vcfb.helper" do |_app|
      ActionView::Base.send :include, VCFB::FormHelper
    end

    config.to_prepare do
      Component.setup!
    end
  end
end
