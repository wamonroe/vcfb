require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#time_select", type: :helper do
  it_behaves_like "form builder element", :time_select, variations: {
    "with just a method" => [:birthday],
    "with a seconds" => [:birthday, {include_seconds: true}],
    "with a prompt" => [:birthday, {prompt: {hour: "Choose hour", minute: "Choose minute", second: "Choose seconds"}}],
    "with a generic prompt" => [:birthday, {prompt: true}],
    "with am/pm" => [:birthday, {ampm: true}]
  }
end
