module Form
  module RangeField
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {})
        @form = form
        @method = method
        @options = options
      end

      def form_element(options = {})
        range_field(@form.object_name, @method, options)
      end
    end
  end
end
