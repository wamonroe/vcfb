module Form
  module GroupedCollectionSelect
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormCollectionComponent

      def initialize(form, method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
        @form = form
        @method = method
        @collection = collection
        @group_method = group_method
        @group_label_method = group_label_method
        @option_key_method = option_key_method
        @option_value_method = option_value_method
        @options = options
        @html_options = html_options
      end
    end
  end
end
