require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#week_field", type: :helper do
  it_behaves_like "form builder element", :week_field, variations: {
    "with just a method" => [:birthday],
    "with an html class" => [:birthday, {class: "week-input"}]
  }
end
