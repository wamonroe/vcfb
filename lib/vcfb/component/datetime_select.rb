module VCFB
  module Component
    class DatetimeSelect < Base
      def initialize(form, method, options = {}, html_options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @options = options
          @html_options = html_options
        end
      end

      def form_element(options = {}, html_options = {})
        datetime_select(@form.object_name, @method, options, html_options)
      end
    end
  end
end
