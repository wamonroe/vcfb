require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#color_field", type: :helper do
  it_behaves_like "form builder element", :color_field, variations: {
    "with just a method" => [:favorite_color]
  }
end
