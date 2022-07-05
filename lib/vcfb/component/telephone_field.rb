module VCFB
  module Component
    class TelephoneField < Base
      def initialize(form, method, options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
        end
      end

      def form_element(options = {})
        telephone_field(@form.object_name, @method, options)
      end
    end
  end
end
