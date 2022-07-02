module Form
  module WeekField
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {})
        @form = form
        @method = method
        @options = options
      end

      def form_element(options = {})
        week_field(@form.object_name, @method, options)
      end
    end
  end
end
