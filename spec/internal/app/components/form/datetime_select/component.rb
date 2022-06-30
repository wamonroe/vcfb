module Form
  module DatetimeSelect
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, options = {}, html_options = {})
        @form = form
        @method = method
        @options = options
        @html_options = html_options
      end
    end
  end
end
