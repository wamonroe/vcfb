require "support/shared_examples/form_builder_element"

# rubocop:disable Rails/OutputSafety
RSpec.describe "VCFB::FormBuilder#label", type: :helper do
  it_behaves_like "form builder element", :label, variations: {
    "with just a method" => [:name],
    "with text" => [:name, "Full name"],
    "with a class" => [:name, "Full name", {class: "name-label"}],
    "with a value" => [:name, "Full name", {value: "full_name"}],
    "with a content block" => [:name, ->(*) { "Full name" }],
    "with an explicit object block" => [:name, ->(builder) { "<em>#{builder.translation}</em>".html_safe }]
  }
end

if Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new("6.1")
  RSpec.describe "VCFB::FormBuilder#label", type: :helper do
    it_behaves_like "form builder element", :label, variations: {
      "with an implied object block" => [:name, ->(translation) { "<em>#{translation}</em>".html_safe }],
    }
  end
end
# rubocop:enable Rails/OutputSafety
