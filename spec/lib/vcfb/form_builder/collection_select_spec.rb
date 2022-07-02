RSpec.describe "VCFB::FormBuilder#collection_select", type: :helper do
  it_behaves_like "form builder element", :collection_select, variations: {
    "for related resources" => [:author_ids, Author.all, :id, :name],
    "with prompt" => [:author_ids, Author.all, :id, :name, {prompt: true}]
  } do
    let(:model) { Post.new }
  end
end
