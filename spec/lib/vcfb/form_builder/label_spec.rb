RSpec.describe "VCFB::FormBuilder#label", type: :helper do
  it_behaves_like "form builder element", :label, variations: {
    "with just a method" => [:name],
    "with text" => [:name, "Full name"],
    "with a class" => [:name, "Full name", {class: "name-label"}],
    "with nil text" => [:name, nil, {class: "name-label"}],
    "with a method and options" => [:name, {class: "name-label"}],
    "with a value" => [:name, "Full name", {value: "full_name"}],
    "with a content block" => [:name, ->(*) { "Full name" }],
    "with an explicit object block" => [:name, ->(builder) { "<em>#{builder.translation}</em>".html_safe }]
  }

  if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
    it "renders slots" do
      result = ""
      helper.form_with(model: Author.new, builder: SlotFormBuilder) do |form|
        result = form.label(:name) do |component|
          component.with_input do
            form.text_field :name
          end
        end
      end
      expect(normalize_output(result))
        .to eq '<label>Name<input type="text" name="author[name]" /></label>'
    end
  end

  if Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new("6.1")
    it_behaves_like "form builder element", :label, variations: {
      "with an implied object block" => [:name, ->(translation) { "<em>#{translation}</em>".html_safe }]
    }
  end
end
