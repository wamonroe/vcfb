require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#submit", type: :helper do
  it_behaves_like "form builder element", :submit, variations: {
    "by itself" => [],
    "with a value" => ["Add User"],
    "with an html class" => [{class: "form-submit"}],
    "with value and html class" => ["Add User", {class: "form-submit"}]
  }
end
