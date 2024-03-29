require "rails_helper"

RSpec.describe "VCFB::FormBuilder#url_field", type: :helper do
  it_behaves_like "form builder element", :url_field, variations: {
    "with just a method" => [:homepage],
    "with an html class" => [:homepage, {class: "homepage-input"}]
  }
end
