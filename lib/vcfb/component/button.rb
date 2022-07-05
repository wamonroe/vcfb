module VCFB
  module Component
    class Button < Base
      def initialize(form, text = nil, options = {})
        run_callbacks :initialize do
          @form = form
          @text = text
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
        end
      end

      def form_element(options = {}, &block)
        button_tag(options, &block)
      end
    end
  end
end
