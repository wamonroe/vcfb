class SlotFormBuilder < VCFB::FormBuilder
  self.namespace = "slot_form"
end

module ComponentSpecHelper
  class MockComponent < ViewComponent::Base
    def call
      ""
    end
  end

  def mock_component
    MockComponent.new
  end

  def normalize_output(value)
    value.gsub(/\n\s*/, "").strip
  end
end
