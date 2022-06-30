require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#select", type: :helper do
  it_behaves_like "form builder element", :select, variations: {
    "with choices" => [:gender, User.genders],
    "with blank" => [:gender, User.genders, {include_blank: true}],
    "with block" => [:gender, User.genders, {}, {}, ->(*) { "custom choices" }]
  }
end
