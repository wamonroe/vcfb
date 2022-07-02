RSpec.describe "VCFB::FormBuilder#range_field", type: :helper do
  it_behaves_like "form builder element", :range_field, variations: {
    "with just a method" => [:siblings],
    "with an html class" => [:siblings, {class: "siblings-input"}]
  }
end
