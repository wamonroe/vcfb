module VCFB
  module Component
    class Base < VCFB.parent_component.constantize
      extend ActiveModel::Callbacks

      # Define initialize callback to reduce need to override the initialize
      # method on form components.
      define_model_callbacks :initialize

      # Work around ViewComponent not having access helpers we need via
      # ActionText. For more information, see:
      #   https://github.com/github/view_component/blob/main/docs/compatibility.md#actiontext
      delegate :rich_text_area_tag, to: :helpers

      # Override the built-in methods to allow us to render custom collection
      # tag builders that render using labels, check boxes, and radio buttons
      # via components.
      def collection_check_boxes(object, method, collection, value_method, text_method, options = {}, html_options = {}, &block)
        VCFB::Tags::CollectionCheckBoxes.new(object, method, self, collection, value_method, text_method, options, html_options).render(&block)
      end

      def collection_radio_buttons(object, method, collection, value_method, text_method, options = {}, html_options = {}, &block)
        VCFB::Tags::CollectionRadioButtons.new(object, method, self, collection, value_method, text_method, options, html_options).render(&block)
      end

      def resource
        @form.object
      end

      def resource_errors?
        resource&.errors&.present?
      end

      private

      def deobjectify_options!(options)
        if instance_variable_defined?(:@form)
          keys = @form.send(:objectify_options, {}).keys
          options.extract!(*keys)
        elsif defined?(TagOptions::Hash)
          TagOptions::Hash.new
        else
          {}
        end
      end
    end
  end
end
