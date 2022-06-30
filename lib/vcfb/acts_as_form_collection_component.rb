require "active_support/concern"

require "vcfb/acts_as_form_component"

module VCFB
  module ActsAsFormCollectionComponent
    extend ActiveSupport::Concern
    include ActsAsFormComponent

    def content(builder)
      @__vc_content = if @view_context && @__vc_render_in_block
        view_context.capture(builder, &@__vc_render_in_block)
      else
        default_content(builder)
      end
      super()
    end
  end
end
