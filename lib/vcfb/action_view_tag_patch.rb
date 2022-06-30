module ActionView
  module Helpers
    module Tags
      class Base
        delegate :request, to: :@template_object
      end
    end
  end
end
