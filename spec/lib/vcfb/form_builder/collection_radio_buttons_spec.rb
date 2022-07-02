RSpec.describe "VCFB::FormBuilder#collection_radio_buttons", type: :helper do
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
end
