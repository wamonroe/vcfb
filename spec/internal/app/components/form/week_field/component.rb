module Form
  module WeekField
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {})
        @form = form
        @method = method
        @options = options
      end
    end
  end
end
