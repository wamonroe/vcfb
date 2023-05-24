module VCFB
  module Component
    class Select < BaseField
      def initialize(form, method, choices = nil, options = {}, html_options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @choices = choices
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
          @html_options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(html_options) : html_options
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
