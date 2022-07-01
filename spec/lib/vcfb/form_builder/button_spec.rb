RSpec.describe "VCFB::FormBuilder#button", type: :helper do
  it_behaves_like "form builder element", :button, variations: {
    "with string value" => ["Update author"],
    "with only options" => [{value: true}],
    "when passed block" => [->(*) { "<strong>Accept EULA</strong>".html_safe }]
  }
end
