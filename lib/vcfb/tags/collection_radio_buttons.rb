require "vcfb/tags/collection_helpers"

module VCFB
  module Tags
    class CollectionRadioButtons < ActionView::Helpers::Tags::CollectionRadioButtons
      class RadioButtonBuilder < ActionView::Helpers::Tags::CollectionRadioButtons::Builder
        include CollectionHelpers

        def label(extra_html_options = {}, &block)
          form.collection_radio_buttons_label(@sanitized_attribute_name, @text, label_html_options(extra_html_options), &block)
        end

        def radio_button(extra_html_options = {})
          html_options = extra_html_options.merge(@input_html_options)
          html_options[:skip_default_ids] = false
          form.collection_radio_buttons_radio_button(@method_name, @value, html_options)
        end
      end

      def render(&block)
        render_collection_for(RadioButtonBuilder, &block)
      end
    end
  end
end
