module SlotForm
  module CollectionCheckBoxes
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormCollectionComponent

      def initialize(form, method, collection, value_method, text_method, options = {}, html_options = {})
        @form = form
        @method = method
        @collection = collection
        @value_method = value_method
        @text_method = text_method
        @options = options
        @html_options = html_options
      end

      def form_element(options = {}, html_options = {}, &block)
        collection_check_boxes(@form.object_name, @method, @collection, @value_method, @text_method, options, html_options) do |builder|
          block&.call(builder)
        end
      end

      private

      def default_content(builder)
        builder.check_box + builder.label
      end
    end
  end
end
