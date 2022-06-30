module Form
  module Submit
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, text = nil, options = {})
        @form = form
        @text = text
        @options = options
      end
    end
  end
end
