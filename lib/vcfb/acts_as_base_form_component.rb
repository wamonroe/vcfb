require "active_support/concern"

require "vcfb/acts_as_form_component"

module VCFB
  module ActsAsBaseFormComponent
    extend ActiveSupport::Concern
    include ActsAsFormComponent

    private

    def content(form)
      if @view_context && @__vc_render_in_block
        @__vc_content = view_context.capture(form, &@__vc_render_in_block)
      end
      super()
    end

    def get_slot(slot_name)
      content(@form) unless content_evaluated?
      super
    end
  end
end
