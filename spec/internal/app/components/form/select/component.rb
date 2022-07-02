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

      def form_element(options = {}, html_options = {})
        select(@form.object_name, @method, @choices, options, html_options)
      end
    end
  end
end
