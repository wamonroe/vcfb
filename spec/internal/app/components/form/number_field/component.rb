module Form
  module NumberField
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {})
        @form = form
        @method = method
        @options = options
      end

      def form_element(options = {})
        number_field(@form.object_name, @method, options)
      end
    end
  end
end
