module MockComponentHelper
  class MockComponent < ViewComponent::Base
    def call
      ""
    end
  end

  def mock_component
    MockComponent.new
  end
end
