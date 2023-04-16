require "rails_helper"

RSpec.describe "VCFB::FormBuilder#button", type: :helper do
  it_behaves_like "form builder element", :button, variations: {
    "with string value" => ["Update author"],
    "with only options" => [{value: true}],
    "when passed block" => [->(*) { "<strong>Accept EULA</strong>".html_safe }]
  }

  if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
    it "renders slots" do
      form = nil
      helper.form_with(model: Author.new, builder: SlotFormBuilder) { |f| form = f }
      result = form.button { |component| component.with_icon name: :taco }
      expect(normalize_output(result))
        .to eq '<button name="button" type="submit" class="test"><i class="fa fa-taco"></i>Create Author</button>'
    end
  end
end
