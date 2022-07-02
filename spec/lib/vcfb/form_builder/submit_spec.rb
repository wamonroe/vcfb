RSpec.describe "VCFB::FormBuilder#submit", type: :helper do
  it_behaves_like "form builder element", :submit, variations: {
    "by itself" => [],
    "with a value" => ["Add Author"],
    "with an html class" => [{class: "form-submit"}],
    "with value and html class" => ["Add Author", {class: "form-submit"}]
  }
end
