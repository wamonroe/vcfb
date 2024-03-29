module VCFB
  module Component
    class CollectionSelect < BaseField
      def initialize(form, method, collection, value_method, text_method, options = {}, html_options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @collection = collection
          @value_method = value_method
          @text_method = text_method
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
          @html_options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(html_options) : html_options
        end
      end

      def form_element(options = {}, html_options = {})
        collection_select(@form.object_name, @method, @collection, @value_method, @text_method, options, html_options)
      end
    end
  end
end
