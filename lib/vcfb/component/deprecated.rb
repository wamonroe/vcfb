module VCFB
  module Component
    module Deprecated
      def inherited(subclass)
        warn "[DEPRECATION] Inheriting from #{name} is deprecated. " \
          "#{subclass.name} should inherit from a " \
          "SimpleField::Component or VCFB::Component::SimpleField instead."
        super
      end
    end
  end
end
