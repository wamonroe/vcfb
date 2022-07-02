module Form
  module RadioButton
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, value, options = {})
        @form = form
        @method = method
        @value = value
        @options = options
      end

      def form_element(options = {})
        radio_button(@form.object_name, @method, @value, options)
      end
    end
  end
end
