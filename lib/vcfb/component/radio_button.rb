module VCFB
  module Component
    class RadioButton < BaseField
      def initialize(form, method, value, options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @value = value
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
        end
      end

      def form_element(options = {})
        radio_button(@form.object_name, @method, @value, options)
      end
    end
  end
end
