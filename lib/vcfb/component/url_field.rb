module VCFB
  module Component
    class UrlField < Base
      def initialize(form, method, options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @options = options
        end
      end

      def form_element(options = {})
        url_field(@form.object_name, @method, options)
      end
    end
  end
end
