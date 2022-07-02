require "active_support/concern"

require "vcfb/tags/collection_check_boxes"
require "vcfb/tags/collection_radio_buttons"

module VCFB
  module ActsAsFormComponent
    extend ActiveSupport::Concern

    included do
      delegate :rich_text_area_tag, to: :helpers
    end

    def collection_check_boxes(object, method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      Tags::CollectionCheckBoxes.new(object, method, self, collection, value_method, text_method, options, html_options).render(&block)
    end

    def collection_radio_buttons(object, method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      Tags::CollectionRadioButtons.new(object, method, self, collection, value_method, text_method, options, html_options).render(&block)
    end
  end
end
