module VCFB
  module Component
    class GroupedCollectionSelect < Base
      def initialize(form, method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
        run_callbacks :initialize do
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

      def form_element(options = {}, html_options = {})
        grouped_collection_select(@form.object_name, @method, @collection, @group_method, @group_label_method, @option_key_method, @option_value_method, options, html_options)
      end
    end
  end
end
