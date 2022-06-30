require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#email_field", type: :helper do
  it_behaves_like "form builder element", :email_field, variations: {
    "with just a method" => [:email]
  }
end
