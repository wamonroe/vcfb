module Form
  module RichTextArea
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {})
        @form = form
        @method = method
        @options = options
      end

      delegate :rich_text_area_tag, to: :helpers
    end
  end
end
