RSpec.describe "VCFB::FormBuilder#radio_button", type: :helper do
  it_behaves_like "form builder element", :radio_button, variations: {
    "with value 1" => [:gender, "male"],
    "with value 2" => [:gender, "female"],
    "with value 3" => [:gender, "other"]
  }
end
