module VCFB
  module Component
    class CheckBox < Base
      def initialize(form, method, options = {}, checked_value = "1", unchecked_value = "0")
        run_callbacks :initialize do
          @form = form
          @method = method
          @options = options
          @checked_value = checked_value
          @unchecked_value = unchecked_value
        end
      end

      def form_element(options = {})
        check_box(@form.object_name, @method, options, @checked_value, @unchecked_value)
      end
    end
  end
end
