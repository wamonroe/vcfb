require "rails_helper"

RSpec.describe "VCFB::Component::Base", type: :helper do
  it "supports callbacks" do
    helper.form_with(model: Author.new, builder: SlotFormBuilder) do |form|
      form.label(:name, size: :large) do |component|
        expect(component.instance_variable_get(:@size))
          .to eq(:large)
      end
    end
  end
end
