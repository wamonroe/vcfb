require "support/shared_examples/form_builder_element"

RSpec.describe "VCFB::FormBuilder#collection_check_boxes", type: :helper do
  it_behaves_like "form builder element", :collection_check_boxes, variations: {
    "for related resources" => [:user_ids, User.all, :id, :name],
    "with builder" => [:user_ids, User.all, :id, :name, ->(b) { b.label { b.check_box } }],
    "with builder and options" => [:user_ids, User.all, :id, :name, ->(b) { b.label(class: "check_box") { b.check_box(class: "check_box") } }],
    "with builder and special methods" => [:user_ids, User.all, :id, :name, ->(b) { b.label("data-value": b.value) { b.check_box + b.text } }]
  } do
    let(:model) { Post.new }
  end

  it "renders labels and check boxes using View Components" do
    expect(Form::CollectionCheckBoxes::Label::Component).to receive(:new).at_least(:once).and_return(mock_component)
    expect(Form::CollectionCheckBoxes::CheckBox::Component).to receive(:new).at_least(:once).and_return(mock_component)
    helper.form_with(model: Post.new, builder: VCFB::FormBuilder) do |form|
      form.collection_check_boxes(:user_ids, User.all, :id, :name)
    end
  end
end
