module Form
  module Button
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, text = nil, options = {})
        @form = form
        @text = text
        @options = options
      end

      def form_element(options = {}, &block)
        button_tag(options, &block)
      end
    end
  end
end
