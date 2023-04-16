module SlotForm
  module Button
    class Component < VCFB::Component::Button
      if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
        renders_one :icon, "SlotForm::Button::Icon::Component"
      end
    end
  end
end
