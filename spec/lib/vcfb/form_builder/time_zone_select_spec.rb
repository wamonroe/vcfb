require "rails_helper"

RSpec.describe "VCFB::FormBuilder#time_zone_select", type: :helper do
  it_behaves_like "form builder element", :time_zone_select, variations: {
    "with just a method" => [:time_zone],
    "including blank" => [:time_zone, nil, {include_blank: true}],
    "including priority zones" => [:time_zone, ActiveSupport::TimeZone.us_zones],
    "with method and block" => [:time_zone, ->(*) { "custom time zone select" }]
  }
end
