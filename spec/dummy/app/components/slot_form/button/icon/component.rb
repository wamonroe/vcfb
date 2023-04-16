module SlotForm
  module Button
    module Icon
      class Component < ViewComponent::Base
        def initialize(name:)
          @name = name
        end
      end
    end
  end
end
