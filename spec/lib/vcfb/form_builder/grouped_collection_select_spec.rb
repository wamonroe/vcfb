require "rails_helper"

RSpec.describe "VCFB::FormBuilder#grouped_collection_select", type: :helper do
  fixtures :continents, :countries

  it_behaves_like "form builder element", :grouped_collection_select, variations: {
    "for related resources" => [:country_id, Continent.all, :countries, :name, :id, :name]
  } do
    let(:model) { City.new }
  end
end
