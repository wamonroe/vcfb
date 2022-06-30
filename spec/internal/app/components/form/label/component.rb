module Form
  module Label
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormLabelComponent

      def initialize(form, method, text = nil, options = {})
        @form = form
        @method = method
        @text = text
        @options = options
      end

      def before_render
        @text = content if content.present?
      end
    end
  end
end
