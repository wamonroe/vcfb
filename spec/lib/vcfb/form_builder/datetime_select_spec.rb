require "rails_helper"

RSpec.describe "VCFB::FormBuilder#datetime_select", type: :helper do
  it_behaves_like "form builder element", :datetime_select, variations: {
    "with just a method" => [:birthday],
    "with a start year" => [:birthday, {start_year: 1900}],
    "with a am/pm" => [:birthday, {ampm: true}],
    "with a prompt" => [:birthday, {prompt: {day: "Choose day", month: "Choose month", year: "Choose year"}}]
  }
end
