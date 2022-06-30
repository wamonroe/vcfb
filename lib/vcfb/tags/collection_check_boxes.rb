require "vcfb/tags/collection_helpers"

module VCFB
  module Tags
    class CollectionCheckBoxes < ActionView::Helpers::Tags::CollectionCheckBoxes
      class CheckBoxBuilder < ActionView::Helpers::Tags::CollectionCheckBoxes::Builder
        include CollectionHelpers

        def label(extra_html_options = {}, &block)
          form.collection_check_boxes_label(@sanitized_attribute_name, @text, label_html_options(extra_html_options), &block)
        end

        def check_box(extra_html_options = {})
          html_options = extra_html_options.merge(@input_html_options)
          html_options[:multiple] = true
          html_options[:skip_default_ids] = false
          form.collection_check_boxes_check_box(@method_name, html_options, @value, nil)
        end
      end

      def render(&block)
        render_collection_for(CheckBoxBuilder, &block)
      end
    end
  end
end
