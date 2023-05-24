module VCFB
  module Component
    class BaseField < Base
      def validation_errors
        @validation_errors ||= resource_errors? ? resource.errors[@method] : []
      end

      def validation_errors?
        validation_errors.present?
      end
    end
  end
end
