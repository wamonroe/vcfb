module Form
  module CollectionSelect
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
    end
  end
end
