module VCFB
  module Component
    class Form < Base
      def initialize(model: nil, scope: nil, url: nil, format: nil, **options)
        run_callbacks :initialize do
          @model = model
          @scope = scope
          @url = url
          @format = format
          @options = options
          @form = nil
        end
      end

      # Because we've overridden the #content and #get_slot methods below to
      # support yielding the form, we need to save the component to our custom
      # form builder to support rendering slots in the form components.
      def form_tag(options = {}, &block)
        form_with(model: @model, scope: @scope, url: @url, format: @format, **options) do |form|
          form.form_component = self if form.respond_to?(:form_component=)
          @form = form
          block&.call(@form)
        end
      end

      private

      private

      # Override #content and #get_slot from ViewComponent so that we can yield
      # the form element (and not the component).
      def content
        if @view_context && @__vc_render_in_block
          @__vc_content = view_context.capture(@form, &@__vc_render_in_block)
        end
        super()
      end
    end
  end
end
