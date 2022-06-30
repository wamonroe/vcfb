module Form
  module CollectionRadioButtons
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

      def default_content(builder)
        builder.radio_button + builder.label
      end
    end
  end
end
