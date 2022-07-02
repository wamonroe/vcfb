module Form
  module Label
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormLabelComponent

      def initialize(form, method, text = nil, options = {})
        @form = form
        @method = method
        @text = text
        @options = options
      end

      def form_element(options = {}, &block)
        @text = capture(&block) if block
        label(@form.object_name, @method, @text, options)
      end
    end
  end
end
