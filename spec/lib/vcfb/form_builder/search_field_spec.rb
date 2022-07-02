require "support/shared_examples/form_builder_element"
require "vcfb/action_view_tag_patch"

RSpec.describe "VCFB::FormBuilder#search_field", type: :helper do
  it_behaves_like "form builder element", :search_field, variations: {
    "with just a method" => [:name],
    "with autosave false" => [:name, {autosave: false}],
    "with autosave true" => [:name, {autosave: true}],
    "with results" => [:name, {results: 3}],
    "with onsearch" => [:name, {onsearch: true}],
    "with onsearch and autosave false" => [:name, {onsearch: true, autosave: false}],
    "with onsearch and autosave true" => [:name, {onsearch: true, autosave: true}]
  }
end
