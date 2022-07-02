RSpec.describe "VCFB::FormBuilder#date_select", type: :helper do
  it_behaves_like "form builder element", :date_select, variations: {
    "with just a method" => [:birthday],
    "with a start year" => [:birthday, {start_year: 1900}],
    "with a lots of options" => [:birthday, {start_year: 1900, use_month_numbers: true, discard_day: true, include_blank: true}],
    "with a two digit numbers" => [:birthday, {use_two_digit_numbers: true}],
    "with an order" => [:birthday, {order: [:day, :month, :year]}]
  }
end
