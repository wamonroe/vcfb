module SlotForm
  module Button
    class Component < ViewComponent::Base
      include VCFB::ActsAsFormComponent

      if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
        renders_one :icon, "SlotForm::Button::Icon::Component"
      end

      def initialize(form, text = nil, options = {})
        @form = form
        @text = text
        @options = options
      end

      def form_element(options = {}, &block)
        button_tag(options, &block)
      end
    end
  end
end
