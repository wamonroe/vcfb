RSpec.describe "VCFB::FormBuilder#file_field", type: :helper do
  it_behaves_like "form builder element", :file_field, variations: {
    "with just a method" => [:avatar],
    "with multiple" => [:avatar, {multiple: true}],
    "accepting html" => [:avatar, {accept: "text/html"}],
    "accepting image" => [:avatar, {accept: "image/png,image/gif,image/jpeg"}],
    "with class" => [:avatar, {class: "file-input"}]
  }
end
