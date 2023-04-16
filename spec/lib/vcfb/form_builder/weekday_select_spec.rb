if Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new("7.0")
  require "rails_helper"

  RSpec.describe "VCFB::FormBuilder#weekday_select", type: :helper do
    it_behaves_like "form builder element", :weekday_select, variations: {
      "with just a method" => [:birthday],
      "including blank" => [:birthday, {include_blank: true}]
    }
  end
end
