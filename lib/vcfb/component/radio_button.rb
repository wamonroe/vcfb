module VCFB
  module Component
    class RadioButton < Base
      def initialize(form, method, value, options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @value = value
          @options = options
        end
      end

      def form_element(options = {})
        radio_button(@form.object_name, @method, @value, options)
      end
    end
  end
end
