RSpec.describe "VCFB::FormBuilder#telephone_field", type: :helper do
  it_behaves_like "form builder element", :telephone_field, variations: {
    "with just a method" => [:phone],
    "with an html class" => [:phone, {class: "phone-input"}]
  }, aliases: %i[phone_field]
end
