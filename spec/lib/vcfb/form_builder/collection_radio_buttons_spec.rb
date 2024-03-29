require "rails_helper"

RSpec.describe "VCFB::FormBuilder#collection_radio_buttons", type: :helper do
  fixtures :authors

  it_behaves_like "form builder element", :collection_radio_buttons, variations: {
    "for related resources" => [:author_ids, Author.all, :id, :name],
    "with builder" => [:author_ids, Author.all, :id, :name, ->(b) { b.label { b.radio_button } }],
    "with builder and options" => [:author_ids, Author.all, :id, :name, ->(b) { b.label(class: "radio_button") { b.radio_button(class: "radio_button") } }],
    "with builder and special methods" => [:author_ids, Author.all, :id, :name, ->(b) { b.label("data-value": b.value) { b.radio_button + b.text } }]
  } do
    let(:model) { Post.new }
  end

  it "renders labels and check boxes using View Components" do
    expect(Form::CollectionRadioButtons::Label::Component).to receive(:new).at_least(:once).and_return(mock_component)
    expect(Form::CollectionRadioButtons::RadioButton::Component).to receive(:new).at_least(:once).and_return(mock_component)
    helper.form_with(model: Post.new, builder: VCFB::FormBuilder) do |form|
      form.collection_radio_buttons(:author_ids, Author.all, :id, :name)
    end
  end

  if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
    it "renders label slots" do
      result = ""
      helper.component_form_with(model: Post.new, builder: SlotFormBuilder) do |form|
        result = form.collection_radio_buttons(:author_ids, Author.all, :id, :name) do |builder|
          builder.label { |c| c.with_icon "taco" } + builder.radio_button
        end
      end
      expect(normalize_output(result))
        .to include '<i class="fa fa-taco"></i>'
    end
  end
end
