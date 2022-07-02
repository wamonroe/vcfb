module Form
  module TextArea
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {})
        @form = form
        @method = method
        @options = options
      end

      def form_element(options = {})
        text_area(@form.object_name, @method, options)
      end
    end
  end
end
