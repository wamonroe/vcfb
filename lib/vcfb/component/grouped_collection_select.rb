module VCFB
  module Component
    class GroupedCollectionSelect < BaseField
      def initialize(form, method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
        run_callbacks :initialize do
          @form = form
          @method = method
          @collection = collection
          @group_method = group_method
          @group_label_method = group_label_method
          @option_key_method = option_key_method
          @option_value_method = option_value_method
          @options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(options) : options
          @html_options = defined?(TagOptions::Hash) ? TagOptions::Hash.new(html_options) : html_options
        end
      end

      def form_element(options = {}, html_options = {})
        grouped_collection_select(@form.object_name, @method, @collection, @group_method, @group_label_method, @option_key_method, @option_value_method, options, html_options)
      end
    end
  end
end
