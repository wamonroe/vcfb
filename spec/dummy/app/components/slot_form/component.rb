module SlotForm
  class Component < VCFB::Component::Form
    if Gem::Version.new(ViewComponent::VERSION::STRING) >= Gem::Version.new("2.54.0")
      renders_one :header
    end
  end
end
