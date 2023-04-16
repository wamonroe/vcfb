require "rails_helper"

RSpec.describe "VCFB::FormBuilder#check_box", type: :helper do
  it_behaves_like "form builder element", :check_box, variations: {
    "with just a method" => [:accepted_eula],
    "with just a method custom values" => [:accepted_eula, {}, "yes", "no"],
    "with an html class" => [:accepted_eula, {class: "eula-accepted"}],
    "with an html class and custom values" => [:accepted_eula, {class: "eula-accepted"}, "yes", "no"]
  }
end
