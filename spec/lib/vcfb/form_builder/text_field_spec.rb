RSpec.describe "VCFB::FormBuilder#text_field", type: :helper do
  it_behaves_like "form builder element", :text_field, variations: {
    "with just a method" => [:name],
    "with an html class" => [:name, {class: "name-input"}]
  }
end
