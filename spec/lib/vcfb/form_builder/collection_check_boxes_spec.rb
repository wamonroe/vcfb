require "rails_helper"

RSpec.describe "VCFB::FormBuilder#collection_check_boxes", type: :helper do
  fixtures :authors

  it_behaves_like "form builder element", :collection_check_boxes, variations: {
    "for related resources" => [:author_ids, Author.all, :id, :name],
    "with builder" => [:author_ids, Author.all, :id, :name, ->(b) { b.label { b.check_box } }],
    "with builder and options" => [:author_ids, Author.all, :id, :name, ->(b) { b.label(class: "check_box") { b.check_box(class: "check_box") } }],
    "with builder and special methods" => [:author_ids, Author.all, :id, :name, ->(b) { b.label("data-value": b.value) { b.check_box + b.text } }]
  } do
    let(:model) { Post.new }
  end

  it "renders labels and check boxes using View Components" do
    expect(Form::CollectionCheckBoxes::Label::Component).to receive(:new).at_least(:once).and_return(mock_component)
    expect(Form::CollectionCheckBoxes::CheckBox::Component).to receive(:new).at_least(:once).and_return(mock_component)
    helper.form_with(model: Post.new, builder: VCFB::FormBuilder) do |form|
      form.collection_check_boxes(:author_ids, Author.all, :id, :name)
    end
  end

  if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
    it "renders label slots" do
      result = ""
      helper.component_form_with(model: Post.new, builder: SlotFormBuilder) do |form|
        result = form.collection_check_boxes(:author_ids, Author.all, :id, :name) do |builder|
          builder.label { |c| c.with_icon "taco" } + builder.check_box
        end
      end
      expect(normalize_output(result))
        .to include '<i class="fa fa-taco"></i>'
    end
  end
end
