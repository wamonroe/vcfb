module VCFB
  module Component
    class BaseCollection < Base
      private

      def content
        return unless instance_variable_defined?(:@builder)

        @__vc_content = if @view_context && @__vc_render_in_block
          view_context.capture(@builder, &@__vc_render_in_block)
        else
          default_content
        end
        super()
      end
    end
  end
end
