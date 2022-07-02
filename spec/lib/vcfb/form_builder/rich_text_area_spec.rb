RSpec.describe "VCFB::FormBuilder#rich_text_area", type: :helper do
  it_behaves_like "form builder element", :rich_text_area, variations: {
    "with just a method" => [:biography],
    "with an html class" => [:biography, {class: "profile-input"}]
  }
end
