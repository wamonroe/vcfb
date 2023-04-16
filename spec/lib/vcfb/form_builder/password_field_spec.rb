require "rails_helper"

RSpec.describe "VCFB::FormBuilder#password_field", type: :helper do
  it_behaves_like "form builder element", :password_field, variations: {
    "with just a method" => [:password],
    "with an html class" => [:password, {class: "password-input"}]
  }
end
