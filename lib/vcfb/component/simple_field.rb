module VCFB
  module Component
    class SimpleField < BaseField
      def initialize(form, method, options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
        end
      end

      def form_element(options = {})
        form_field(@form.object_name, @method, options)
      end

      private

      def form_field(...)
        public_send(form_field_name, ...)
      end

      def form_field_name
        if self.class.name.end_with?("::Component")
          self.class.name.delete_suffix("::Component").demodulize.underscore
        else
          self.class.name.demodulize.underscore
        end
      end
    end
  end
end
