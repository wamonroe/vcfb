require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#text_area", type: :helper do
  it_behaves_like "form builder element", :text_area, variations: {
    "with just a method" => [:profile],
    "with an html class" => [:profile, {class: "profile-input"}],
    "with size" => [:profile, {size: "20*30"}],
    "with cols and rows" => [:profile, {cols: 20, rows: 30}]
  }
end
