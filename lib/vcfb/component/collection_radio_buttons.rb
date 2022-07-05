module VCFB
  module Component
    class CollectionRadioButtons < BaseCollection
      def initialize(form, method, collection, value_method, text_method, options = {}, html_options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @collection = collection
          @value_method = value_method
          @text_method = text_method
          @options = options
          @html_options = html_options
        end
      end

      # The form element #collection_radio_buttons yields a special builder that
      # can be used to define a template to render each radio button. We yield
      # that builder here and override the ViewComponent #content method (see
      # BaseCollection) to support render these elements using components.
      def form_element(options = {}, html_options = {}, &block)
        collection_radio_buttons(@form.object_name, @method, @collection, @value_method, @text_method, options, html_options) do |builder|
          @builder = builder
          block&.call(@builder)
        end
      end

      private

      # Define the default content / template to use if a block is not passed
      # when calling #collection_radio_buttons
      def default_content
        @builder.radio_button + @builder.label
      end
    end
  end
end
