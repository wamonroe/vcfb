module Form
  module CheckBox
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {}, checked_value = "1", unchecked_value = "0")
        @form = form
        @method = method
        @options = options
        @checked_value = checked_value
        @unchecked_value = unchecked_value
      end
    end
  end
end
