module VCFB
  module Component
    class Submit < Base
      def initialize(form, text = nil, options = {})
        run_callbacks :initialize do
          @form = form
          @text = text
          @options = options
        end
      end

      def form_element(options = {})
        submit_tag(@text, options)
      end
    end
  end
end
