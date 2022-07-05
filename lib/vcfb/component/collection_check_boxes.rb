module VCFB
  module Component
    class CollectionCheckBoxes < BaseCollection
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

      # The form element #collection_check_boxes yields a special builder that
      # can be used to define a template to render each checkbox. We yield that
      # builder here and override the ViewComponent #content method (see
      # BaseCollection) to support render these elements using components.
      def form_element(options = {}, html_options = {}, &block)
        collection_check_boxes(@form.object_name, @method, @collection, @value_method, @text_method, options, html_options) do |builder|
          @builder = builder
          block&.call(@builder)
        end
      end

      private

      # Define the default content / template to use if a block is not passed
      # when calling #collection_check_boxes
      def default_content
        @builder.check_box + @builder.label
      end
    end
  end
end
