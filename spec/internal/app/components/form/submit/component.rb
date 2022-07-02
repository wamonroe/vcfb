module Form
  module Submit
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, text = nil, options = {})
        @form = form
        @text = text
        @options = options
      end

      def form_element(options = {})
        submit_tag(@text, options)
      end
    end
  end
end
