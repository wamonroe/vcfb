RSpec.describe "VCFB::FormHelper", type: :helper do
  context "#component_form_with" do
    it "renders a form using a component" do
      expect(Form::Component).to receive(:new).at_least(:once).and_return(mock_component)
      helper.component_form_with(model: Author.new)
    end

    it "renders the same as #form_with" do
      component_result = helper.component_form_with(model: Author.new) { |f| f.text_field :name }
      rails_result = helper.form_with(model: Author.new) { |f| f.text_field :name }
      expect(normalize_output(component_result)).to eq(normalize_output(rails_result))
    end

    if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
      it "renders component slots" do
        result = helper.component_form_with(model: Author.new, builder: SlotFormBuilder) do |form|
          form.with_header { "Taco Form" }
          form.text_field :name
        end
        output = normalize_output(result)
        expect(output).to include "<h1>Taco Form</h1>"
        expect(output).to include '<input type="text" name="author[name]" />'
      end
    end
  end
end
