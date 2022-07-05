module VCFB
  module Component
    class Select < Base
      def initialize(form, method, choices = nil, options = {}, html_options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @choices = choices
          @options = options
          @html_options = html_options
        end
      end

      def before_render
        @choices = content if content.present?
      end

      def form_element(options = {}, html_options = {})
        select(@form.object_name, @method, @choices, options, html_options)
      end
    end
  end
end
