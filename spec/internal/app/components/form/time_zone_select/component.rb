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

      def form_element(options = {}, html_options = {})
        time_zone_select(@form.object_name, @method, @priority_zones, options, html_options)
      end
    end
  end
end
