module Form
  module Select
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, choices = nil, options = {}, html_options = {})
        @form = form
        @method = method
        @choices = choices
        @options = options
        @html_options = html_options
      end

      def before_render
        @choices = content if content.present?
      end
    end
  end
end
