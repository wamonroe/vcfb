RSpec.describe "VCFB::FormBuilder#time_field", type: :helper do
  it_behaves_like "form builder element", :time_field, variations: {
    "with just a method" => [:birthday],
    "with an html class" => [:birthday, {class: "birthday-input"}],
    "with an minimum time" => [:birthday, {min: Time.zone.now}],
    "with an minimum string" => [:birthday, {min: "01:00:00"}],
    "not including seconds" => [:birthday, {include_seconds: false}]
  }
end
