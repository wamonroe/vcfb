RSpec.describe "VCFB::FormBuilder#select", type: :helper do
  it_behaves_like "form builder element", :select, variations: {
    "with choices" => [:gender, Author.genders],
    "with blank" => [:gender, Author.genders, {include_blank: true}],
    "with block" => [:gender, Author.genders, {}, {}, ->(*) { "custom choices" }]
  }
end
