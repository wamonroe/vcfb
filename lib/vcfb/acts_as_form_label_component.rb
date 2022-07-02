require "active_support/concern"

require "vcfb/acts_as_form_component"

module VCFB
  module ActsAsFormLabelComponent
    extend ActiveSupport::Concern
    include ActsAsFormComponent

    included do
      delegate :translation, :to_s, to: :label_builder
    end

    private

    def label_builder
      @label_builder ||= ActionView::Helpers::Tags::Label::LabelBuilder
        .new(@form.template, @form.object_name, @method, @form.object, @options[:value])
    end
  end
end
