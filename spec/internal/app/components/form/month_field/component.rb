module Form
  module MonthField
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {})
        @form = form
        @method = method
        @options = options
      end

      def form_element(options = {})
        month_field(@form.object_name, @method, options)
      end
    end
  end
end
