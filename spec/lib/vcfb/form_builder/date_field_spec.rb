RSpec.describe "VCFB::FormBuilder#date_field", type: :helper do
  it_behaves_like "form builder element", :date_field, variations: {
    "with just a method" => [:birthday],
    "with a minimum" => [:birthday, {min: Time.zone.today}]
  }
end
