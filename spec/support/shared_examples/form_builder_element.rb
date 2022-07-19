require "vcfb/form_builder"
require "action_text/tag_helper"

RSpec.shared_examples "form builder element" do |form_element, variations: {}, aliases: []|
  fixtures :authors

  let(:model) { authors(:bob) }

  def renders_the_same_as_rails(form_element, *args, &block)
    expect(render_component_element(form_element, *args, &block))
      .to eq(render_rails_element(form_element, *args, &block))
  end

  def render_component_element(form_element, *args, &block)
    result = ""
    helper.form_with(model: model, builder: VCFB::FormBuilder) do |form|
      result = form.public_send(form_element, *args, &block)
    end
    normalize_output(result)
  end

  def render_rails_element(form_element, *args, &block)
    result = ""
    helper.form_with(model: model) do |form|
      result = form.public_send(form_element, *args, &block)
    end
    normalize_output(result)
  end

  [form_element, *Array(aliases)].each do |method_name|
    context "##{method_name}" do
      variations.each do |test_name, args|
        block = args.pop if args.last.is_a?(Proc)

        it "renders the same as rails #{test_name}" do
          renders_the_same_as_rails(method_name, *args, &block)
        end

        it "renders using a ViewComponent #{test_name}" do
          component_class = "Form::#{form_element.to_s.camelize}::Component".constantize
          expect(component_class).to receive(:new).and_return(mock_component)
          render_component_element(method_name, *args)
        end
      end
    end
  end
end
