require "rails_helper"

RSpec.describe "VCFB::FormBuilder#datetime_field", type: :helper do
  it_behaves_like "form builder element", :datetime_field, variations: {
    "with just a method" => [:birthday],
    "with a minimum" => [:birthday, {min: Time.zone.today}]
  }, aliases: [:datetime_local_field]
end
