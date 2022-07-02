module Form
  module DateSelect
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {}, html_options = {})
        @form = form
        @method = method
        @options = options
        @html_options = html_options
      end

      def form_element(options = {}, html_options = {})
        date_select(@form.object_name, @method, options, html_options)
      end
    end
  end
end
