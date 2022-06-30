module Form
  module TimeZoneSelect
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      def initialize(form, method, priority_zones = nil, options = {}, html_options = {})
        @form = form
        @method = method
        @priority_zones = priority_zones
        @options = options
        @html_options = html_options
      end
    end
  end
end
