require "rails/railtie"

require "vcfb/form_helper"

module VCFB
  class Railtie < ::Rails::Railtie
    initializer "vcfb.helper" do |_app|
      ActionView::Base.send :include, VCFB::FormHelper
    end
  end
end
