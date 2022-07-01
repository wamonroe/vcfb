RSpec.describe "VCFB::FormBuilder#number_field", type: :helper do
  it_behaves_like "form builder element", :number_field, variations: {
    "with just a method" => [:siblings],
    "with an html class" => [:siblings, {class: "siblings-input"}]
  }
end
